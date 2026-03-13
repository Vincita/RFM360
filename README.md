# Customer 360 – Customer Segmentation using RFM Analysis

## 1. Project Overview

This project builds a **Customer 360 view** by analyzing customer transaction data to understand customer behavior and value.

The analysis applies the **RFM model (Recency, Frequency, Monetary)** combined with **BCG Matrix segmentation** to identify different customer groups and provide actionable insights for marketing and customer retention strategies.

### Project Goals

- Analyze customer transaction data to understand purchasing behavior.
- Segment customers based on value and engagement level.
- Identify key customer groups such as loyal customers, potential customers, and churn-risk customers.
- Provide marketing recommendations to improve customer retention and revenue.

---

# 2. Methodology

## 2.1 Customer 360 Concept

Customer 360 is a data analysis approach that builds a **comprehensive view of customers** by integrating information such as transaction history, purchase frequency, and spending value.

This approach helps businesses:

- Understand customer behavior
- Identify high-value customers
- Detect potential churn risks
- Develop personalized marketing strategies

---

## 2.2 Analytical Models

### RFM Model (Recency – Frequency – Monetary)

The RFM model evaluates customer value based on three key metrics:

- **Recency (R):** Time since the customer's last purchase
- **Frequency (F):** Number of purchases within a given time period
- **Monetary (M):** Total amount spent by the customer

Each metric is segmented using **quartile-based segmentation**, assigning scores from **1 to 4**.

This creates **64 possible RFM combinations** used to identify customer behavior patterns.

---

### BCG Matrix

The **BCG Matrix** is used to evaluate customer segments based on:

- Customer value contribution
- Growth potential

Customers are categorized into four groups:

- **Stars:** High value and high growth potential
- **Cash Cows:** Stable revenue contributors
- **Question Marks:** Potential customers with growth opportunity
- **Dogs:** Low value and low growth potential

Combining **RFM and BCG** provides deeper insight into customer behavior and business value.

---

# 3. Dataset

The dataset was extracted from **Azure SQL Server**, containing customer information and transaction data.

### Main Tables

**Customer_Registered**

- Customer contract information
- Location and branch data
- Customer status
- Registration and cancellation dates

**Customer_Transaction**

- Transaction ID
- Customer ID
- Purchase date
- GMV (transaction value)

The dataset contains approximately **113,000 customers** with transaction data from **June 2022 to August 2022**.

---

# 4. Data Processing Workflow

The analysis process includes the following steps:

1. **Data Cleaning**
   - Keep active customers
   - Remove invalid transactions
   - Filter transactions with revenue greater than zero

2. **RFM Calculation**
   - Calculate Recency, Frequency, and Monetary metrics

3. **Quartile Segmentation**
   - Divide RFM metrics into four groups

4. **RFM Scoring**
   - Assign scores from 1 to 4 for each metric

5. **Customer Segmentation**
   - Generate RFM combinations to classify customer groups

6. **BCG Classification**
   - Evaluate customer segments based on value and growth potential

---

# 5. Customer Segments

The analysis identifies several key customer segments:

**Champions (VIP Customers)**  
Customers who spend frequently and recently with high transaction value.

**Loyal Customers**  
Customers with consistent purchase behavior and stable revenue contribution.

**Potential Loyalists**  
Customers with strong potential to become loyal customers in the future.

**New Customers**  
Recently acquired customers who have just started purchasing.

**Price Sensitive Customers**  
Customers who purchase often but spend relatively less.

**At Risk Customers**  
Customers who were active before but show declining engagement.

**Lost Customers**  
Customers who have stopped purchasing for a long time.

---

# 6. Key Business Insights

Several important insights were identified from the analysis:

- **Potential Loyalists** show the highest growth potential due to high purchase frequency and spending.
- **VIP and Loyal Customers** play an important role in generating stable revenue.
- A large portion of customers fall into **30–60 days and 90+ days recency groups**, indicating the need for re-engagement strategies.
- **At Risk customers** require attention to prevent churn.

---

# 7. Marketing Recommendations

### VIP Customers

- Provide exclusive promotions
- Implement loyalty programs
- Personalize customer experience

### Loyal Customers

- Maintain regular promotions
- Increase engagement through email marketing

### Potential Loyalists

- Encourage repeat purchases
- Introduce loyalty reward programs

### At Risk Customers

- Launch re-engagement campaigns
- Offer personalized discounts

### Lost Customers

- Run win-back campaigns
- Analyze reasons for customer churn

---

## 8. Repository Structure

```
Customer360-Analysis/
│
├── Customer360_Report.pdf
├── RFM_SQL_Query.sql
└── README.md
```

# 9. How to Use

1. Clone or download this repository.
2. Read the detailed report in **Customer360_Report.pdf**.
3. Review the SQL scripts used for RFM calculation.
4. Explore insights and recommendations from the analysis.

---

*This project was created for educational and data analysis practice purposes.*