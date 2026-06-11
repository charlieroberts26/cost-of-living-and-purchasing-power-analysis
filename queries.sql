-- =====================================================
-- Cost of Living and Purchasing Power Analysis
-- Objective: Determine which U.S. states provide the greatest purchasing power after accounting for differences in income and cost of living.
-- =====================================================


-- =====================================================
-- 1. Data Cleaning and Validation
-- =====================================================

-- Remove duplicate state records from the income dataset.

CREATE TABLE median_income_clean AS

SELECT DISTINCT
    state,
    median_income_2018
FROM median_income
WHERE state <> 'State';


-- Replace original table with cleaned version.

DROP TABLE median_income;

RENAME TABLE median_income_clean TO median_income;


-- Standardize state names across datasets.

UPDATE median_income
SET state = 'D.C.'
WHERE state = 'District of Columbia';


-- Verify that all states successfully join between datasets.

SELECT
    COUNT(*) AS matched_states
FROM median_income AS m
JOIN cost_of_living AS c
    ON m.state = c.state;


-- =====================================================
-- 2. Purchasing Power Analysis
-- =====================================================

-- Calculate purchasing power for all states.

SELECT
    m.state,
    m.median_income_2018,
    c.conversion,
    ROUND(m.median_income_2018 / c.conversion, 2) AS purchasing_power
FROM median_income AS m
JOIN cost_of_living AS c
    ON m.state = c.state
ORDER BY purchasing_power DESC;


-- Which states have the highest purchasing power?

SELECT
    m.state,
    m.median_income_2018,
    c.conversion,
    ROUND(m.median_income_2018 / c.conversion, 2) AS purchasing_power
FROM median_income AS m
JOIN cost_of_living AS c
    ON m.state = c.state
ORDER BY purchasing_power DESC
LIMIT 10;


-- Which states have the lowest purchasing power?

SELECT
    m.state,
    m.median_income_2018,
    c.conversion,
    ROUND(m.median_income_2018 / c.conversion, 2) AS purchasing_power
FROM median_income AS m
JOIN cost_of_living AS c
    ON m.state = c.state
ORDER BY purchasing_power
LIMIT 10;


-- =====================================================
-- 3. Ranking Analysis
-- =====================================================

-- How do state rankings change after adjusting for cost of living?

WITH state_purchase_power AS (

SELECT
    m.state,
    m.median_income_2018,
    c.conversion,
    ROUND(m.median_income_2018 / c.conversion, 2) AS purchasing_power
FROM median_income AS m
JOIN cost_of_living AS c
    ON m.state = c.state),

state_rankings AS (

SELECT
    state,
    median_income_2018,
    purchasing_power,
    RANK() OVER(ORDER BY median_income_2018 DESC) AS income_rank,
    RANK() OVER(ORDER BY purchasing_power DESC) AS purchasing_power_rank
FROM state_purchase_power)

SELECT
    state,
    income_rank,
    purchasing_power_rank,
    CAST(income_rank AS SIGNED) -
    CAST(purchasing_power_rank AS SIGNED) AS rank_change
FROM state_rankings
ORDER BY rank_change DESC;


-- Which states benefited most from cost-of-living adjustments?

WITH state_purchase_power AS (

SELECT
    m.state,
    m.median_income_2018,
    c.conversion,
    ROUND(m.median_income_2018 / c.conversion, 2) AS purchasing_power
FROM median_income AS m
JOIN cost_of_living AS c
    ON m.state = c.state),

state_rankings AS (

SELECT
    state,
    median_income_2018,
    purchasing_power,
    RANK() OVER(ORDER BY median_income_2018 DESC) AS income_rank,
    RANK() OVER(ORDER BY purchasing_power DESC) AS purchasing_power_rank
FROM state_purchase_power)

SELECT
    state,
    income_rank,
    purchasing_power_rank,
    CAST(income_rank AS SIGNED) -
    CAST(purchasing_power_rank AS SIGNED) AS rank_change
FROM state_rankings
ORDER BY rank_change DESC
LIMIT 10;


-- Which states lost the most after cost-of-living adjustments?

WITH state_purchase_power AS (

SELECT
    m.state,
    m.median_income_2018,
    c.conversion,
    ROUND(m.median_income_2018 / c.conversion, 2) AS purchasing_power
FROM median_income AS m
JOIN cost_of_living AS c
    ON m.state = c.state),

state_rankings AS (

SELECT
    state,
    median_income_2018,
    purchasing_power,
    RANK() OVER(ORDER BY median_income_2018 DESC) AS income_rank,
    RANK() OVER(ORDER BY purchasing_power DESC) AS purchasing_power_rank
FROM state_purchase_power)

SELECT
    state,
    income_rank,
    purchasing_power_rank,
    CAST(income_rank AS SIGNED) -
    CAST(purchasing_power_rank AS SIGNED) AS rank_change
FROM state_rankings
ORDER BY rank_change
LIMIT 10;


-- =====================================================
-- 4. Cost of Living Drivers Analysis
-- =====================================================

-- What are the maximum and minimum values for each cost category?

WITH max_min_values AS (

SELECT 
    MAX(grocery) AS max_grocery,
    MIN(grocery) AS min_grocery,
    MAX(housing) AS max_housing,
    MIN(housing) AS min_housing,
    MAX(utilities) AS max_utilities,
    MIN(utilities) AS min_utilities,
    MAX(transportation) AS max_transportation,
    MIN(transportation) AS min_transportation,
    MAX(health) AS max_health,
    MIN(health) AS min_health,
    MAX(misc) AS max_misc,
    MIN(misc) AS min_misc
FROM cost_of_living)

SELECT
    max_grocery - min_grocery AS grocery_range,
    max_housing - min_housing AS housing_range,
    max_utilities - min_utilities AS utilities_range,
    max_transportation - min_transportation AS transportation_range,
    max_health - min_health AS health_range,
    max_misc - min_misc AS misc_range
FROM max_min_values;


-- Is there a connection between housing cost ranking and purchasing power ranking?

WITH state_metrics AS (

SELECT
    m.state,
    c.conversion,
    c.housing,
    ROUND(m.median_income_2018 / c.conversion, 2) AS purchasing_power
FROM median_income AS m
JOIN cost_of_living AS c
    ON m.state = c.state),

rankings AS (

SELECT
    state,
    housing,
    conversion,
    purchasing_power,
    RANK() OVER(ORDER BY housing DESC) AS housing_rank,
    RANK() OVER(ORDER BY purchasing_power DESC) AS purchasing_power_rank
FROM state_metrics)

SELECT
    state,
    housing,
    purchasing_power,
    housing_rank,
    purchasing_power_rank
FROM rankings
ORDER BY housing_rank
LIMIT 10;


-- Do states with the lowest housing costs also tend to have higher purchasing power?

WITH state_metrics AS (

SELECT
    m.state,
    c.conversion,
    c.housing,
    ROUND(m.median_income_2018 / c.conversion, 2) AS purchasing_power
FROM median_income AS m
JOIN cost_of_living AS c
    ON m.state = c.state),

rankings AS (

SELECT
    state,
    housing,
    conversion,
    purchasing_power,
    RANK() OVER(ORDER BY housing DESC) AS housing_rank,
    RANK() OVER(ORDER BY purchasing_power DESC) AS purchasing_power_rank
FROM state_metrics)

SELECT
    state,
    housing,
    purchasing_power,
    housing_rank,
    purchasing_power_rank
FROM rankings
ORDER BY housing_rank DESC
LIMIT 10;