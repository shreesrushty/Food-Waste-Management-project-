🍱 Food Waste Management System 


A  data project built with PostgreSQL, Python, and Streamlit that connects food providers with receivers to minimize food wastage and improve food distribution 
efficiency.


📌 Project Overview

Every day, restaurants, supermarkets, and catering services discard large quantities of edible food — while millions face food insecurity. This project bridges that gap by building a database-driven Food Waste Management System where providers can list surplus food and receivers can claim it through a centralized platform.

The system tracks all donation activity, analyzes provider and receiver behavior, identifies high-demand food categories, and surfaces insights through an interactive Streamlit dashboard.


🎯 Business Objectives


Minimize food wastage by connecting providers and receivers efficiently
Track food donation listings, claims, and fulfillment status
Analyze provider and receiver behavior patterns
Identify high-demand food items and locations
Generate actionable business insights through data analysis
Provide an interactive dashboard for stakeholder monitoring



🗂️ Dataset Description

The project uses 4 interrelated datasets with 1,000 records each:

DatasetKey Fieldsproviders.csvProvider name, city, type, contact detailsreceivers.csvReceiver name, type, locationfood_listings.csvFood item, quantity, expiry date, food type, meal typeclaims.csvClaim ID, receiver, status, timestamps

Total records across all tables: 4,000


🛠️ Tools & Technologies

ToolPurposePostgreSQLDatabase management and storagepgAdminDatabase administration and query executionSQLData cleaning, aggregation, and analytical queriesPython (Pandas, Plotly)Data processing and visualizationStreamlitInteractive dashboard developmentVisual Studio CodeDevelopment environment


🔄 Project Workflow

1. Database Creation
2. Table Creation & Schema Design
3. CSV Import
4. Data Validation & Cleaning
5. SQL Analysis & JOIN Queries
6. Python Data Visualization
7. Streamlit Dashboard Development
8. Business Insights Generation
9. Recommendations & Conclusion


🔍 SQL Analysis & Key Results

Overall Dataset Summary

CategoryRecordsProviders1,000Receivers1,000Food Listings1,000Claims1,000

Claim Status Distribution

StatusCountCompleted339Cancelled336Pending325

Food Type Distribution

Food TypeCountVegetarian336Vegan334Non-Vegetarian330

Meal Type Distribution

Meal TypeCountBreakfast254Snacks253Lunch248Dinner245

Most Claimed Food Items

Food ItemClaimsRice122Soup114Dairy110Fish108Salad106Chicken102Bread94Pasta87

Top Donating Providers

ProviderQuantity DonatedMiller Inc217Barry Group179Evans, Wright and Mitchell158Smith Group150Campbell LLC145


📊 Streamlit Dashboard

The interactive dashboard includes:


Total providers, receivers, listings, and claims at a glance
Claim status breakdown (Completed / Cancelled / Pending)
Food type and meal type distribution charts
Most claimed food items ranking
Top donating providers leaderboard
Trend analysis for food donations over time



💡 Key Business Insights


Rice was the most frequently claimed food item, indicating consistently high demand
Vegetarian listings were the most common food type across providers
Completed claims represented the largest claim share — indicating strong system effectiveness
Miller Inc was the top contributor by donation quantity
Breakfast and snacks made up the largest share of meal type listings
Strong participation from both providers and receivers validates the platform model



✅ Recommendations


Partner with NGOs in cities showing high food demand
Introduce automated notifications for food items nearing expiry
Recognize and reward top contributing providers to encourage continued participation
Improve receiver outreach programs to maximize food utilization
Develop real-time tracking for claims and deliveries
Prioritize distribution of high-demand food categories (Rice, Soup, Dairy)
Expand the platform to include more community organizations



🚀 Future Improvements


 Real-time food listing and claim updates
 Mobile app interface for providers and receivers
 Route optimization for food pickup and delivery
 Expiry date alert system (automated email/SMS notifications)
 Geospatial mapping of providers and receivers by city
 Machine learning model for demand forecasting by food category



📁 Repository Structure

food-waste-management/
├── datasets/
│   ├── providers.csv
│   ├── receivers.csv
│   ├── food_listings.csv
│   └── claims.csv
├── sql/
│   ├── create_tables.sql
│   ├── data_cleaning.sql
│   ├── analysis_queries.sql
│   └── join_queries.sql
├── dashboard/
│   └── app.py
├── notebooks/
│   └── food_waste_analysis.ipynb
├── docs/
│   └── Food_Waste_Management_Full_Report.docx
└── README.md


