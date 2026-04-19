# FMCG Sales Performance Analysis

## Project Overview
End-to-end sales analysis for FMCG company using Excel, 
MySQL, and Tableau. This project analyzes 12 months of 
sales data across 8 regions, 4 distribution channels, 
and 12 SKUs in Indonesia.

## Tools Used
- **Excel** — Data cleaning & pivot table analysis
- **MySQL** — Database querying & business analysis
- **Tableau** — Interactive dashboard & data visualization

## Dataset
- 4,608 rows of sales transactions
- Period: January — December 2024
- Coverage: 8 regions, 4 channels, 12 SKUs

## Key Findings
1. Home Care category generates highest revenue, 
   while Personal Care has the highest profit margin
2. Only 6 out of 12 SKUs (50%) contribute to 80% 
   of total revenue (Pareto principle)
3. Jabodetabek has the highest achievement but is 
   most at risk of stockout — high demand is not 
   matched by sufficient stock supply
4. Top 5 SKUs are dominated by Home Care and 
   Personal Care — no Food & Beverage SKU in top 5

## Recommendations
1. Increase safety stock in Jabodetabek, especially 
   for Home Care SKUs
2. Focus promotional budget on top 6 Pareto SKUs 
   to maximize revenue impact
3. Review pricing strategy for Food & Beverage 
   category to improve revenue contribution

## Dashboard
View interactive dashboard on Tableau Public:
[FMCG Sales Performance Dashboard]https://public.tableau.com/views/FMCGSalesPerformanceDashboard2024/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

## Files
- `FMCG_Sales_Cleaned.csv` — Cleaned dataset
- `FMCG_Queries.sql` — MySQL queries for analysis
