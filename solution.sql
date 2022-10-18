--NB: the FROM clause is google bigquery syntax.
--the actual file name is the last word in the FROM command
--to see all the crimes
SELECT DISTINCT type,
COUNT (*)
FROM `my-maven-projects.sql_murder_mystery.crime_scene_report`
GROUP BY type

-- since the murder happened on 15th January, 2018, let's look at the record for that day
SELECT *
FROM `my-maven-projects.sql_murder_mystery.crime_scene_report`
WHERE type = "murder"
AND city = "SQL City"

--find the 2 witneses at the murder
--first witness
SELECT *
FROM `my-maven-projects.sql_murder_mystery.person`
WHERE address_street_name = "Northwestern Dr"
ORDER BY address_number DESC
LIMIT 1

--second witness
SELECT *
FROM `my-maven-projects.sql_murder_mystery.person`
WHERE name LIKE "Annabel%" AND address_street_name = "Franklin Ave"

--to find the interview transcripts
SELECT *
FROM `my-maven-projects.sql_murder_mystery.interviews` AS interview
JOIN `my-maven-projects.sql_murder_mystery.person` AS person
ON interview.person_id = person.id
WHERE interview.person_id = 14887 OR interview.person_id = 16371

--now check to see if their story is right 
SELECT *
FROM `my-maven-projects.sql_murder_mystery.get_fit_now_check_in`
WHERE check_in_date = 20180109

--to check membership_id
SELECT *
FROM `my-maven-projects.sql_murder_mystery.get_fit_now_member`
WHERE id LIKE "48Z%"

--next, check the license and see 
SELECT *
FROM `my-maven-projects.sql_murder_mystery.drivers_licenses`
WHERE gender = "male"
AND plate_number LIKE "%H42W%"

SELECT *
FROM `my-maven-projects.sql_murder_mystery.person`
WHERE license_id = 664760 OR license_id = 423327

--the person who committed the crime and alsomatched all of the witness description
Jeremy Bowers

--to check the new suspect statement and find the real murderer
--to find his id
SELECT *
FROM `my-maven-projects.sql_murder_mystery.person`
WHERE name = "Jeremy Bowers"

--to find the interview transcripts
SELECT *
FROM `my-maven-projects.sql_murder_mystery.interviews` AS interview
JOIN `my-maven-projects.sql_murder_mystery.person` AS person
ON interview.person_id = person.id
WHERE interview.person_id = 67318

--since he was hired by a woman with a lot of money
--let's find the people in the database who have made more than 450000
SELECT person.name, income.annual_income
FROM `my-maven-projects.sql_murder_mystery.person` AS person
JOIN `my-maven-projects.sql_murder_mystery.income` AS income
ON person.ssn = income.ssn
WHERE income.annual_income>300000 

--check for car type
SELECT DISTINCT car_make
FROM `my-maven-projects.sql_murder_mystery.drivers_licenses`
ORDER BY car_make DESC

--find all women who drive the car model
SELECT *
FROM `my-maven-projects.sql_murder_mystery.drivers_licenses`
WHERE car_make = "Tesla" 
AND gender = "female" 
AND car_model = "Model S" 
AND height BETWEEN 65 AND 67

--next, use the result to find thw womens id and see who attended the concert
SELECT person.name, person.id, drivers_license.id
FROM `my-maven-projects.sql_murder_mystery.person` AS person
JOIN `my-maven-projects.sql_murder_mystery.drivers_licenses` AS drivers_license
ON person.license_id = drivers_license.id
WHERE drivers_license.id = 291182 
OR drivers_license.id = 918773 
OR drivers_license.id = 202298

--next, we find out who was at the concert in 2017
SELECT *
FROM `my-maven-projects.sql_murder_mystery.facebook_event_chekin`
WHERE person_id = 90700
OR person_id = 99716
OR person_id = 78881

--our murderer behind the murdere has the person id 99716 (Miranda Priestly)
SELECT *
FROM `my-maven-projects.sql_murder_mystery.person`
WHERE id = 99716
