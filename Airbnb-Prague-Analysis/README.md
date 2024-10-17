# Airbnb Prague Market Analysis

## Overview
This project analyzes the Airbnb market in Prague using SQL for data extraction and preprocessing, and Power BI for advanced visualization and insights generation.

## Tools Used
- SQL (PostgreSQL)
- Power BI

## Files in this Directory
  -[`airbnb-analysis-powerbi.pbix`](./airbnb-analysis-powerbi.pbix): Power BI file containing the dashboard and visualization

  -[`airbnb_analysis.sql`](./airbnb_analysis.sql): SQL file with queries used for data extraction and initial analysis

  -[`Images`](./Images): Images file includes images of the dashboard and visualization

## Key Features of the Analysis
1. Pricing Analysis
   - Average price by neighborhood
   - Price trends over time
   - Correlation between price and other factors (e.g., number of reviews, location)

2. Booking Patterns
   - Seasonal trends in bookings
   - Popular neighborhoods and property types

3. Host Performance
   - Top hosts by number of listings

4. Property Insights
   - Distribution of property types
   - Occupancy rates

5. Review Analysis
   - Correlation between number of reviews and other factors

## How to Use
1. Open `airbnb_analysis.sql` in your preferred SQL client to view the data extraction and preprocessing steps.
2. Open `airbnb-analysis-powerbi.pbix` in Power BI Desktop to interact with the visualizations and explore the insights.

## Key Insights
  -1. Top Hosts:
   - Leading host: Alex And Kate with 88 listings
   - Top 10 hosts manage between 60 to 88 listings each

2. Listing Distribution:
   - Vast majority of top hosts' properties are entire homes/apartments
  
3. Seasonal Trends:
   - Bookings peak around month 8 (August), with highest total nights booked
   - Average price shows inverse relationship with booking volume

4. Market Size:
   - Total of 3,015 hosts in the dataset
   - Maximum listings by a single host: 88

5. Pricing Patterns:
   - Price fluctuations visible throughout the year
  
## Future Work
- Incorporate more recent data to analyze post-pandemic trends
- Expand analysis to compare Prague with other major European cities
- Develop a predictive model for pricing optimization

