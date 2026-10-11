create database social_media;
use social_media;
SHOW TABLES;
SELECT * FROM influencer_details_clean;
SELECT * FROM content_quality;
SELECT * FROM hashtag_trend_details;
SELECT * FROM support_tickets_details;
SELECT * FROM customer_reviews;
SELECT * FROM user_details;
SELECT * FROM ad_revenue_details;
SELECT * FROM platform_usage_quantity;
SHOW TABLES;
-- 1. See the first 10 rows of a table --
SELECT * FROM user_details LIMIT 10;
-- 2. Count total rows in a table --
SELECT COUNT(*) AS total_users FROM user_details;
-- 3. Find users from a specific country --
SELECT full_name, country, platform_primary 
FROM user_details
WHERE country = 'USA';
-- 4. List influencers sorted by followers --
SELECT influencer_name, platform, followers_count 
FROM influencer_details_clean
ORDER BY followers_count DESC 
LIMIT 10;
--  5. Find all 1-star reviews --
ALTER TABLE customer_reviews 
CHANGE ï»¿review_id review_id VARCHAR(10);
SELECT review_id, platform, review_text 
FROM customer_reviews 
WHERE rating = 1;
-- 6. Total ad revenue by platform
SELECT platform, SUM(revenue_usd) AS total_revenue 
FROM ad_revenue_details
GROUP BY platform 
ORDER BY total_revenue DESC;
-- 7. Count how many posts are flagged as spam vs not spam
SELECT spam_flag, COUNT(*) AS post_count 
FROM content_quality 
GROUP BY spam_flag;
-- 8. Count open vs resolved support tickets
SELECT status, COUNT(*) AS ticket_count 
FROM support_tickets_details
GROUP BY status;
-- 9. Find top 5 trending hashtags by usage count
SELECT hashtag, platform, usage_count 
FROM hashtag_trend_details
ORDER BY usage_count DESC 
LIMIT 5;
-- 10. Find the top 5 highest-earning ad transactions
SELECT platform, ad_type, revenue_usd, region 
FROM ad_revenue_details
ORDER BY revenue_usd DESC 
LIMIT 5;


