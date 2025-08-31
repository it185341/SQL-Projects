## 1. Columbia movies with video stock > 10
### Query: ###
SELECT title
FROM movie
WHERE production_company = 'Columbia' AND stock_video > 10
### Results: ###
| title             | video_stock |
|-------------------|------------|
| The way we were   | 15         |

# Display the titles of the films (once each) on the pages either Robert Redford has acted in or Bradford Dillman has acted in
### Query: ###
SELECT DISTINCT movie_title
FROM participation
WHERE (actor_last_name = 'Redford' AND actor_first_name = 'Robert') 
   OR (actor_last_name = 'Dillman' AND actor_first_name = 'Bradford')
### Results: ###
| movie_title      |
|------------------|
| The way we were  |
# Display the films (once each) that were shown for more than 15 weeks in a cinema
### Query: ###
SELECT DISTINCT movie_title
FROM cinema
WHERE weeks > 15
### Results: ###
| movie_title      |
|------------------|
| The way we were  |

# The Cartesian product of the tables “Participation” and “Cinema”
### Query: ###
SELECT *
FROM participation, cinema
### Results: ###
| movie_title           | actor_last_name | actor_first_name | hall         | movie_title_          | weeks |
|-----------------------|----------------|-----------------|-------------|----------------------|-------|
| A night at the opera  | Marx Brothers  | -               | STER CENTURY| A night in the opera  | 24    |
| Pretty woman          | Alexander      | Jason           | STER CENTURY| A night in the opera  | 24    |
| Pretty woman          | Gere           | Richard         | STER CENTURY| A night in the opera  | 24    |
| ...                   | ...            | ...             | ...         | ...                  | ...   |

# Create a join of the “Participation” and “Cinema” tables
### Query: ###
SELECT *
FROM participation P
JOIN cinema C ON P.movie_title = C.movie_title
### Results: ###
| movie_title      | actor_last_name | actor_first_name | hall         | movie_title_    | weeks |
|------------------|----------------|-----------------|-------------|----------------|-------|
| Pretty woman     | Roberts        | Julia           | STER CENTURY| Pretty woman   | 35    |
| Pretty woman     | Gere           | Richard         | STER CENTURY| Pretty woman   | 35    |
| Pretty woman     | Alexander      | Jason           | STER CENTURY| Pretty woman   | 35    |
| ...              | ...            | ...             | ...         | ...            | ...   |

# Which films (once each) were shown in the "TITANIA" hall or in the "VILLAGE" hall
### Query: ###
SELECT DISTINCT movie_title
FROM participation P
JOIN cinema C ON P.movie_title = C.movie_title
WHERE hall = 'TITANIA' OR hall = 'VILLAGE'
### Results: ###
| movie_title       |
|------------------ |
| American Made     |
| Apocalypse Now    |
| Pretty woman      |
| Prince of Tides   |
| Schindler’s List  |
| The Godfather     |

# Display (once) the titles of films shown in the "STER CENTURY" room with DVD price > 31 euros
### Query: ###
SELECT DISTINCT C.movie_title
FROM cinema C
JOIN movie M ON C.movie_title = M.title
WHERE hall = 'STER CENTURY' AND price_dvd > 31
### Results: ###
| movie_title      |
|------------------|
| American Made    |
| Pretty woman     |
| The Godfather    |
| The way we were  |

# Display the names of actors in films produced by 'Columbia' and shown for more than 10 weeks
### Query: ###
SELECT DISTINCT P.actor_last_name, P.actor_first_name
FROM participation P
JOIN movie M ON P.movie_title = M.title
JOIN cinema C ON P.movie_title = C.movie_title
WHERE production_company = 'Columbia' AND weeks > 10
### Results: ###
| actor_last_name  | actor_first_name |
|-----------------|-----------------|
| Danner          | Blythe          |
| Dillman         | Bradford        |
| Nolte           | Nick            |
| Redford         | Robert          |
| Streisand       | Barbra          |
