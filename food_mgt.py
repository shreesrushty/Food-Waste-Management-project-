import streamlit as st
import psycopg2

conn = psycopg2.connect(
    host="localhost",
    port="5432",
    database="Food mgt analysis ",   # ← SPACE AT THE END
    user="postgres",
    password="shreeradharukmini19"
)

st.title("🍽️ Food Management Dashboard")
st.success("Database Connected Successfully!")


import streamlit as st
import pandas as pd
import psycopg2
import plotly.express as px

# ---------------- PAGE CONFIG ----------------
st.set_page_config(
    page_title="Food Waste Management Dashboard",
    page_icon="🍽️",
    layout="wide"
)

# ---------------- BACKGROUND ----------------
st.markdown("""
<style>
.stApp {
    background-color: #FFF0F5;
}

[data-testid="stMetric"] {
    background-color: white;
    padding: 15px;
    border-radius: 15px;
    box-shadow: 2px 2px 10px rgba(0,0,0,0.15);
}

[data-testid="stMetricValue"] {
    color: #E91E63;
    font-size: 30px;
    font-weight: bold;
}

[data-testid="stMetricLabel"] {
    color: #880E4F;
    font-size: 16px;
    font-weight: bold;
}

h1 {
    color: #C2185B;
    text-align: center;
}

h3 {
    color: #AD1457;
}
</style>
""", unsafe_allow_html=True)

# ---------------- DATABASE CONNECTION ----------------

conn = psycopg2.connect(
    host="localhost",
    port="5432",
    database="Food mgt analysis ",
    user="postgres",
    password="shreeradharukmini19"
)

# ---------------- SIDEBAR ----------------

st.sidebar.title("🍽️ Food Waste Management")

st.sidebar.markdown("""
### Project Details

**Project:** Food Waste Management

**Tools Used**
- PostgreSQL
- Python
- Streamlit
- Pandas
- Plotly

### Features
✅ KPI Cards

✅ Pie Charts

✅ Donut Charts

✅ Bar Charts

✅ Line Charts

✅ Live PostgreSQL Data
""")

# ---------------- TITLE ----------------

st.title("🍽️ Food Waste Management Dashboard")
st.markdown("### SQL + PostgreSQL + Streamlit Project")

# ---------------- KPI VALUES ----------------

providers = pd.read_sql(
    "SELECT COUNT(*) AS total FROM providers_data",
    conn
).iloc[0,0]

receivers = pd.read_sql(
    "SELECT COUNT(*) AS total FROM receiver_data",
    conn
).iloc[0,0]

foods = pd.read_sql(
    "SELECT COUNT(*) AS total FROM food_listing_data",
    conn
).iloc[0,0]

claims = pd.read_sql(
    "SELECT COUNT(*) AS total FROM claims_data",
    conn
).iloc[0,0]

# ---------------- KPI CARDS ----------------

c1,c2,c3,c4 = st.columns(4)

c1.metric("👨‍🍳 Providers", providers)
c2.metric("🙋 Receivers", receivers)
c3.metric("🍱 Food Listings", foods)
c4.metric("📦 Claims", claims)

st.markdown("---")

# =====================================================
# CHART 1 : CLAIM STATUS PIE
# =====================================================

status_df = pd.read_sql("""
SELECT status,
COUNT(*) as total
FROM claims_data
GROUP BY status
""", conn)

fig1 = px.pie(
    status_df,
    names="status",
    values="total",
    title="Claim Status Distribution"
)

# =====================================================
# CHART 2 : CLAIM STATUS DONUT
# =====================================================

fig2 = px.pie(
    status_df,
    names="status",
    values="total",
    hole=0.5,
    title="Claim Status Donut Chart"
)

col1,col2 = st.columns(2)

with col1:
    st.plotly_chart(fig1, use_container_width=True)

with col2:
    st.plotly_chart(fig2, use_container_width=True)

# =====================================================
# CHART 3 : FOOD TYPE
# =====================================================

food_df = pd.read_sql("""
SELECT food_type,
COUNT(*) as total
FROM food_listing_data
GROUP BY food_type
""", conn)

fig3 = px.bar(
    food_df,
    x="food_type",
    y="total",
    color="food_type",
    title="Food Type Distribution"
)

st.plotly_chart(fig3, use_container_width=True)

# =====================================================
# CHART 4 : MEAL TYPE LINE
# =====================================================

meal_df = pd.read_sql("""
SELECT meal_type,
COUNT(*) as total
FROM food_listing_data
GROUP BY meal_type
""", conn)

fig4 = px.line(
    meal_df,
    x="meal_type",
    y="total",
    markers=True,
    title="Meal Type Distribution"
)

st.plotly_chart(fig4, use_container_width=True)

# =====================================================
# CHART 5 : MEAL TYPE PIE
# =====================================================

fig5 = px.pie(
    meal_df,
    names="meal_type",
    values="total",
    title="Meal Type Share"
)

st.plotly_chart(fig5, use_container_width=True)

# =====================================================
# CHART 6 : TOP PROVIDER CITIES
# =====================================================

city_df = pd.read_sql("""
SELECT city,
COUNT(*) as total
FROM providers_data
GROUP BY city
ORDER BY total DESC
LIMIT 10
""", conn)

fig6 = px.bar(
    city_df,
    x="city",
    y="total",
    color="city",
    title="Top Provider Cities"
)

st.plotly_chart(fig6, use_container_width=True)

# =====================================================
# CHART 7 : MOST CLAIMED FOODS
# =====================================================

food_claim_df = pd.read_sql("""
SELECT
f.food_name,
COUNT(c.claim_id) AS total_claims
FROM food_listing_data f
JOIN claims_data c
ON f.food_id = c.food_id
GROUP BY f.food_name
ORDER BY total_claims DESC
LIMIT 10
""", conn)

fig7 = px.bar(
    food_claim_df,
    x="total_claims",
    y="food_name",
    orientation="h",
    color="food_name",
    title="Most Claimed Foods"
)

st.plotly_chart(fig7, use_container_width=True)

# =====================================================
# CHART 8 : TOP DONATING PROVIDERS
# =====================================================

provider_df = pd.read_sql("""
SELECT
p.name_n,
SUM(f.quantity) AS total_donated
FROM providers_data p
JOIN food_listing_data f
ON p.provider_id = f.rovider_id
GROUP BY p.name_n
ORDER BY total_donated DESC
LIMIT 10
""", conn)

fig8 = px.bar(
    provider_df,
    x="name_n",
    y="total_donated",
    color="name_n",
    title="Top Donating Providers"
)

st.plotly_chart(fig8, use_container_width=True)

# ---------------- FOOTER ----------------

st.markdown("---")

st.success("✅ Food Waste Management Dashboard Loaded Successfully")

st.caption(
    "Developed using PostgreSQL, Python, Streamlit and Plotly"
)