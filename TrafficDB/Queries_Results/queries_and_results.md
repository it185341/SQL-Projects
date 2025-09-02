## 1. Display the registration numbers of vehicles that were photographed and then re-photographed by the same or different camera(s) within a time interval of one minute or less.
### Query: ###

          SELECT DISTINCT i1.reg
          FROM image i1
          JOIN image i2
          ON i1.reg = i2.reg
          AND i1.whn < i2.whn
          AND EXTRACT(EPOCH FROM (i2.whn - i1.whn)) <= 60;
		  
### Results: ###
| reg       | 
| --------- |
| SO 02 RSP |



## 2. Display the details of citizens (each citizen appears only once in the result) whose vehicles have been recorded by camera 2 and camera 5. The result should be calculated using the IN operator.
### Query: ###

          SELECT  K.* 
	      FROM keeper K JOIN vehicle V ON K.id = V.keeper
		  JOIN image I ON I.reg = V.id
	      WHERE I.camera = 2 AND K.id IN (SELECT  V.keeper 
										  FROM vehicle V JOIN image I ON I.reg = V.id
										  WHERE I.camera = 5)
		  
### Results: ###
| id    | name               | address         |
| ----- | ------------------ | --------------- |
| 6     |Incongruous, Ingrid | Irresolution Pl |

## 3. Display the details of citizens (each citizen appears only once in the result) whose vehicles have been recorded by camera 2 and camera 5. The result should be calculated using the INTERSECT operator.
### Query: ###

         SELECT  K.* 
	     FROM keeper K JOIN vehicle V ON K.id = V.keeper
		 JOIN image I ON I.reg = V.id
	     WHERE I.camera = 2 
	     INTERSECT 
	     SELECT  K.* 
	     FROM keeper K JOIN vehicle V ON K.id = V.keeper
		 JOIN image I ON I.reg = V.id
	     WHERE I.camera = 5
		  
### Results: ###
| id    | name               | address         |
| ----- | ------------------ | --------------- |
| 6     |Incongruous, Ingrid | Irresolution Pl |

## 4. Display the details of citizens (each citizen appears only once in the result) whose vehicles have been recorded by camera 2 and camera 5. The result should be calculated using the EXISTS operator.
### Query: ###

          SELECT  K.* 
	      FROM keeper K JOIN vehicle V ON K.id = V.keeper
		  JOIN image I ON I.reg = V.id
	      WHERE I.camera = 2 AND 
          EXISTS (SELECT  * 
		  		  FROM vehicle V1 JOIN image I1 ON I1.reg = V1.id
				  WHERE I1.camera = 5 and K.id = V1.keeper)

		  
### Results: ###
| id    | name               | address         |
| ----- | ------------------ | --------------- |
| 6     |Incongruous, Ingrid | Irresolution Pl |

## 5. Display the details of citizens (each citizen appears only once in the result) whose vehicles have been recorded by camera 2 and camera 5. The result should be calculated by completing the given code using the IN operator
### Query: ###

            WITH
	        Photographed_by5 AS (SELECT V.keeper
						                   FROM vehicle V JOIN image I ON I.reg=V.id
	 					                   WHERE I.camera=5)	  
        	SELECT K.id, K.name, K.address
        	FROM  keeper K JOIN vehicle V on K.id = V.keeper
        	JOIN image I on I.reg = V.id
        	WHERE I.camera=2 AND K.id IN (SELECT K.id FROM Photographed_by5)

		  
### Results: ###
| id    | name               | address         |
| ----- | ------------------ | --------------- |
| 6     |Incongruous, Ingrid | Irresolution Pl |

## 6. Display the details of citizens (each citizen appears only once in the result) whose vehicles have been recorded by camera 2 and camera 5. The result should be calculated by completing the given code using the EXISTS operator.
### Query: ###

          SELECT DISTINCT K.name, K.address
          FROM keeper K
          WHERE EXISTS (SELECT 1
                        FROM vehicle V
                        JOIN image I ON I.reg = V.id
                        WHERE V.keeper = K.id
                        AND I.camera = 2)
          AND EXISTS    (SELECT 1
                         FROM vehicle V
                         JOIN image I ON I.reg = V.id
                         WHERE V.keeper = V.id
                         AND I.camera = 5)
		 
