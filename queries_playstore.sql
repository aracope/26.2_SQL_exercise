-- This will create the database and table. You should now have a new database, called ***playstore***, along with a single table, ***analytics***

-- Here are the rest of the queries you should write, phrased like your boss is asking for specific stuff:

-- 1. Find the app with an ID of ***1880***
SELECT * 
FROM analytics 
WHERE id = 1880;

-- -[ RECORD 1 ]---+------------------------
-- id              | 1880
-- app_name        | Web Browser for Android
-- category        | PRODUCTIVITY
-- rating          | 4.3
-- reviews         | 144879
-- size            | Varies with device
-- min_installs    | 10000000
-- price           | 0
-- content_rating  | Everyone
-- genres          | {Productivity}
-- last_updated    | 2016-01-24
-- current_version | 3.5.0
-- android_version | Varies with device


-- 2. Find the ID and app name for all apps that were last updated on August 01, 2018.
SELECT id, app_name
FROM analytics
WHERE last_updated = '2018-08-01';

-- -[ RECORD 1 ]-------------------------------------------------------------------------------
-- id       | 10
-- app_name | Clash Royale
-- -[ RECORD 2 ]-------------------------------------------------------------------------------
-- id       | 11
-- app_name | Candy Crush Saga
-- -[ RECORD 3 ]-------------------------------------------------------------------------------
-- id       | 12
-- app_name | UC Browser - Fast Download Private & Secure
-- -[ RECORD 4 ]-------------------------------------------------------------------------------
-- id       | 74
-- app_name | Score! Hero
-- -[ RECORD 5 ]-------------------------------------------------------------------------------
-- id       | 101
-- app_name | Tiny Flashlight + LED
-- -[ RECORD 6 ]-------------------------------------------------------------------------------
-- id       | 102
-- :

-- 3. Count the number of apps in each category, e.g. “Family | 1972”.
SELECT category, COUNT(*) AS total_apps
FROM analytics
GROUP BY category
ORDER BY total_apps DESC;

-- -[ RECORD 1 ]-------------------
-- category   | FAMILY
-- total_apps | 1789
-- -[ RECORD 2 ]-------------------
-- category   | GAME
-- total_apps | 1110
-- -[ RECORD 3 ]-------------------
-- category   | TOOLS
-- total_apps | 753
-- -[ RECORD 4 ]-------------------
-- category   | PRODUCTIVITY
-- total_apps | 360
-- -[ RECORD 5 ]-------------------
-- category   | MEDICAL
-- total_apps | 350
-- -[ RECORD 6 ]-------------------
-- category   | COMMUNICATION
-- total_apps | 342
-- -[ RECORD 7 ]-------------------
-- category   | SPORTS
-- total_apps | 338
-- -[ RECORD 8 ]-------------------
-- category   | FINANCE
-- :

-- 4. Find the top 5 most-reviewed apps and the number of reviews for each.
SELECT app_name, reviews
FROM analytics
ORDER BY reviews DESC
LIMIT 5;

-- -[ RECORD 1 ]--------------------------------------
-- app_name | Facebook
-- reviews  | 78158306
-- -[ RECORD 2 ]--------------------------------------
-- app_name | WhatsApp Messenger
-- reviews  | 78128208
-- -[ RECORD 3 ]--------------------------------------
-- app_name | Instagram
-- reviews  | 69119316
-- -[ RECORD 4 ]--------------------------------------
-- app_name | Messenger – Text and Video Chat for Free
-- reviews  | 69119316
-- -[ RECORD 5 ]--------------------------------------
-- app_name | Clash of Clans
-- reviews  | 69109672

-- 5. Find the app that has the most reviews with a rating greater than equal to 4.8.
SELECT app_name, reviews, rating
FROM analytics
WHERE rating >= 4.8
ORDER BY reviews DESC
LIMIT 1;

-- -[ RECORD 1 ]--------
-- app_name | Chess Free
-- reviews  | 4559407
-- rating   | 4.8

-- 6. Find the average rating for each category ordered by the highest rated to lowest rated.
SELECT category, ROUND(AVG(rating)::numeric, 2) AS avg_rating
FROM analytics
GROUP BY category
ORDER BY avg_rating DESC;

-- -[ RECORD 1 ]-------------------
-- category   | EVENTS
-- avg_rating | 4.40
-- -[ RECORD 2 ]-------------------
-- category   | EDUCATION
-- avg_rating | 4.39
-- -[ RECORD 3 ]-------------------
-- category   | ART_AND_DESIGN
-- avg_rating | 4.35
-- -[ RECORD 4 ]-------------------
-- category   | BOOKS_AND_REFERENCE
-- avg_rating | 4.34
-- -[ RECORD 5 ]-------------------
-- category   | PERSONALIZATION
-- avg_rating | 4.33
-- -[ RECORD 6 ]-------------------
-- category   | BEAUTY
-- avg_rating | 4.30
-- -[ RECORD 7 ]-------------------
-- category   | GAME
-- avg_rating | 4.29
-- -[ RECORD 8 ]-------------------
-- category   | PARENTING
-- :

-- 7. Find the name, price, and rating of the most expensive app with a rating that’s less than 3.
SELECT app_name, price, rating
FROM analytics
WHERE rating < 3
ORDER BY price DESC
LIMIT 1;

-- -[ RECORD 1 ]----------------
-- app_name | Naruto & Boruto FR
-- price    | 379.99
-- rating   | 2.9

-- 8. Find all apps with a min install not exceeding 50, that have a rating. Order your results by highest rated first.
SELECT app_name, min_installs, rating
FROM analytics
WHERE min_installs <= 50 AND rating IS NOT NULL
ORDER BY rating DESC;

