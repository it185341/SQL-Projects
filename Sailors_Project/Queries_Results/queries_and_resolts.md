## 1. Write and execute SQL code that inserts a new row into the reservation table with the following data: "The sailor with code 13 makes a reservation to sail the boat with code 88 on 19/10/2013. The boat will be picked up from the marina with code 5'.
### Query: ###

          	INSERT INTO reservation(sid,bid,mid,r_date) VALUES (13,88,5,'2013-10-19');
		  
### Results: ###
INSERT 0 1

## 2. Write and execute SQL code that inserts a new row into the boat table with the following data: 'Boat code: 32, Boat name: Galanoula, Color: Blue'
### Query: ###
  
            INSERT INTO boat(bid,bname,color) VALUES (32,'Bluey','Blue');

### Results: ###
INSERT 0 1
  
## 3. Write and execute SQL code to insert a new row into the sailor table with the following data: 'Code: 3, Name: Fanouris, Rating: 7 and the appropriate age
  --We have an age restriction: participants must be 18 years old or younger.
### Query: ###

          	INSERT INTO sailor(sid,sname,rating,age) VALUES(3,'Fanouris',7,18);
		  
### Results: ###
INSERT 0 1

## 4. Write and execute the SQL code that changes the SID of sailor 1,Christina in the sailor table to 111. 
### Query: ###

          	UPDATE sailor SET sid='111' WHERE sname ='Christina';
		  
### Results: ###
UPDATE 0

## 5. Write and execute the SQL code that deletes the record of sailor 1,Christina from the sailor table.
### Query: ###

         	DELETE FROM sailor WHERE sname ='Christina';
		  
### Results: ###
UPDATE 0

## 6. Write and execute the SQL code that deletes ALL reservations related to the sailor with code 19 from the reservation table.
### Query: ###

         	DELETE FROM reservation WHERE sid =19;
		 
### Results: ###
UPDATE 0

## 7. Write and execute the SQL code that deletes the marina located in Possidi (Kassandra, Halkidiki) from the marina table.
### Query: ###
  
      	  	DELETE FROM marina WHERE name ='Poseidi';
   
### Results: ###
DELETE 1

 --Recreate the database and its information content
## 8. to enrich the relational schema of the database with an additional table:  
**type (k_type,description)** with the following characteristics:

- The column **k_type** is the primary key of the new table and stores integer values in the range `1, 2, …, 13`.  
- Each boat in the database belongs to a specific type, e.g., boat `88` is of type `2` (schooner).  
- The boats already stored in the table **boat** belong to the following types:  
   - Codes `1, 17, 19, 72`: trawlers  
   - Codes `13, 88`: schooners  
   - Code `77`: `NULL` (the type of this boat has not been specified)  
- We want the database to store this additional information, and to automatically update the type of all corresponding boats to `NULL` whenever a specific type of boat is deleted from the table **type**.  
### Query: ###
        
            CREATE TABLE type(
          		k_type INTEGER NOT NULL CONSTRAINT pk_type PRIMARY KEY CONSTRAINT c_type CHECK (k_type <13),
          		description VARCHAR(40)
          	);
   
### Results: ###
CREATE TABLE
  
### Query: ###
        
            ALTER TABLE boat ADD type INTEGER CONSTRAINT f_k_type REFERENCES type(k_type) ON DELETE SET NULL
   
### Results: ###
ALTER TABLE

### Query: ###
        
            INSERT INTO type(k_type , description) VALUES (1, 'trawler') , (2, 'schooner') ;
          	INSERT INTO type(k_type , description) VALUES (1, 'trawler') , (2, 'schooner') ;
        	UPDATE boat SET type = 1 WHERE bid = 1 OR bid = 17 OR bid = 19 OR bid = 72 ;
        	UPDATE boat SET type = 2 WHERE bid = 13 OR bid = 88;
        	SELECT * FROM boat b JOIN type t on b.type = t.k_type
   
### Results: ###
| bid | bname           | color       | type | k\_type | description |
| --- | --------------- | ----------- | ---- | ------- | ----------- |
| 17  | Agia Aikaterini | Light Green | 1    | 1       | trawler     |
| 1   | Agios Nikolas   | Red         | 1    | 1       | trawler     |
| 72  | Christinaki     | Red         | 1    | 1       | trawler     |
| 19  | Delos           | Light Green | 1    | 1       | trawler     |
| 88  | Sofia           | Blue        | 2    | 2       | schooner    |
| 13  | Panagis         | Yellow      | 2    | 2       | schooner    |

            
## 9. What is the maximum capacity of a marina whose name begins with "P"?
### Query: ###
  
        SELECT MAX(capacity) FROM marina WHERE name LIKE 'P%' 
	 
### Results: ###
| max              |
| ---------------- |
| 300              |
            
