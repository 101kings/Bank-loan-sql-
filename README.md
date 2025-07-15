# 💳 Bank Loan Performance Dashboard

This is an end-to-end data analytics project that analyzes loan performance using SQL for data processing and Tableau for interactive dashboard reporting. The goal is to uncover trends, identify risk patterns, and visualize key loan metrics to support strategic decision-making in a financial institution.

---

## 📊 Tools & Technologies
- **SQL Server** – Data querying, transformation, KPI generation
- **Tableau Public** – Interactive dashboard and data storytelling
- **GitHub** – Project documentation and version control

---

## 🔍 Problem Statement
> "How can a bank track the health and performance of its loan portfolio through key performance indicators (KPIs), and identify trends and risks across different borrower segments?"

---

## 📈 Dashboards Overview

### 📌 [🔗 View Live Tableau Dashboard](https://public.tableau.com/views/Bankloanreport1_17525284680650/SUMMARY)

### 🧮 1. **Performance Summary**
- KPIs: Total applications, funded amount, payments received, interest rate, DTI
- Good vs Bad loan classification
- Percentage breakdowns and health indicators

### 🌍 2. **Loan Overview**
- Monthly loan trends (applications, funding, payments)
- State-wise performance (filled map)
- Loan segmentation by:
  - Term (36/60 months)
  - Purpose
  - Employment length
  - Home ownership

### 🔍 3. **Loan Details**
- Loan-level view for filtering and drill-down
- Includes loan status, borrower features, and metrics
- Dynamic filters by loan term, state, and purpose

---

## 🧾 SQL Scripts

SQL queries were used to prepare data and generate KPIs consumed by the Tableau dashboards.

### 📄 [`sql/performance_indicators.sql`](sql/performance_indicators.sql) includes:
- Total applications, funded amount, payments
- Average interest and DTI ratios
- Good vs Bad loan categorization
- Trends by issue date (monthly)
- Aggregations by:
  - Loan status
  - State
  - Purpose
  - Term
  - Employment length
  - Home ownership

---

## 📂 Folder Structure

