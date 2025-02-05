
use project_movie_database;

-- Can you get all data about movies? -- 
select * from movies;

-- How do you get all data about directors? --
select * from directors;

-- Check how many movies are present in IMDB. -- 
select count(*) as total_movies from movies;

-- Find these 3 directors: James Cameron ; Luc Besson ; John Woo
select * from directors 
where name in ('James Cameron', ' Luc Besson', 'John Woo');

-- Find all directors with name starting with S. -- 
Select name from directors 
where name like "s%";

-- Count female directors. -- 
select count(*) as female_director_count from directors 
where gender = 'female';

-- Find the name of the 10th first women directors? --
select * from directors
 where gender = 'female'
 order by uid asc limit 10;

-- What are the 3 most popular movies? -- 
select original_title, popularity from movies 
order by popularity desc limit 3;

-- What are the 3 most bankable movies? --
select original_title, revenue from movies
 order by revenue desc limit 3;

-- What is the most awarded average vote since the January 1st, 2000? --
select * from movies 
where release_date >='2000-1-1'
 order by vote_average desc, vote_count desc limit 1;
 
-- Which movie(s) were directed by Brenda Chapman? --          
SELECT original_title, d.name FROM movies AS m
JOIN directors AS d ON m.director_id = d.id
WHERE name = 'Brenda Chapman';

-- Which director made the most movies? --
select d.name from directors as d 
join movies as m on d.id = m.director_id
group by d.name 
order by count(m.id) desc limit 1;

-- Which director is the most bankable? --
select d.name from directors as d 
join movies as m on d.id = m.director_id 
group by d.name 
order by max(revenue) desc limit 1 ;


 