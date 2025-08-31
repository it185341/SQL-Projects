## 1. Columbia movies with video stock > 10
###Query:###

          SELECT title
		  
          FROM movie
		  
          WHERE production_company = 'Columbia' AND stock_video > 10
		  
###Results:###
| title                 | video_stock |
| --------------------- | ----------- |
| The way we were       | 15          |

## 2. Display the titles of the films (once each in the result) on the pages either Robert Redford has acted in or Bradford Dillman has acted in.
###Query:###

          SELECT DISTINCT movie_title
          FROM participation
          WHERE (actor_last_name = 'Redford' AND actor_first_name = 'Robert') OR (actor_last_name = 'Dillman' AND actor_first_name = 'Bradford')
		  
###Results:###
| movie_title     |
| --------------- |
| The way we were |

## 3. Display the films (once each) that were shown for more than 15 weeks in a cinema.
###Query:###
          SELECT DISTINCT movie_title
          FROM cinema
          WHERE weeks > 15
###Results:###
| movie_title     |
| --------------- |
| The way we were |

## 4. The Cartesian product of the tables “Participation” and “Cinema” is created.
###Query:###
          SELECT *
          FROM participation,cinema
###Results:###
| movie_title          | actor_last_name   | actor_first_name   | hall         | movie_title_         | weeks |
| -------------------- | ----------------- | ------------------ | ------------ | -------------------- | ----- |
| A night at the opera | Marx Brothers     | -                  | STER CENTURY | A night in the opera | 24    |
| Pretty woman         | Alexander         | Jason              | STER CENTURY | A night in the opera | 24    |
| Pretty woman         | Gere              | Richard            | STER CENTURY | A night in the opera | 24    |
| Pretty woman         | Roberts           | Julia              | STER CENTURY | A night in the opera | 24    |
| Prince of Tides      | Streisand         | Barbra             | STER CENTURY | A night in the opera | 24    |
| Prince of Tides      | Nolte             | Nick               | STER CENTURY | A night in the opera | 24    |
| Prince of Tides      | Danner            | Blythe             | STER CENTURY | A night in the opera | 24    |
| The way we were      | Redford           | Robert             | STER CENTURY | A night in the opera | 24    |
| …                    | …                 | …                  | …            | …                    | …     |
594 rows affected.

## 5. Create a join of the “Participation” and “Cinema” tables by enforcing an equality condition on the column that the two tables have in common.
###Query:###
          SELECT *
          FROM participation,cinema
###Results:###
| movie_title          | actor_last_name   | actor_first_name   | hall         | weeks |
| -------------------- | ----------------- | ------------------ | ------------ | ----- |
| A night at the opera | Marx Brothers     | -                  | STER CENTURY | 24    |
| A night at the opera | Marx Brothers     | -                  | VILLAGE      | 28    |
| Pretty woman         | Alexander         | Jason              | STER CENTURY | 35    |
| Pretty woman         | Alexander         | Jason              | VILLAGE      | 28    |
| Pretty woman         | Gere              | Richard            | STER CENTURY | 35    |
| Pretty woman         | Gere              | Richard            | VILLAGE      | 28    |
| Pretty woman         | Roberts           | Julia              | STER CENTURY | 35    |
| Pretty woman         | Roberts           | Julia              | VILLAGE      | 28    |
| …                    | …                 | …                  | …            | …     |
63 rows affected.

## 6. Create a join between the “Participation” and “Cinema” tables using the JOIN operator.
###Query:###
         SELECT *
         FROM participation P JOIN cinema C ON P.movie_title = C.movie_title
###Results:###
| movie_title     | actor_last_name   | actor_first_name   | hall         | movie_title_    | weeks |
| --------------- | ----------------- | ------------------ | ------------ | --------------- | ----- |
| Pretty woman    | Roberts           | Julia              | STER CENTURY | Pretty woman    | 35    |
| Pretty woman    | Gere              | Richard            | STER CENTURY | Pretty woman    | 35    |
| Pretty woman    | Alexander         | Jason              | STER CENTURY | Pretty woman    | 35    |
| Prince of Tides | Danner            | Blythe             | STER CENTURY | Prince of Tides | 10    |
| Prince of Tides | Nolte             | Nick               | STER CENTURY | Prince of Tides | 10    |
| Prince of Tides | Streisand         | Barbra             | STER CENTURY | Prince of Tides | 10    |
| The way we were | Streisand         | Barbra             | STER CENTURY | The way we were | 20    |
| The way we were | Dillman           | Bradford           | STER CENTURY | The way we were | 20    |
| …               | …                 | …                  | …            | …               | …     |
63 rows affected.

