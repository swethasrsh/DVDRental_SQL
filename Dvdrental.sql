/*QUESTION- We want to send out a promotional email to the existing customers. Write a query to retieve the data*/
SELECT first_name,last_name,email FROM CUSTOMER;

/*SITUATION- An Austalian visitor isn't familiar with MPAA movie ratings( eg PG,PG-13). We want to know the type of ratings in the date
base. What all ratings are available?*/
SELECT DISTINCT(rating) FROM film;

/*A customer forgot their wallet at our store. The team need to track down their email to inform them. What is the email for the customer with name Nancy Thomas? */
SELECT email FROM CUSTOMER WHERE first_name='Nancy' AND last_name='Thomas';

/*A customer wants to know what the movie "Outlaw Hanky" is about. Could you give them the description for the movie "Outlaw Hanky". */
SELECT description FROM film WHERE title='Outlaw Hanky';

/*A customer is late on their movie return, and we've mailed them a letter to their address at "259 Ipoh Drive".We should also call them on the phone to let them know. Get 
the phone number for the customer who lives at "259 Ipoh Drive"?*/
SELECT phone FROM address WHERE address='259 Ipoh Drive';

/* We want to reward our first 10 paying customer. What are the custome ids of the first 10 customers who created a payment? */
SELECT customer_id,payment_date FROM payment ORDER BY payment_date ASC LIMIT 10;

/*A customer wants to quickly rent a video to watch over their short lunch break. What are the titles of the 5 shortest movies?*/
SELECT * from film;
SELECT title,length FROM film ORDER BY length ASC LIMIT 5;

/*We have two staff members with staff uds 1 and 2. We want to give a bonus to the staff memeber that handled most of the payements.
(most in terms of number of payments processed,not total dollars). How many payments did each staff member handle and who get the bonus?*/
SELECT * from payment;

/*If the previous customer can watch any movie that is 50 minutes or less in runtime,how many options does he have?*/
SELECT COUNT(film_id) FROM film WHERE length<=50;

/*How many payment transacations where greater than $5.00?*/
SELECT COUNT(*) FROM payment WHERE amount>5.00;

/*How many actors have a first name that starts with letter P?*/
SELECT COUNT(*) FROM actor where first_name LIKE 'P%';

/*How many unique districts are our customers from?*/
SELECT COUNT(DISTINCT district) FROM address;

/*Retrieve the list of names for those distinct districts from the previous questoin.*/
SELECT DISTINCT district FROM address;

/*How many films have a rating of R and a replacement cost between 5 and 15?*/
SELECT COUNT(*) FROM film WHERE rating='R' and replacement_cost BETWEEN 5 and 15;

/*How many films have the word Truman somewhere in the title?*/
SELECT COUNT(*) FROM film WHERE title LIKE '%Truman%';

/*we have two staff memebers, with staff id 1 and 2.We want to give a bonus to the staff memeber that handled the most payments.
How many payments did each staff member handle and who gets the bonus?*/
SELECT staff_id,COUNT(payment_id) FROM payment GROUP BY staff_id;

/*Coorpate HQ is conducting a study on the relationship between replacement cost and a movie MPAA rating(eg G,G,R,etc)
What is the avg replacement cost per MPAA rating?*/
SELECT rating,ROUND(AVG(replacement_cost),2) FROM film GROUP BY rating;

/*We are running a promotion to reward our top 5 customers with coupons.What are the customer IDS of the top 5 customers by total spend?*/
SELECT customer_id,SUM(amount) FROM payment GROUP BY customer_id ORDER BY SUM(amount) DESC LIMIT 5;

/*We are launching a platinum service for our most loyal customers.We will assign platinum status to customers that
have had 40 or more transaction payments. What customer_ids are elgible for platinum status?*/
SELECT customer_id,COUNT(payment_id) FROM payment GROUP BY (customer_id) HAVING COUNT(payment_id)>=40;

/*What are the customer ids of customer who have spent more than $100 in payment transactions with our staff_id member 2?*/
SELECT * from payment;
SELECT customer_id,SUM(amount) FROM payment WHERE staff_id='2' GROUP BY customer_id HAVING SUM(amount)>100 ;

/*Return the customer IDs of customers who have spent at least $110 with the staff member who has an ID of 2.*/
SELECT customer_id,SUM(amount) FROM payment WHERE staff_id='2'GROUP BY customer_id HAVING SUM(amount)>='110' ;

/*How many films begin with the letter J?*/
SELECT COUNT(*) from film WHERE title like 'J%';

/*What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500?*/
SELECT first_name,last_name,customer_id FROM customer WHERE first_name like 'E%' and address_id<500 ORDER BY customer_ID DESC LIMIT 1;

/*INNER JOIN*/
SELECT payment_id,customer.customer_id,first_name FROM customer INNER JOIN payment ON customer.customer_id=payment.customer_id;

/*California sales tax law have changed and we need to alert customers through email.What are the emails of customers
who live in California?*/
SELECT district,email from customer LEFT JOIN address on customer.address_id=address.address_id where address.district='California';

/*A customer walks in and is a huge fan of the actor "Nick Wahlberg" and wants to know which movie he is in.
Get a list of all the movies "Nick Wahlberg" has been in*/
SELECT * from film;
SELECT first_name,last_name,title from film_actor INNER JOIN actor on film_actor.actor_id=actor.actor_id
INNER JOIN film ON film_actor.film_id=film.film_id where first_name='Nick' and last_name='Wahlberg';







