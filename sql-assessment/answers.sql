/* While I have not yet worked with SQL, I seek to constantly learn and grow throughout my career. 
So, I utilized various resources over the past few days in order to learn and complete this 
technical assessment, and turn this challenge into a learning oppertunity. */ 

/* Question 1 */
SELECT DATE(date) AS day, SUM(impressions) AS total_impressions
FROM marketing_data
GROUP BY date
ORDER BY date;

/* Question 2 */
SELECT state, SUM(revenue) AS total_revenue
FROM website_revenue
GROUP BY state
ORDER BY total_revenue DESC
LIMIT 3;

/* Question 3 */
SELECT c.name AS campaign_name,
       SUM(md.cost) AS total_cost,
       SUM(md.impressions) AS total_impressions,
       SUM(md.clicks) AS total_clicks,
       SUM(wr.revenue) AS total_revenue
FROM campaign_info c
LEFT JOIN marketing_data md ON c.id = md.campaign_id
LEFT JOIN website_revenue wr ON c.id = wr.campaign_id
GROUP BY c.name
ORDER BY c.name;

/* Question 4 */
SELECT wr.state,
       SUM(md.conversions) AS total_conversions
FROM marketing_data md
JOIN website_revenue wr ON md.campaign_id = wr.campaign_id
WHERE md.campaign_id = 'Campaign5'
GROUP BY wr.state
ORDER BY total_conversions DESC
LIMIT 1;

/* Question 5 */
/* In order to see which campain was the most efficient, we can compare the return on investment
(ROI) of the campaigns. The higher the ROI, the more effective the campaign (in my opinion). */
SELECT ci.name AS campaign_name,
       SUM(wr.revenue) AS total_revenue,
       SUM(md.cost) AS total_cost,
       SUM(wr.revenue) - SUM(md.cost) AS roi
FROM campaign_info ci
LEFT JOIN marketing_data md ON ci.id = md.campaign_id
LEFT JOIN website_revenue wr ON ci.id = wr.campaign_id
GROUP BY ci.name
ORDER BY roi DESC;

/* Based on these calculations, Campaign 5 was the most efficient as 
it has the highest ROI */