-- -[ RECORD 1 ]+-----------------------------------------------
-- app_name     | DT
-- min_installs | 50
-- rating       | 5
-- -[ RECORD 2 ]+-----------------------------------------------
-- app_name     | DQ Akses
-- min_installs | 50
-- rating       | 5
-- -[ RECORD 3 ]+-----------------------------------------------
-- app_name     | DM Adventure
-- min_installs | 1
-- rating       | 5
-- -[ RECORD 4 ]+-----------------------------------------------
-- app_name     | db Meter - sound level meter with data logging
-- min_installs | 10
-- rating       | 5
-- -[ RECORD 5 ]+-----------------------------------------------
-- app_name     | Otto DM
-- min_installs | 5
-- rating       | 5
-- -[ RECORD 6 ]+-----------------------------------------------
-- app_name     | ElejaOnline DF
-- min_installs | 50
-- :

-- 9. Find the names of all apps that are rated less than 3 with at least 10000 reviews.
SELECT app_name, rating, reviews
FROM analytics
WHERE rating < 3 AND reviews::int >= 10000;

-- -[ RECORD 1 ]---------------------------------------------
-- app_name | The Wall Street Journal: Business & Market News
-- rating   | 2.8
-- reviews  | 107441
-- -[ RECORD 2 ]---------------------------------------------
-- app_name | Vikings: an Archer’s Journey
-- rating   | 2.9
-- reviews  | 31596
-- -[ RECORD 3 ]---------------------------------------------
-- app_name | Shoot Em Down Free
-- rating   | 2.4
-- reviews  | 11773

-- 10. Find the top 10 most-reviewed apps that cost between 10 cents and a dollar.
SELECT app_name, price, reviews::int AS review_count
FROM analytics
WHERE price >= 0.10 AND price <= 1.00
ORDER BY review_count DESC
LIMIT 10;

-- -[ RECORD 1 ]+--------------------------------------------
-- app_name     | Free Slideshow Maker & Video Editor
-- price        | 0.99
-- review_count | 408292
-- -[ RECORD 2 ]+--------------------------------------------
-- app_name     | Couple - Relationship App
-- price        | 0.99
-- review_count | 85468
-- -[ RECORD 3 ]+--------------------------------------------
-- app_name     | Anime X Wallpaper
-- price        | 0.99
-- review_count | 84114
-- -[ RECORD 4 ]+--------------------------------------------
-- app_name     | Dance On Mobile
-- price        | 0.99
-- review_count | 61264
-- -[ RECORD 5 ]+--------------------------------------------
-- app_name     | Marvel Unlimited
-- price        | 0.99
-- review_count | 58617
-- -[ RECORD 6 ]+--------------------------------------------
-- app_name     | FastMeet: Chat, Dating, Love
-- price        | 0.99
-- :

-- 11. Find the most out of date app. Hint: You don’t need to do it this way, but it’s possible to do with a subquery: http://www.postgresqltutorial.com/postgresql-max-function/
-- No subquery:
SELECT app_name, last_updated
FROM analytics
ORDER BY last_updated ASC
LIMIT 1;

-- -[ RECORD 1 ]+-----------
-- app_name     | CP Clicker
-- last_updated | 2010-05-21

-- With subquery:
SELECT app_name, last_updated
FROM analytics
WHERE last_updated = (
    SELECT MIN(last_updated)
    FROM analytics
);

-- -[ RECORD 1 ]+-----------
-- app_name     | CP Clicker
-- last_updated | 2010-05-21

-- 12. Find the most expensive app (the query is very similar to #11).
SELECT app_name, price
FROM analytics
ORDER BY price DESC
LIMIT 1;

-- -[ RECORD 1 ]----------------
-- app_name | Cardi B Piano Game
-- price    | 400

-- 13. Count all the reviews in the Google Play Store.
SELECT SUM(reviews::int) AS total_reviews
FROM analytics;

-- -[ RECORD 1 ]-+-----------
-- total_reviews | 4814575866

-- 14. Find all the categories that have more than 300 apps in them.
SELECT category, COUNT(*) AS total_apps
FROM analytics
GROUP BY category
HAVING COUNT(*) > 300
ORDER BY total_apps DESC;

-- -[ RECORD 1 ]---------------
-- category   | FAMILY
-- total_apps | 1789
-- -[ RECORD 2 ]---------------
-- category   | GAME
-- total_apps | 1110
-- -[ RECORD 3 ]---------------
-- category   | TOOLS
-- total_apps | 753
-- -[ RECORD 4 ]---------------
-- category   | PRODUCTIVITY
-- total_apps | 360
-- -[ RECORD 5 ]---------------
-- category   | MEDICAL
-- total_apps | 350
-- -[ RECORD 6 ]---------------
-- category   | COMMUNICATION
-- total_apps | 342
-- -[ RECORD 7 ]---------------
-- category   | SPORTS
-- total_apps | 338
-- -[ RECORD 8 ]---------------
-- category   | FINANCE
-- :

-- 15. Find the app that has the highest proportion of min_installs to reviews, among apps that have been installed at least 100,000 times. Display the name of the app along with the number of reviews, the min_installs, and the proportion.
SELECT app_name, reviews::int AS review_count, min_installs, 
       (min_installs::float / reviews::int) AS install_review_ratio
FROM analytics
WHERE min_installs >= 100000
ORDER BY install_review_ratio DESC
LIMIT 1;

-- -[ RECORD 1 ]--------+-------------------
-- app_name             | Kim Bu Youtuber?
-- review_count         | 66
-- min_installs         | 10000000
-- install_review_ratio | 151515.15151515152