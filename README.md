<p align="center">
  <img src="https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/main/icons/hospital.svg" width="120" height="120" alt="Indus Hospital Operations Logo" />
</p>

<h1 align="center">🏥 Indus Hospital Operations Intelligence Platform</h1>

<p align="center">
  <strong>An End-to-End Healthcare Data Engineering & Business Intelligence Solution</strong>
</p>

<p align="center">
  A production-grade relational database architecture, advanced SQL analytical engine, and executive Tableau dashboard suite designed to optimize hospital operations, bed capacity, and patient outcomes.
</p>

<p align="center">
  <a href="#-tech-stack">
    <img src="https://img.shields.io/badge/Database-MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL" />
  </a>
  <a href="#-tech-stack">
    <img src="https://img.shields.io/badge/Language-Advanced_SQL-003B57?style=for-the-badge&logo=sqlite&logoColor=white" alt="SQL" />
  </a>
  <a href="#-tech-stack">
    <img src="https://img.shields.io/badge/Visualization-Tableau-E97627?style=for-the-badge&logo=tableau&logoColor=white" alt="Tableau" />
  </a>
  <a href="#-tech-stack">
    <img src="https://img.shields.io/badge/Domain-Healthcare_Analytics-008080?style=for-the-badge&logo=bandcamp&logoColor=white" alt="Healthcare" />
  </a>
  <a href="#-license">
    <img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" alt="License" />
  </a>
</p>

<br />

---

## 📋 Table of Contents

