# **Technical Training – Worksheet 2**  
## **Implementation of SELECT Queries with Filtering, Grouping and Sorting in PostgreSQL**

---

## 👨‍🎓 **Student Details**  
**Name:** Shubham Agarwal
**UID:** 25MCI10091  
**Branch:** MCA (AI & ML)  
**Semester:** 2nd  
**Section/Group:** 1/A  
**Subject:** Technical Training Lab  
**Date of Performance:** 20/01/2026  

---

## 🎯 **Aim of the Session**  
To implement and analyze SQL SELECT queries using filtering, sorting, grouping, and aggregation concepts in PostgreSQL for efficient data retrieval and analytical reporting.

---

## 💻 **Software Requirements**

- PostgreSQL (Database Server)  
- pgAdmin
- Windows Operating System  

---

## 📌 **Objective of the Session**  
- To retrieve specific data using filtering conditions  
- To sort query results using single and multiple attributes  
- To perform aggregation using grouping techniques  
- To apply conditions on aggregated data using HAVING clause  
- To understand real-world analytical queries commonly asked in placement interviews  

---

## 🛠️ **Practical / Experiment Steps**  
- Create a sample table representing customer orders  
- Insert realistic records into the table  
- Retrieve filtered data using WHERE clause  
- Sort query results using ORDER BY  
- Group records and apply aggregate functions  
- Apply conditions on grouped data using HAVING  
- Analyze execution order of WHERE and HAVING clauses  

---

# ⚙️ **Procedure of the Practical**


## **Step 1: Database and Table Creation**

```sql
CREATE DATABASE customer_db;
```

```sql
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(50),
    product VARCHAR(50),
    quantity INT,
    price NUMERIC(10,2),
    order_date DATE
);

INSERT INTO orders (customer_name, product, quantity, price, order_date) VALUES
('Amit', 'Laptop', 1, 65000, '2024-01-10'),
('Neha', 'Mobile', 2, 40000, '2024-01-12'),
('Rohan', 'Tablet', 1, 25000, '2024-01-15'),
('Simran', 'Laptop', 1, 70000, '2024-01-18'),
('Ankit', 'Mobile', 3, 60000, '2024-01-20'),
('Pooja', 'Headphones', 2, 5000, '2024-01-22'),
('Rahul', 'Laptop', 1, 68000, '2024-01-25');

```
<img width="876" height="265" alt="Order_Table_Creation_Record_Insertion" src="https://github.com/user-attachments/assets/d934a37e-cd53-4f0d-acdb-a2bd46812e3e">

---

## **Step 2: Filtering Data Using Conditions (WHERE)**

```sql Orders where Price > Rs.50000
SELECT *
FROM orders
WHERE price > 50000;
```
<img width="872" height="177" alt="Screenshot 2026-01-26 171919" src="https://github.com/user-attachments/assets/7ef4c930-23e7-47a6-ac9a-a2f8f5b4d40c">

---

## **Step 3: Sorting Query Results (ORDER BY)**

```sql
SELECT customer_name, product, price
FROM orders
ORDER BY price ASC;
```
---<img width="555" height="268" alt="Oder_By_ASC" src="https://github.com/user-attachments/assets/716129a9-208f-432e-89db-8420feb1f7dd">


## **Step 4: Grouping Data for Aggregation (GROUP BY)**

```sql
SELECT product,
SUM(price * quantity) AS total_sales
FROM orders
GROUP BY product;
```
<img width="351" height="173" alt="Screenshot 2026-01-26 173025" src="https://github.com/user-attachments/assets/7bba6796-23f8-4d0d-9bab-42c842718a7c">
---

## **Step 5: Applying Conditions on Aggregated Data (HAVING)**

```sql
SELECT product,
       SUM(price * quantity) AS total_sales
FROM orders
WHERE price > 30000
GROUP BY product;
```
<img width="351" height="173" alt="Screenshot 2026-01-26 173025" src="https://github.com/user-attachments/assets/ef2b777d-2cac-4615-9d74-f51310f8f767">

```sql
SELECT product,
SUM(quantity * price) AS total_sales
FROM customer_orders
GROUP BY product
HAVING SUM(quantity * price) > 50000;
```
<img width="348" height="110" alt="Screenshot 2026-01-26 173153" src="https://github.com/user-attachments/assets/3367bbac-4859-4836-b600-86ddc1dc907b">

---

## **Step 6: Filtering vs Aggregation Conditions**

```sql
SELECT product,
SUM(quantity * price) AS sales
FROM orders
WHERE order_date >= '2024-01-01'
  AND order_date <= '2024-01-31'
GROUP BY product;
```
< img src= "https://github.com/user-attachments/assets/7998f91b-179d-46b7-a410-b95ce99dad19" >

---

## 📥📤 **I/O Analysis (Input / Output)**

### **Input**
- Customer order details  
- Filtering, sorting, grouping, and aggregation queries  

### **Output**
- Filtered customer records  
- Sorted result sets  
- Group-wise sales summary  
- Aggregated revenue reports  

📸 Screenshots of execution and output are attached in this repository.

---

## 📘 **Learning Outcomes**  
- Students understand how data can be filtered to retrieve only relevant records.  
- Students learn how sorting improves readability and usefulness of reports.  
- Students gain the ability to group data for analytical purposes.  
- Students clearly differentiate between WHERE and HAVING clauses.  
- Students develop confidence in writing analytical SQL queries.  
- Students are better prepared for SQL-based placement and interview questions.

---

## 📂 **Repository Contents**
- README.md  
- Worksheet (Word & PDF)  
- SQL Queries  
- Screenshots  

---