## 10. Using the MIN() function, calculate the minimum marina capacity value whose name begins with 'Π' and is at least seven (7) characters long.
### Query: ###
  
      SELECT MIN(capacity) FROM marina WHERE name LIKE  'P______%'  
  
### Results: ###
| min              |
| ---------------- |
| 32               |


## 11. Write SQL code that uses the EXCEPT operator/syntax component and calculates the codes (sid) and names (sname) of sailors who have not booked on a red vessel.
### Query: ###
        SELECT S.sid,S.sname
	    FROM sailor S
	    EXCEPT
		SELECT S.sid,S.sname
		FROM sailor S JOIN reservation R ON S.sid = R.sid
					  JOIN boat B ON R.bid = B.bid
		WHERE color = 'Red'
          
### Results: ###
| sid | sname      |
| --- | ---------- |
| 15  | Theo       |
| 17  | Eleftheria |
| 2   | John       |
| 12  | Thanos     |
| 11  | Maria      |
| 13  | John       |
| 27  | Marianthi  |
| 16  | Leo        |
| 19  | Polycarp   |
        
## 12. Find the sailors (name and sid) who picked up a rented boat from the marina “Porto Carras”.Similarly, we want to find the sailors who picked up a rented boat from the marina “Ouranoupolis”.
How can the two individual results be combined in order to answer the question:
"Which sailors rented and picked up a boat from both the marina at Porto Carras and the marina at Ouranoupolis?"
### Query: ###
       SELECT  S.sid,S.sname 
  	   FROM  sailor S JOIN reservation R ON S.sid = R.sid
  	   JOIN marina M ON R.mid = M.mid
  	   WHERE M.name = 'Porto Carras' 
	   INTERSECT
       SELECT  S.sid,S.sname 
       FROM  sailor S JOIN reservation R ON S.sid = R.sid
       JOIN marina M ON R.mid = M.mid
       WHERE M.name = 'Ouranoupolis'
	 
### Results: ###
| sid | sname    |
| --- | -------- |
| 1   | Xristina |
| 11  | Maria    |

## 13. Boats (name and bid) which were either rented from sailors whose rating is 8, or rented and picked up from the marina located in Ouranoupolis.
### Query: ###
       SELECT   bname, B.bid 
	   FROM boat B INNER JOIN reservation R ON B.bid = R.bid
	   INNER JOIN sailor S ON R.sid= S.sid
       WHERE S.rating = 8 
       UNION
       SELECT bname , B.bid
	   FROM boat B INNER JOIN reservation R ON B.bid = R.bid
	   INNER JOIN marina M ON R.mid = R.mid
       WHERE M.name = 'Ouranoupolis'
	   
### Results: ###
| bname           | bid |
| --------------- | --- |
| Delos           | 19  |
| Agios Georgios  | 77  |
| Agios Nikolas   | 1   |
| Panagis         | 13  |
| Christinaki     | 72  |
| Sofia           | 88  |
| Agia Aikaterini | 17  |


## 14. Names of marinas (once each) that have both red and blue boats for rent
### Query: ###
      	SELECT M.name
	    FROM marina M INNER JOIN reservation R ON M.mid = R.mid
		INNER JOIN boat B ON B.bid = R.bid
    	WHERE B.color = 'Red'
    	INTERSECT 
    	SELECT M.name
    	FROM marina M INNER JOIN reservation R ON M.mid = R.mid
    	INNER JOIN boat B ON B.bid = R.bid
    	WHERE  B.color = 'Blue' 
  
### Results: ###
| name         |
| ------------ |
| Ouranoupolis |
| Porto Carras |

## 15. Display the names of the sailors and the names of the boats they rented from the 'Porto Carras' marina
### Query: ###
      SELECT  sname , bname
	  FROM sailor S INNER JOIN reservation R ON S.sid = R.sid
	  INNER JOIN boat B ON B.bid = R.bid
	  INNER JOIN marina M ON M.mid = R.mid
	  WHERE M.name = 'Porto Carras'
  
### Results: ###
| sname    | bname           |
| -------- | --------------- |
| Maria    | Panagis         |
| Xristina | Agios Nikolas   |
| Xristina | Panagis         |
| Xristina | Agia Aikaterini |
| Xristina | Delos           |
| Xristina | Christinaki     |
| Xristina | Sofia           |
| Polycarp | Panagis         |

## 16. Find pairs of names of ships of the same color. The result will contain 2 columns. Each column will record a name.
### Query: ###
      SELECT B1.bname , B2.bname  
	  FROM  boat B1, boat B2
	  WHERE B1.color = B2.color AND B1.bid >  B2.bid
  
### Results: ###
| bname       | bname           |
| ----------- | --------------- |
| Christinaki | Agios Nikolas   |
| Delos       | Agia Aikaterini |
| Sofia       | Agios Georgios  |
