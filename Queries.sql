/*create table*/
CREATE TABLE dubai_real_estate (
    instance_date DATE,
    procedure_en VARCHAR(100),
    is_free_hold_en VARCHAR(50),
    area_en VARCHAR(100),
    prop_sb_type_en VARCHAR(100),
    trans_value NUMERIC,
    actual_area NUMERIC,
    rooms_en VARCHAR(50),
    nearest_metro_en VARCHAR(150),
    nearest_mall_en VARCHAR(150),
    nearest_landmark_en VARCHAR(150),
    project_en VARCHAR(200),
    price_per_sqm NUMERIC,
    size_category VARCHAR(50),
    value_band VARCHAR(50)
);
/*check my data is imported succesfully*/
select count (*) from dubai_real_estate;

/*null values*/
Select 
 count (*) filter (where trans_value is null) as null_trans_value,
 count (*) filter (where actual_area is null) as null_actual_area,
 count (*) filter (Where rooms_en is null) as null_rooms_en,
 count (*) filter (Where price_per_sqm is null) as null_price_per_sqm
from dubai_real_estate;

UPDATE dubai_real_estate
SET rooms_en = 'Not Specified'
WHERE rooms_en IS NULL;

SELECT COUNT(*) FROM dubai_real_estate 
WHERE rooms_en IS NULL;

Select 
 count (*) filter (where trans_value is null) as null_trans_value,
 COUNT(*) FILTER (WHERE area_en IS NULL) AS null_area_en,
 count (*) filter (where actual_area is null) as null_actual_area,
 count (*) filter (Where rooms_en is null) as null_rooms_en,
 count (*) filter (Where price_per_sqm is null) as null_price_per_sqm
from dubai_real_estate;

/*duplicate check*/
SELECT 
    instance_date, procedure_en, is_free_hold_en, area_en, prop_sb_type_en,
    trans_value, actual_area, rooms_en, nearest_metro_en, nearest_mall_en,
    nearest_landmark_en, project_en, price_per_sqm, size_category, value_band,
    COUNT(*) AS duplicate_count
FROM dubai_real_estate
GROUP BY 
    instance_date, procedure_en, is_free_hold_en, area_en, prop_sb_type_en,
    trans_value, actual_area, rooms_en, nearest_metro_en, nearest_mall_en,
    nearest_landmark_en, project_en, price_per_sqm, size_category, value_band
HAVING COUNT(*) > 1;

/*invalid values*/
SELECT trans_value,price_per_sqm,actual_area FROM dubai_real_estate
WHERE trans_value = 0 OR actual_area = 0 OR price_per_sqm = 0;

/*negative vales*/
SELECT trans_value,price_per_sqm,actual_area FROM dubai_real_estate
WHERE trans_value < 0 OR actual_area < 0 OR price_per_sqm < 0;

SELECT * FROM dubai_real_estate
WHERE instance_date > CURRENT_DATE;

SELECT trans_value, actual_area, price_per_sqm,
    ROUND(trans_value / actual_area, 2) AS calculated_price_per_sqm
FROM dubai_real_estate
WHERE ROUND(price_per_sqm, 2) != ROUND(trans_value / actual_area, 2);

/*queries*/
/*What is the total number of property transactions recorded*/
SELECT COUNT(*) AS total_transactions FROM dubai_real_estate;

/*What is the average transaction value across all properties?*/
SELECT AVG(trans_value) AS average_transaction_value FROM dubai_real_estate;

/*Which property type is transacted the most?*/
SELECT prop_sb_type_en, COUNT(*) AS transaction_count FROM dubai_real_estate
GROUP BY prop_sb_type_en
ORDER BY transaction_count DESC
LIMIT 1;

/*Which area (AREA_EN) has the highest number of transactions?*/
SELECT area_en, COUNT(*) AS transaction_count FROM dubai_real_estate
GROUP BY area_en
ORDER BY transaction_count DESC
LIMIT 1;

/*What is the average price per sqm (price_per_sqm) in each area?*/
SELECT area_en, AVG(price_per_sqm) AS average_price FROM dubai_real_estate
GROUP BY area_en
ORDER BY average_price DESC;

/*How does transaction value differ between freehold and non-freehold properties (IS_FREE_HOLD_EN)*/
SELECT is_free_hold_en, AVG(trans_value) AS average_transaction_value FROM dubai_real_estate
GROUP BY is_free_hold_en
ORDER BY average_transaction_value DESC;

/*: Which room type (ROOMS_EN) is most commonly transacted?*/
SELECT rooms_en, COUNT(*) AS transaction_count FROM dubai_real_estate
GROUP BY rooms_en
ORDER BY transaction_count DESC
LIMIT 1;

/*: What is the average transaction value by property size category (size_category)?*/
SELECT size_category, AVG(trans_value) AS average_transaction_value FROM dubai_real_estate
GROUP BY size_category
ORDER BY average_transaction_value DESC;

/*: How many transactions happened per year (from INSTANCE_DATE)?*/
SELECT EXTRACT(YEAR FROM instance_date) AS trans_year,COUNT(*) AS transaction_count FROM dubai_real_estate
GROUP BY trans_year
ORDER BY transaction_count DESC;

/*Monthly Transaction Trend*/
SELECT EXTRACT(MONTH FROM instance_date) AS trans_month,COUNT(*) AS transaction_count FROM dubai_real_estate
GROUP BY trans_month
ORDER BY trans_month ASC;

/*Which top 5 projects (PROJECT_EN) have the highest total transaction value?*/
SELECT project_en, SUM(trans_value) AS total_transaction_value FROM dubai_real_estate
GROUP BY project_en
ORDER BY total_transaction_value DESC
LIMIT 5;

SELECT project_en, SUM(trans_value) AS total_transaction_value FROM dubai_real_estate
WHERE project_en IS NOT NULL
GROUP BY project_en
ORDER BY total_transaction_value DESC
LIMIT 5;

/*Do properties near malls have higher price per sqm than those without?*/
SELECT 
    CASE 
    WHEN nearest_mall_en IS NOT NULL THEN 'Near Mall'ELSE 'No Mall Nearby'
    END AS mall_proximity,
    AVG(price_per_sqm) AS average_price_per_sqm FROM dubai_real_estate
GROUP BY mall_proximity
ORDER BY average_price_per_sqm DESC;