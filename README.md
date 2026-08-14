# Dubai Residential Real Estate Market Analysis

A SQL-based data analysis project exploring residential property transaction trends across Dubai, to support smarter buying and investment decisions.

---

## Problem Statement

A real estate consultancy in Dubai wants to analyze residential property transaction data to understand market trends — including price patterns across areas, demand by property type, and the effect of proximity to malls and other amenities — in order to guide clients on smart buying and investment decisions.

---

## Tools & Technologies Used

- **PostgreSQL** — database and query engine
- **pgAdmin 4** — SQL development and query execution
- **SQL** — data cleaning, aggregation, subqueries, CASE WHEN logic

---

## Dataset Description

- **Source:** Kaggle (Dubai residential real estate transactions dataset)
- **Rows:** 18,085 transactions (after cleaning)
- **Columns:** 15, including:
  - `instance_date`, `procedure_en`, `is_free_hold_en`, `area_en`
  - `prop_sb_type_en`, `trans_value`, `actual_area`, `rooms_en`
  - `nearest_metro_en`, `nearest_mall_en`, `nearest_landmark_en`
  - `project_en`, `price_per_sqm`, `size_category`, `value_band`
- **Time period:** January 2026 – July 2026

---

## Approach / Methodology

1. **Defined the business problem** — framed the project around real investment and buying decisions.
2. **Listed business questions** — created a mix of easy, medium, and hard questions a real estate consultancy would realistically ask.
3. **Cleaned the data:**
   - Replaced missing values in `rooms_en` with `'Not Specified'`
   - Checked and confirmed no duplicate transactions
   - Removed rows with invalid zero values (5 rows)
   - Removed rows with negative values
   - Verified no future-dated transactions
   - Verified consistent area naming (no spelling/casing issues)
   - Reviewed `price_per_sqm` calculation accuracy (minor rounding only, no action needed)
4. **Answered 10 business questions using SQL** — covering aggregation, grouping, subqueries, and conditional logic (`CASE WHEN`).
5. **Summarized results into clear, business-focused insights.**

---

## Key Insights / Findings

- **Flats dominate the market:** 88% of all transactions (15,940 of 18,085) are flats/apartments, confirming Dubai's strong apartment-living culture.
- **Ownership matters:** Freehold properties sell for 70% more on average (AED 1.89M) than non-freehold properties (AED 1.11M), reflecting the value international investors place on full ownership rights.
- **Amenities add value:** Properties near a mall command a 30% higher price per sqm (AED 19,593) compared to properties without a nearby mall (AED 15,025), proving that lifestyle convenience is a measurable price driver.
- **Location gap:** Jumeirah Village Circle (JVC) leads in transaction volume (1,985 deals — the most active area), while Jumeira Bay leads in price per sqm (AED 103,371) — showing a clear split between high-volume affordable areas and low-volume luxury areas.
- **Size drives price:** Premium-sized properties average AED 4.34 million — over 6 times the value of Compact properties (AED 673,612).

---

## Dashboard Preview

*(Screenshot placeholder — add a Power BI/Tableau dashboard screenshot here if built as a follow-up to this SQL project)*

```
[Insert dashboard screenshot here]
```

---

## Skills Demonstrated

- Data cleaning (NULL handling, duplicate checks, invalid value removal)
- Aggregate functions (`COUNT`, `AVG`, `SUM`)
- Grouping and filtering (`GROUP BY`, `WHERE`, `HAVING`)
- Conditional logic (`CASE WHEN`)
- Subqueries
- Business problem framing and insight writing
- Translating vague business questions into structured SQL queries

---

## How to Use This Project

1. Clone or download this repository.
2. Import the dataset CSV into PostgreSQL using the table structure provided in `create_table.sql`.
3. Run the cleaning queries in `data_cleaning.sql`.
4. Run the analysis queries in `business_questions.sql` to reproduce the results.
5. Review `insights_summary.md` for the final business takeaways.

---

## About Me

I am an M.Tech CSE student building a Data Analyst portfolio to apply for **Data Analyst, MIS, and Reporting roles in Dubai, UAE.** This project is part of my hands-on SQL practice, focused on solving real, industry-relevant business problems.

---

## Suggested GitHub Topics/Tags

`sql` `postgresql` `data-analysis` `real-estate` `dubai` `data-cleaning` `business-intelligence`