### Results: ###
| id    | name               | address         |
| ----- | ------------------ | --------------- |
| 6     |Incongruous, Ingrid | Irresolution Pl |

## 7.Create a view Min_Intervals with columns reg and min_i, where each row shows a vehicle’s registration number and the time interval (min_i) elapsed from the moment the vehicle's permit was issued until the first time it was photographed by a ring camera using that specific permit.
### Query: ###

            CREATE VIEW Min_Intervals  AS (
        		SELECT I.reg, min(whn- sdate) AS min_i
        		FROM image I JOIN permit P ON I.reg = P.reg
        		WHERE whn > sdate
        		GROUP BY I.reg )

            SELECT * FROM Min_Intervals
   
### Results: ###
| reg       | min_i                  |
| --------- | ---------------------- |
| SO 02 FSP | 18:08:00               |
| SO 02 ESP | 4 days 17:16:11        | 
| SO 02 SSP | 4 days 16:28:40        |
| SO 02 CSP | 35 days 06:57:31       |
| SO 02 RSP | 26 days 16:38:31       |
| SO 02 ISP | 391 days 16:58:01      |
| SO 02 HSP | 400 days 16:45:04      |
| SO 02 DSP | 26 days 16:29:11       |
| SO 02 TSP | 07:20:01               |
| SO 02 JSP | 35 days 17:07:00       |


## 8.Extend the structure and content of the Min_Intervals view (reg, min_i) created in Exercise 11 by adding the details of the owner of the corresponding vehicle. Organize this information into a new view named MIN_Intervals_Owners with the following structure: (Owner_ID, Owner_name, Vehicle, MIN_Interval)
### Query: ###

            CREATE VIEW Min_Intervals_Owners(Owner_ID, Owner_name, Vehicle, MIN_Interval) AS( SELECT K.id , K.name , MI.reg, MI.min_i
				                                                                                      FROM  vehicle V JOIN keeper K ON V.keeper = K.id
									                                                                            JOIN Min_Intervals MI ON  MI.reg = V.id) 
            
            SELECT * FROM Min_Intervals_Owners
   
### Results: ###
| owner_id  | owner_name          | vehicle   | min_interval      |
| --------- | ------------------- | --------- | ----------------- |
| 1         | Ambiguous, Arthur   | SO 02 CSP | 35 days 06:57:31  |
| 4         | Strenuous, Sam      | SO 02 DSP | 26 days 16:29:11  |
| 1         | Ambiguous, Arthur   | SO 02 ESP | 4 days 17:16:11   |
| 3         | Contiguous, Carol   | SO 02 FSP | 18:08:00          |
| 5         | Assiduous, Annie    | SO 02 HSP | 400 days 16:45:04 |
| 6         | Incongruous, Ingrid | SO 02 ISP | 391 days 16:58:01 |
| 2         | Inconspicuous, Iain | SO 02 JSP | 35 days 17:07:00  |
| 1         | Ambiguous, Arthur   | SO 02 RSP | 26 days 16:38:31  |
| 2         | Inconspicuous, Iain | SO 02 SSP | 4 days 16:28:40   |
| 6         | Incongruous, Ingrid | SO 02 TSP | 07:20:01          |

            
## 9. Using the Min_Intervals and MIN_Intervals_Owners views, display the name(s) of the owner(s) of the vehicle(s) that were photographed by a camera in the shortest interval (min_i) that elapsed from the issuance of the corresponding vehicle entry permit to the first capture by a ring camera.
### Query: ###
            SELECT *
          	FROM Min_Intervals_Owners
          	WHERE MIN_Interval = (SELECT min(min_i) FROM Min_Intervals)
	 
