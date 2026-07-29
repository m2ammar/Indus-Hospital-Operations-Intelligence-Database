# 🏥 Indus Hospital Operations Intelligence Platform

<p align="center">

<img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white"/>
<img src="https://img.shields.io/badge/Tableau-E97627?style=for-the-badge&logo=tableau&logoColor=white"/>
<img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white"/>
<img src="https://img.shields.io/badge/SQL-336791?style=for-the-badge&logo=postgresql&logoColor=white"/>
<img src="https://img.shields.io/badge/Faker-Synthetic%20Data-34A853?style=for-the-badge"/>
<img src="https://img.shields.io/badge/Healthcare-Analytics-C62828?style=for-the-badge"/>
<img src="https://img.shields.io/badge/Internship-Indus%20Hospital-00695C?style=for-the-badge"/>

</p>

<p align="center">

<b>An end-to-end healthcare analytics platform developed during my 40-hour internship at Indus Hospital & Health Network.</b>

From synthetic data generation → relational database design → SQL analytics → executive Tableau dashboards.

</p>

---

## 🔗 Live Dashboard

**Explore the interactive dashboard on Tableau Public**

**➡️ https://public.tableau.com/app/profile/muhammad.ammar.saleem/viz/indus-hospital/IndusHospitalOperationsIntelligence**

---

# 📖 Overview

Healthcare organizations generate enormous volumes of operational data every day across admissions, outpatient departments (OPD), emergency services, surgeries, wards, beds, and fundraising activities. Although each department captures valuable information, these datasets often exist independently, making organization-wide analysis difficult.

This project brings those disconnected datasets together into a unified healthcare analytics platform.

Developed during my internship with the **IT Department at Indus Hospital & Health Network**, the project demonstrates how operational data can be transformed into meaningful business intelligence using **MySQL**, **Python**, and **Tableau**.

To protect patient privacy, the project uses **77,000+ synthetic yet realistic records** that simulate real hospital operations while preserving the structure and complexity of production healthcare systems.

---

# ✨ Project Highlights

- 🏥 Designed a fully normalized **11-table relational database**
- 📊 Generated **77,740+ realistic healthcare records** using Python & Faker
- 🧹 Simulated real-world dirty data before performing systematic data cleaning
- ✅ Performed structural, referential, and business-rule validation
- 📈 Developed analytical SQL using **JOINs, CASE, CTEs, Window Functions, LAG(), and RANK()**
- 📊 Built a **4-page executive Tableau dashboard**
- 💡 Answered operational questions involving admissions, emergency services, surgeries, donations, bed utilization, and doctor workload
- ⚙️ Completed as an end-to-end solution during a **40-hour internship**

---

# 🏥 About Indus Hospital & Health Network

Indus Hospital & Health Network is one of Pakistan's largest not-for-profit healthcare organizations, providing quality healthcare free of charge through a donation-funded model.

During my internship with the IT Department, I explored how operational hospital data could be structured into a centralized analytics platform capable of supporting operational reporting and management decision-making.

Since real patient records cannot be publicly shared, this project is built entirely using synthetic data designed to closely resemble realistic healthcare operations while maintaining patient confidentiality.

---

# 🎯 Business Problem

Hospital operations involve numerous independent workflows:

- Patient Registration
- Admissions
- Emergency Department
- Outpatient Department (OPD)
- Surgeries
- Wards & Beds
- Doctors
- Donations

Without integrating these datasets, answering organization-wide questions becomes difficult.

Examples include:

- Which departments have the longest average patient stay?
- What is the hospital's 30-day readmission rate?
- Which doctors handle the highest combined workload?
- How efficiently are beds being utilized?
- Which surgery departments experience the highest cancellation rates?
- Which donation campaigns generate the greatest impact?
- Which diseases occur most frequently across the patient population?

This project consolidates those disconnected datasets into a centralized operational intelligence platform capable of answering these questions through SQL analytics and interactive dashboards.

---

# 🏗️ System Architecture

```text
                 Python + Faker
                        │
                        ▼
          Synthetic Healthcare Dataset
                        │
                        ▼
               Data Cleaning & Validation
                        │
                        ▼
             Normalized MySQL Database
                        │
                        ▼
               SQL KPI & Analytics Layer
                        │
                        ▼
         CSV Export for Tableau Public
                        │
                        ▼
         Executive Interactive Dashboard
```

---

# 📊 Platform Overview

| Component | Description |
|------------|-------------|
| 🐍 Data Generation | Synthetic healthcare dataset generated using Python & Faker |
| 🗄️ Database | Normalized MySQL database with 11 related tables |
| 🧹 Data Cleaning | Missing values, inconsistent text, and formatting standardized |
| ✅ Validation | Structural, referential, and business-rule integrity checks |
| 📈 Analytics | Business KPIs developed using advanced SQL |
| 📊 Visualization | Four-page Tableau Public executive dashboard |

---

# 📁 Dataset Summary

| Table | Records |
|--------|---------:|
| Patients | 12,000 |
| Diseases | 40 |
| Doctors | 180 |
| Wards | 20 |
| Beds | 500 |
| Admissions | 18,000 |
| Patient Disease | 18,000 |
| OPD Visits | 15,000 |
| Emergency Visits | 6,000 |
| Surgeries | 4,000 |
| Donations | 4,000 |

### Total Records

**≈ 77,740**

---

# 📸 Dashboard Preview

> **Replace these placeholders with screenshots from Tableau Public**

| Executive Dashboard |
|----------------------|
| ![](screenshots/executive-overview.png) |

| Patient Demographics |
|----------------------|
| ![](screenshots/patient-demographics.png) |

| OPD & Emergency |
|----------------------|
| ![](screenshots/opd-emergency.png) |

| Surgeries & Donations |
|----------------------|
| ![](screenshots/surgeries-donations.png) |

---

# 📑 Table of Contents

- Overview
- About Indus Hospital
- Business Problem
- Project Highlights
- System Architecture
- Dataset Summary
- Database Design
- Data Cleaning
- Data Validation
- SQL Analytics
- Dashboard
- Technical Challenges
- Technologies Used
- Repository Structure
- Acknowledgements

---