- [📌 Project Overview](#-project-overview)
- [✨ Key Features](#-key-features)
- [🛠 Tech Stack](#-tech-stack)
- [🏗 System Architecture](#-system-architecture)
- [📐 Database Schema & Data Model](#-database-schema--data-model)
- [💻 Advanced SQL Analytics](#-advanced-sql-analytics)
- [📊 Executive Dashboards & Visualizations](#-executive-dashboards--visualizations)
- [📈 Key Business Insights & Metrics](#-key-business-insights--metrics)
- [📁 Repository Structure](#-repository-structure)
- [⚡ Installation & Setup Guide](#-installation--setup-guide)
- [🔒 Data Governance & Patient Privacy](#-data-governance--patient-privacy)
- [🙏 Acknowledgements & Context](#-acknowledgements--context)
- [👤 Author](#-author)

---

## 📌 Project Overview

Healthcare systems face immense operational challenges in managing inpatient flow, optimizing bed occupancy rates, balancing emergency vs. elective admissions, and tracking financial metrics across complex care departments.

The **Indus Hospital Operations Intelligence Platform** is an end-to-end data engineering and operational analytics project developed during a 40-hour internship targeting **Indus Hospital & Health Network (IHHN)** operational workflows. The platform ingests, normalizes, and analyzes hospital administration data to generate actionable insights for healthcare administrators, medical directors, and financial planners.


┌───────────────────────────────────────────────────────────────────────────────────┐
│                          OPERATIONAL CHALLENGE & SOLUTION                         │
├─────────────────────────────────────────┬─────────────────────────────────────────┤
│ 🚨 CHALLENGE                            │ 🎯 PLATFORM SOLUTION                    │
├─────────────────────────────────────────┼─────────────────────────────────────────┤
│ • High ICU & Emergency Bed Overcrowding │ • Real-Time Ward Occupancy Engine       │
│ • Unpredictable Length of Stay (LOS)    │ • Window-Function Patient Flow Analysis │
│ • Manual Billing & Revenue Bottlenecks  │ • Automated Financial Distribution KPIs │
└─────────────────────────────────────────┴─────────────────────────────────────────┘


### Core Objectives
* 🚨 **Operational Visibility:** Reduce patient throughput bottlenecks by monitoring admission patterns, peak discharge times, and average Length of Stay (LOS).
* 🛏️ **Resource & Capacity Optimization:** Track real-time ward and bed occupancy rates to mitigate overcrowding in critical departments (ICU, Emergency, Surgical).
* 💳 **Financial Performance & Billing:** Analyze billing distributions, insurance vs. self-pay trends, and departmental revenue efficiency.
* 🎯 **Data-Driven Decision Making:** Deliver interactive, multi-page executive dashboards engineered for high visual clarity and high-contrast accessibility.

---

## ✨ Key Features

* 🗄️ **3NF Normalized Relational Database:** Enforces strict referential integrity, domain constraints, and primary/foreign key indexing.
* ⚡ **Advanced Analytical SQL Suite:** Features Window Functions (`ROW_NUMBER`, `DENSE_RANK`, `LAG`/`LEAD`), CTEs, Aggregations, and Dynamic Time-Series Analysis.
* 📊 **Multi-Page Executive Tableau Dashboard:** Interactive analytical views tailored for clinical operations, bed management, patient demographics, and executive reporting.
* 🎨 **High-Contrast Dark Theme UI Design:** Customized slate/teal visualization layouts optimized for executive review and operational command centers.
* 🛡️ **Anonymized Synthetic Data Engine:** Fully compliant data generation pipeline mirroring real-world clinical and administrative distribution metrics.

---

## 🛠 Tech Stack

| Icon | Domain | Technology / Tool | Usage & Purpose |
| :-: | :--- | :--- | :--- |
| <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/mysql/mysql-original.svg" width="24"/> | **Database Engine** | MySQL Server 8.0+ | Relational data store, staging schemas, and constraint enforcement |
| <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/sqldeveloper/sqldeveloper-original.svg" width="24"/> | **Data Processing** | SQL (DDL, DML, DQL) | Data transformations, normalization, CTEs, and aggregation logic |
| <img src="https://cdn.worldvectorlogo.com/logos/tableau-software.svg" width="24"/> | **Business Intelligence** | Tableau Desktop / Public | Interactive dashboarding, dynamic parameters, and visual analytics |
| <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/python/python-original.svg" width="24"/> | **ETL & Data Prep** | Python / Pandas | Raw data cleansing, exploratory validation, and synthetic data generation |
| <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/markdown/markdown-original.svg" width="24"/> | **Documentation** | Markdown / Mermaid | Schema ERD diagramming and system architecture specifications |

---

## 🏗 System Architecture

The end-to-end data pipeline transforms transactional operational logs into structured analytical tables, ultimately feeding interactive executive reporting layers.

```mermaid
graph TD
    classDef source fill:#1e293b,stroke:#0f766e,stroke-width:2px,color:#fff;
    classDef etl fill:#334155,stroke:#14b8a6,stroke-width:2px,color:#fff;
    classDef db fill:#0f172a,stroke:#38bdf8,stroke-width:2px,color:#fff;
    classDef sql fill:#1e1b4b,stroke:#818cf8,stroke-width:2px,color:#fff;
    classDef bi fill:#311b92,stroke:#f59e0b,stroke-width:2px,color:#fff;

    subgraph Data_Ingestion ["📥 1. DATA SOURCE LAYER"]
        A1[📑 Operational Logs] ::: source
        A2[👤 Patient Records] ::: source
        A3[🛏️ Bed Status Logs] ::: source
        A4[💳 Billing Transactions] ::: source
    end

    subgraph Data_Processing ["⚡ 2. STAGING & ETL PROCESSING"]
        B1[🧹 Raw Data Cleansing & Validation] ::: etl
        B2[🔄 Type Casting & Null Imputation] ::: etl
    end

    subgraph Database_Layer ["🗄️ 3. RELATIONAL STORAGE (MySQL 8.0)"]
        C1[(🏛️ 3NF Normalized Schema)] ::: db
        C2[🔑 Foreign Key Constraints & Indexing] ::: db
        C3[👁️ Analytical Stored Views] ::: db
    end

    subgraph Analytics_Engine ["📊 4. ANALYTICAL SQL QUERY ENGINE"]
        D1[⏱️ Window Functions & Time-Series] ::: sql
        D2[🏥 Bed Occupancy & LOS Metrics] ::: sql
        D3[💰 Revenue & Utilization Analysis] ::: sql
    end

    subgraph Business_Intelligence ["📈 5. EXECUTIVE DASHBOARDS (Tableau)"]
        E1[🖥️ Operational Overview] ::: bi
        E2[🛏️ Capacity Management] ::: bi
        E3[💳 Financial Intelligence] ::: bi
    end

    Data_Ingestion --> Data_Processing
    Data_Processing --> Database_Layer
    Database_Layer --> Analytics_Engine
    Analytics_Engine --> Business_Intelligence
📐 Database Schema & Data ModelThe database is built on Third Normal Form (3NF) principles to eliminate data redundancy and preserve transactional integrity across complex healthcare events.Entity Relationship Diagram (ERD)Code snippeterDiagram
    PATIENTS ||--o{ ADMISSIONS : "makes"
    DOCTORS ||--o{ ADMISSIONS : "attends"
    DEPARTMENTS ||--o{ DOCTORS : "employs"
    DEPARTMENTS ||--o{ BED_ALLOCATION : "contains"
    BED_ALLOCATION ||--o{ ADMISSIONS : "assigned to"
    ADMISSIONS ||--|| BILLING : "generates"

    PATIENTS {
        int patient_id PK
        string first_name
        string last_name
        string gender
        date dob
        string contact_number
    }

    DOCTORS {
        int doctor_id PK
        string first_name
        string last_name
        int department_id FK
        string specialization
    }

    DEPARTMENTS {
        int department_id PK
        string department_name
        string floor_level
    }

    BED_ALLOCATION {
        int bed_id PK
        int department_id FK
        string bed_number
        string bed_type
        boolean is_occupied
    }

    ADMISSIONS {
        int admission_id PK
        int patient_id FK
        int doctor_id FK
        int department_id FK
        int bed_id FK
        datetime admission_date
        datetime discharge_date
        string admission_type
        string admission_status
    }

    BILLING {
        int bill_id PK
        int admission_id FK
        decimal total_amount
        decimal insurance_covered
        decimal patient_payable
        string payment_status
    }
PATIENTS TableColumn NameData TypeConstraintsDescriptionpatient_idINTPRIMARY KEY, AUTO_INCREMENTUnique patient identifierfirst_nameVARCHAR(50)NOT NULLPatient first namelast_nameVARCHAR(50)NOT NULLPatient last namegenderENUM('M', 'F', 'Other')NOT NULLPatient genderdobDATENOT NULLDate of birthcontact_numberVARCHAR(20)UNIQUEContact phone numberADMISSIONS TableColumn NameData TypeConstraintsDescriptionadmission_idINTPRIMARY KEY, AUTO_INCREMENTUnique admission record IDpatient_idINTFOREIGN KEY -> PATIENTSReference to admitted patientdoctor_idINTFOREIGN KEY -> DOCTORSPrimary attending physiciandepartment_idINTFOREIGN KEY -> DEPARTMENTSAdmitting specialty wardbed_idINTFOREIGN KEY -> BEDSAssigned bed locationadmission_dateDATETIMENOT NULLExact timestamp of admissiondischarge_dateDATETIMENULLABLETimestamp of dischargeadmission_typeVARCHAR(20)CHECK'Emergency', 'Elective', 'Urgent'BILLING TableColumn NameData TypeConstraintsDescriptionbill_idINTPRIMARY KEY, AUTO_INCREMENTUnique billing record IDadmission_idINTFOREIGN KEY -> ADMISSIONSCorresponding admissiontotal_amountDECIMAL(10,2)NOT NULLTotal gross invoice amountinsurance_coveredDECIMAL(10,2)DEFAULT 0.00Portion covered by insurancepatient_payableDECIMAL(10,2)NOT NULLDirect patient liabilitypayment_statusENUM'Paid', 'Pending', 'Claimed'Settlement status💻 Advanced SQL AnalyticsThe core analytical pipeline utilizes advanced SQL scripts to compute operational KPIs, track patient stay duration, and analyze hospital capacity.1. Patient Length of Stay (LOS) & Readmission AnalysisCalculates the average Length of Stay in days per department alongside 30-day readmission flags using SQL window functions.SQLWITH RankedAdmissions AS (
    SELECT 
        a.patient_id,
        a.admission_id,
        a.department_id,
        a.admission_date,
        a.discharge_date,
        DATEDIFF(a.discharge_date, a.admission_date) AS length_of_stay_days,
        LAG(a.discharge_date) OVER (
            PARTITION BY a.patient_id 
            ORDER BY a.admission_date
        ) AS previous_discharge_date
    FROM admissions a
    WHERE a.discharge_date IS NOT NULL
),
ReadmissionCalculations AS (
    SELECT 
        patient_id,
        admission_id,
        department_id,
        length_of_stay_days,
        DATEDIFF(admission_date, previous_discharge_date) AS days_since_last_discharge,
        CASE 
            WHEN DATEDIFF(admission_date, previous_discharge_date) <= 30 THEN 1 
            ELSE 0 
        END AS is_30day_readmission
    FROM RankedAdmissions
)
SELECT 
    d.department_name,
    COUNT(rc.admission_id) AS total_admissions,
    ROUND(AVG(rc.length_of_stay_days), 2) AS avg_los_days,
    SUM(rc.is_30day_readmission) AS total_30day_readmissions,
    ROUND((SUM(rc.is_30day_readmission) * 100.0 / COUNT(rc.admission_id)), 2) AS readmission_rate_pct
FROM ReadmissionCalculations rc
JOIN departments d ON rc.department_id = d.department_id
GROUP BY d.department_name
ORDER BY avg_los_days DESC;
SQLSELECT 
    d.department_name,
    COUNT(b.bed_id) AS total_beds,
    SUM(CASE WHEN b.is_occupied = 1 THEN 1 ELSE 0 END) AS occupied_beds,
    SUM(CASE WHEN b.is_occupied = 0 THEN 1 ELSE 0 END) AS available_beds,
    ROUND((SUM(CASE WHEN b.is_occupied = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(b.bed_id)), 2) AS occupancy_rate_pct,
    CASE 
        WHEN (SUM(CASE WHEN b.is_occupied = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(b.bed_id)) >= 85.0 THEN '🚨 CRITICAL OVERCAPACITY'
        WHEN (SUM(CASE WHEN b.is_occupied = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(b.bed_id)) >= 70.0 THEN '⚠️ HIGH OCCUPANCY'
        ELSE '✅ OPTIMAL CAPACITY'
    END AS operational_status
FROM beds b
JOIN departments d ON b.department_id = d.department_id
GROUP BY d.department_name
ORDER BY occupancy_rate_pct DESC;
SQLSELECT 
    d.department_name,
    COUNT(DISTINCT a.admission_id) AS total_cases,
    ROUND(SUM(b.total_amount), 2) AS gross_revenue,
    ROUND(SUM(b.insurance_covered), 2) AS insurance_reimbursements,
    ROUND(SUM(b.patient_payable), 2) AS out_of_pocket_revenue,
    ROUND(AVG(b.total_amount), 2) AS avg_revenue_per_patient,
    DENSE_RANK() OVER (ORDER BY SUM(b.total_amount) DESC) AS revenue_rank
FROM billing b
JOIN admissions a ON b.admission_id = a.admission_id
JOIN departments d ON a.department_id = d.department_id
WHERE b.payment_status IN ('Paid', 'Claimed')
GROUP BY d.department_name
ORDER BY gross_revenue DESC;
📊 Executive Dashboards & VisualizationsThe platform features a multi-page interactive executive reporting suite created in Tableau Desktop. Designed with a custom dark slate and deep cyan aesthetic, it emphasizes visual clarity, fast scanning, and key metrics.🖼️ Dashboard Preview GalleryExecutive Operations OverviewWard & Capacity ManagementKey KPIs, Monthly Trends & Flow RatesBed Occupancy & Departmental HeatmapsPatient DemographicsFinancial IntelligenceAge Pyramids & Admission Type RatiosRevenue Distribution & Settlement Status📈 Key Business Insights & MetricsThrough analytical SQL modeling and Tableau reporting, key operational insights were uncovered across administrative datasets:🔴 Bed Occupancy Bottlenecks: The Intensive Care Unit (ICU) and Emergency Department consistently operate near 88–92% capacity, exceeding the recommended clinical safety threshold of 85%.⏱️ Length of Stay Variability: Elective surgical cases showed a consistent average LOS of 4.2 days, whereas emergency surgical admissions exhibited high variance (6.8 days avg), indicating pre-op stabilization delays.🕒 Peak Admission Windows: Temporal analysis revealed peak emergency patient intake occurs between 18:00 and 23:00, allowing management to optimize nursing shift allocation.💳 Financial Payor Mix: Insurance claims cover approximately 64% of overall billing value, with direct patient liabilities accounting for 36%, emphasizing the need for streamlined claim clearance workflows.📁 Repository Structureindus-hospital-operations-intelligence/
├── 📄 README.md                          <- Project documentation & flagship overview
├── 📂 docs/
│   ├── 📐 ERD_Diagram.png                <- High-resolution Schema ERD
│   ├── 📑 Architecture_Overview.pdf      <- Detailed technical design documentation
│   └── 🖼️ screenshots/                   <- Visual previews for dashboard suite
│       ├── 01_operations_overview.png
│       ├── 02_capacity_management.png
│       ├── 03_patient_demographics.png
│       └── 04_financial_analytics.png
├── 📂 sql/
│   ├── 🏗️ DDL_schema_creation.sql        <- Database schema, tables, and foreign keys
│   ├── 📥 DML_data_ingestion.sql         <- Synthetic data loading scripts
│   ├── 📂 analytical_queries/            <- Production SQL queries & CTEs
│   │   ├── 01_patient_los_analytics.sql
│   │   ├── 02_bed_occupancy_rates.sql
│   │   └── 03_financial_revenue_kpis.sql
│   └── 📂 views/                         <- SQL views engineered for Tableau ingestion
│       └── create_tableau_views.sql
├── 📂 data/
│   ├── 📄 raw/                           <- Unprocessed CSV datasets (Synthetic)
│   └── 📊 processed/                     <- Cleansed and transformed staging files
└── 📂 tableau/
    └── 📈 Indus_Hospital_Operations_Dashboard.twbx <- Interactive Tableau Workbook
⚡ Installation & Setup GuideFollow these steps to replicate the database, execute analytical SQL scripts, and run the Tableau dashboard locally.Prerequisites🗄️ MySQL Server 8.0+ or MySQL Workbench installed.📊 Tableau Desktop (or Tableau Reader / Tableau Public) to view .twbx workbooks.📦 Git for repository cloning.Step 1: Clone the RepositoryBashgit clone [https://github.com/ma9731501/indus-hospital-operations-intelligence.git](https://github.com/ma9731501/indus-hospital-operations-intelligence.git)
cd indus-hospital-operations-intelligence
Step 2: Initialize Database & SchemaOpen MySQL Workbench or execute via CLI:Bashmysql -u root -p < sql/DDL_schema_creation.sql
mysql -u root -p < sql/DML_data_ingestion.sql
Step 3: Create Analytical ViewsExecute the SQL view creation script to prepare data pipelines for Tableau:Bashmysql -u root -p < sql/views/create_tableau_views.sql
Step 4: Open Tableau DashboardLaunch Tableau Desktop.Open tableau/Indus_Hospital_Operations_Dashboard.twbx.If prompted, update the MySQL connection credentials to point to your local database host (127.0.0.1:3306).🔒 Data Governance & Patient PrivacyIMPORTANT PRIVACY & COMPLIANCE NOTICE:To protect patient privacy and comply with healthcare data protection standards (including HIPAA and local data confidentiality guidelines), no real patient health information (PHI) or proprietary hospital records were used in this project.All records, patient demographics, clinical notes, and financial transactions within this repository were programmatically generated using anonymized synthetic data engines. The synthetic datasets mirror real-world operational distributions, statistical properties, and clinical patterns observed at Indus Hospital & Health Network without exposing sensitive personal data.🙏 Acknowledgements & ContextThis project was engineered as part of a 40-hour intensive data analytics internship program.Special thanks and appreciation to:🏥 Indus Hospital & Health Network (IHHN) — For providing guidance on healthcare operational workflows, hospital administration structures, and clinical reporting parameters.🎓 Karachi School of Business & Leadership (KSBL) — For foundational academic preparation in Data Science and Database Architecture.👨‍💻 Operations & IT Analytics Teams — For introducing domain standards in healthcare metrics, capacity management principles, and inpatient flow optimization.👤 AuthorMuhammad Ammar Saleem🎓 Education: B.S. Computer Science (Data Science Specialization), Karachi School of Business & Leadership (KSBL)💼 Specialization: Database Engineering, SQL Analytics, Business Intelligence & Visual Analytics📧 Email: ma9731501@gmail.com🐙 GitHub: ma9731501📊 Tableau Public: Ammar Saleem Portfolio