### Results: ###
| owner_id  | owner_name          | vehicle   | min_interval  |
| --------- | ------------------- | --------- | ------------- |
| 6         | Incongruous, Ingrid | SO 02 TSP | 07:20:01      |

            
## 10. Drop the `Min_Intervals` and `MIN_Intervals_Owners` views, and compute the answer to the previous query using runtime views (`WITH … SELECT …`).
### Query: ###
            DROP VIEW  Min_Intervals_Owners
            DROP VIEW Min_Intervals
            
            WITH Min_Intervals AS (
                SELECT V.id AS reg,
                EXTRACT(EPOCH FROM (MIN(I.whn) - p.sDate)) / 60 AS min_i
                FROM vehicle V
                JOIN permit P ON V.id = P.reg
                JOIN image I  ON V.id = I.reg
                GROUP BY V.id, P.sDate
            ),
            Min_Intervals_Owners AS (
                SELECT K.id AS owner_id,
                       K.name AS owner_name,
                       V.id   AS vehicle,
                       M.min_i
                FROM keeper K
                JOIN vehicle V ON K.id = V.keeper
                JOIN Min_Intervals M ON V.id = M.reg
            )
            SELECT owner_name, vehicle, min_i
            FROM Min_Intervals_Owners
            WHERE min_i = (SELECT MIN(min_i) FROM Min_Intervals_Owners);
  
### Results: ###
| owner_name        | vehicle   | min_i          |
| ----------------- | --------- | -------------- |
| Ambiguous, Arthur | SO 02 ASP | -626029.783333 |



## 11. Improve the code from Exercise 14 so that it also calculates (as integer numbers) the number of **days**, **hours**, and **minutes** that elapsed from the issuance of the vehicle’s entry permit to the time it was first photographed by a ring camera.
### Query: ###

            WITH First_Photo AS (
            SELECT V.id AS reg,
                   MIN(i.whn) AS first_photo_time,
                   P.sDate AS permit_time
            FROM vehicle V
            JOIN permit P ON V.id = P.reg
            JOIN image I ON V.id = I.reg
            GROUP BY V.id, P.sDate)
            SELECT K.name AS owner_name,
                   V.id AS vehicle,
                   EXTRACT(DAY FROM (F.first_photo_time - f.permit_time)) AS days,
                   EXTRACT(HOUR FROM (F.first_photo_time - f.permit_time)) AS hours,
                   EXTRACT(MINUTE FROM (F.first_photo_time - f.permit_time)) AS minutes
            FROM First_Photo F
            JOIN vehicle V ON F.reg = V.id
            JOIN keeper K ON V.keeper = K.id;
		
### Results: ###
| Owner Name          | Vehicle   | Days | Hours | Minutes |
| ------------------- | --------- | ---- | ----- | ------- |
| Ambiguous, Arthur   | SO 02 ESP | 4    | 17    | 16      |
| Ambiguous, Arthur   | SO 02 ASP | -434 | -17   | -49     |
| Incongruous, Ingrid | SO 02 TSP | 0    | 7     | 20      |
| Inconspicuous, Iain | SO 02 SSP | 4    | 16    | 28      |
| Ambiguous, Arthur   | SO 02 ASP | -344 | -17   | -49     |
| Inconspicuous, Iain | SO 02 JSP | 35   | 17    | 7       |
| Strenuous, Sam      | SO 02 DSP | 26   | 16    | 29      |
| Assiduous, Annie    | SO 02 HSP | 400  | 16    | 45      |
| Ambiguous, Arthur   | SO 02 CSP | 35   | 6     | 57      |
| Incongruous, Ingrid | SO 02 GSP | -2   | -16   | -50     |
| Ambiguous, Arthur   | SO 02 RSP | 26   | 16    | 38      |
| Contiguous, Carol   | SO 02 FSP | 0    | 18    | 8       |
| Incongruous, Ingrid | SO 02 ISP | 391  | 16    | 58      |