## 7.Create a natural join of the tables “participation” and “cinema” using the JOIN operator.
###Query:###
        SELECT *
	      FROM participation NATURAL JOIN cinema
###Results:###
| movie_title     | actor_last_name   | actor_first_name   | hall         | movie_title_    | weeks |
| --------------- | ----------------- | ------------------ | ------------ | --------------- | ----- |
| Pretty woman    | Roberts           | Julia              | STER CENTURY | Pretty woman    | 35    |
| Pretty woman    | Gere              | Richard            | STER CENTURY | Pretty woman    | 35    |
| Pretty woman    | Alexander         | Jason              | STER CENTURY | Pretty woman    | 35    |
| Prince of Tides | Danner            | Blythe             | STER CENTURY | Prince of Tides | 10    |
| Prince of Tides | Nolte             | Nick               | STER CENTURY | Prince of Tides | 10    |
| Prince of Tides | Streisand         | Barbra             | STER CENTURY | Prince of Tides | 10    |
| The way we were | Streisand         | Barbra             | STER CENTURY | The way we were | 20    |
| The way we were | Dillman           | Bradford           | STER CENTURY | The way we were | 20    |
| …               | …                 | …                  | …            | …               | …     |
63 rows affected.

## 8.Which films (once each in the result) were shown in the "TITANIA" hall or in the "VILLAGE" hall?
###Query:###
        SELECT *
	      FROM participation NATURAL JOIN cinema
###Results:###
| movie_title      |
| ---------------- |
| American Made    |
| Apocalypse Now   |
| Pretty woman     |
| Prince of Tides  |
| Schindler’s List |
| The Godfather    |
            
## 9. Which films (once each in the result) were shown in the "TITANIA" hall for more than 8 weeks?
###Query:###
        SELECT DISTINCT C.movie_title
	      FROM cinema C JOIN participation P ON C.movie_title = P.movie_title
	      WHERE hall = 'TITANIA' AND weeks > 8
###Results:###
| movie_title      |
| ---------------- |
| The Godfather    |
            
## 10. Which films (once each in the result) have either been screened in the "TITANIA" Theater, or have been screened for over 30 weeks in a theater?
###Query:###
        SELECT DISTINCT C.movie_title
		    FROM cinema C JOIN participation P ON C.movie_title = P.movie_title
		    WHERE hall = 'TITANIA' OR weeks > 30
###Results:###
| movie_title      |
| ---------------- |
| Pretty woman     |
| Schindler’s List |
| The way we were  |
| The Godfather    |
| Apocalypse Now   |
| American Made    |


## 11. Create the conjunction of the tables “Participation” and “Cinema” and apply an appropriate selection condition to display the theaters where a movie starring the actor “Robert Redford” was shown for more than 10 weeks.
###Query:###
        SELECT DISTINCT C.hall
        FROM cinema C JOIN participation P ON C.movie_title = P.movie_title
        WHERE (actor_last_name = 'Redford' AND actor_first_name = 'Robert') AND (weeks > 10)
###Results:###
| hall         |
| ------------ |
| ASSOS        |
| ODEON        |
| METROPOLITAN |
| STER CENTURY |
        
## 12. Display (once in the result) the titles of the films that have been screened in the "STER CENTURY" room and whose DVD price is greater than 31 euros.
###Query:###
        SELECT DISTINCT C.movie_title
	      FROM cinema C JOIN MOVIE M ON C.movie_title = M.title
	      WHERE hall = 'STER CENTURY' AND price_dvd > 31
###Results:###
| movie_title    |
| --------------- |
| American Made   |
| Pretty woman    |
| The Godfather   |
| The way we were |
## 13. Display (once in the result) the names and surnames of the actors who appear in films produced by 'Columbia' and have been shown for more than 10 weeks in a cinema
###Query:###
        SELECT DISTINCT P.actor_last_name, P.actor_first_name
      	FROM participation P JOIN movie M ON P.movie_title = M.title
      				JOIN cinema C ON P.movie_title = C.movie_title
      	WHERE production_company = 'Columbia' AND weeks > 10 
###Results:###
| actor_last_name   | actor_first_name   |
| ----------------- | ------------------ |
| Danner            | Blythe             |
| Dillman           | Bradford           |
| Nolte             | Nick               |
| Redford           | Robert             |
| Streisand         | Barbra             |

