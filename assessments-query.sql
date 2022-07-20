select * from progress
select * from users
/* What are the Top 25 schools (.edu domains)? */

select email_domain, count(email_domain) AS Count
from users
group by postal
order by count(email_domain) desc

/*How many .edu learners are located in New York?*/
select count(city) AS edu_learners
from users
where city='New York';

/* The mobile_app column contains either mobile-user or NULL. How many of these Codecademy learners are using the mobile app? */
SELECT count(mobile_app) AS Codecademy_Learners
FROM users
where mobile_app='mobile-user';

select * from users
/*  query for the sign up counts for each hour. */
SELECT count(sign_up_at) AS Sign_up_count, DATE_FORMAT(sign_up_at, '%H') AS Hour
FROM users
group by 2
order by 2 

/* Do different schools (.edu domains) prefer different courses? */
/* https://dba.stackexchange.com/questions/65416/how-to-select-multiple-count-columns-with-each-group-by-having-a-different-wh */
select * from progress
select * from users

SELECT progress.user_id, email_domain, 
	SUM(CASE when progress.learn_cpp='started' OR progress.learn_cpp='completed' THEN 1 ELSE 0 END) AS Count_CPP, 
	SUM(CASE when progress.learn_sql='started' OR progress.learn_sql='completed' THEN 1 ELSE 0 END) AS Count_SQL, 
	SUM(CASE when progress.learn_html='started' OR progress.learn_html='completed' THEN 1 ELSE 0 END) AS Count_HTML, 
	SUM(CASE when progress.learn_javascript='started' OR progress.learn_javascript='completed' THEN 1 ELSE 0 END) AS Count_JavaScript, 
	SUM(CASE when progress.learn_java='started' OR progress.learn_java='completed' THEN 1 ELSE 0 END) AS Count_Java
FROM progress INNER JOIN users
ON progress.user_id = users.user_id
group by email_domain;

/* What courses are the New Yorkers students taking? */
SELECT progress.user_id, city, 
	SUM(CASE when progress.learn_cpp='started' OR progress.learn_cpp='completed' THEN 1 ELSE 0 END) AS Count_CPP, 
	SUM(CASE when progress.learn_sql='started' OR progress.learn_sql='completed' THEN 1 ELSE 0 END) AS Count_SQL, 
	SUM(CASE when progress.learn_html='started' OR progress.learn_html='completed' THEN 1 ELSE 0 END) AS Count_HTML, 
	SUM(CASE when progress.learn_javascript='started' OR progress.learn_javascript='completed' THEN 1 ELSE 0 END) AS Count_JavaScript, 
	SUM(CASE when progress.learn_java='started' OR progress.learn_java='completed' THEN 1 ELSE 0 END) AS Count_Java
FROM progress INNER JOIN users
ON progress.user_id = users.user_id
WHERE city='New York'
group by email_domain;

/* What courses are the Chicago students taking? */
SELECT progress.user_id, city, 
	SUM(CASE when progress.learn_cpp='started' OR progress.learn_cpp='completed' THEN 1 ELSE 0 END) AS Count_CPP, 
	SUM(CASE when progress.learn_sql='started' OR progress.learn_sql='completed' THEN 1 ELSE 0 END) AS Count_SQL, 
	SUM(CASE when progress.learn_html='started' OR progress.learn_html='completed' THEN 1 ELSE 0 END) AS Count_HTML, 
	SUM(CASE when progress.learn_javascript='started' OR progress.learn_javascript='completed' THEN 1 ELSE 0 END) AS Count_JavaScript, 
	SUM(CASE when progress.learn_java='started' OR progress.learn_java='completed' THEN 1 ELSE 0 END) AS Count_Java
FROM progress INNER JOIN users
ON progress.user_id = users.user_id
WHERE city='Chicago'
group by email_domain;