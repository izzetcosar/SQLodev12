SELECT COUNT(*)
FROM film
WHERE length > (SELECT AVG(length) FROM film);

SELECT COUNT(*)
FROM film
WHERE rental_rate = (SELECT MAX(rental_rate) FROM film);

SELECT title,rental_rate,replacement_cost 
FROM film
WHERE rental_rate =
(SELECT MIN(rental_rate) FROM film) --alt sorgu ile en düşük rental_rate e sahip filmi alıyoruz.
INTERSECT							--INTERSECT ile kesişim yani hem en küçük rental_rate ve replacement_cost değerine sahip öğeleri istiyoruz
SELECT title,rental_rate,replacement_cost
FROM film
WHERE replacement_cost =
(SELECT MIN(replacement_cost) FROM film);--alt sorgu ile en düşük replacement_cost e sahip filmi alıyoruz.



SELECT 
    customer.customer_id,
    customer.first_name ,customer.last_name,
    COUNT(*) 
FROM customer 
JOIN payment  ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name
ORDER BY COUNT(*)  DESC;



