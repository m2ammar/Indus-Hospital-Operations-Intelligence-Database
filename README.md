<p align="center">
  <img src="https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/main/icons/hospital.svg" width="120" height="120" alt="Indus Hospital Operations Logo" />
</p>

<h1 align="center">🏥 Indus Hospital Operations Intelligence Platform</h1>

<p align="center">
  <strong>End-to-End Healthcare Relational Database Architecture & SQL Analytics Engine</strong>
</p>

<p align="center">
  A production-grade MySQL database schema and analytical SQL suite built during a 40-hour internship to model clinical workflows, patient flow, ward utilization, and operational capacity.
</p>

<p align="center">
  <a href="#-tech-stack">
    <img src="https://img.shields.io/badge/Database-MySQL_8.0+-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL" />
  </a>
  <a href="#-tech-stack">
    <img src="https://img.shields.io/badge/Language-Advanced_SQL-003B57?style=for-the-badge&logo=sqlite&logoColor=white" alt="SQL" />
  </a>
  <a href="#-tech-stack">
    <img src="https://img.shields.io/badge/Visualization-Tableau-E97627?style=for-the-badge&logo=tableau&logoColor=white" alt="Tableau" />
  </a>
  <a href="#-tech-stack">
    <img src="https://img.shields.io/badge/Domain-Healthcare_Data_Engineering-008080?style=for-the-badge&logo=bandcamp&logoColor=white" alt="Healthcare Analytics" />
  </a>
  <a href="#-license">
    <img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" alt="License" />
  </a>
</p>

<br />

---

## 📋 Table of Contents

- [📌 Project Overview](#-project-overview)
- [✨ Core Capabilities](#-core-capabilities)
- [🛠 Tech Stack](#-tech-stack)
- [🏗 System Architecture](#-system-architecture)
- [📐 Database Schema & Entity Relationships](#-database-schema--entity-relationships)
- [💻 Advanced SQL Analytics](#-advanced-sql-analytics)
- [📊 Operations Dashboard & Visualization](#-operations-dashboard--visualization)
- [⚡ Setup & Execution Guide](#-setup--execution-guide)
- [🔒 Data Privacy & Compliance](#-data-privacy--compliance)
- [🙏 Internship Context & Acknowledgements](#-internship-context--acknowledgements)
- [👤 Author](#-author)

---

## 📌 Project Overview

Healthcare systems face complex operational challenges in tracking patient movement across emergency admissions, outpatient visits, inpatient ward capacity, surgical queues, and donor allocations.

The **Indus Hospital Operations Intelligence Platform** is a normalized relational database and analytical reporting project developed during a 40-hour internship. The platform models core hospital operations to analyze bed availability, emergency intake patterns, outpatient volume, and patient length of stay across clinical departments.

┌───────────────────────────────────────────────────────────────────────────────────┐│                           OPERATIONAL DATA FLOW                                   │├─────────────────────────────────────────┬─────────────────────────────────────────┤│ 🏥 CLINICAL ENTRIES                     │ 📊 ANALYTICAL OUTPUTS                   │├─────────────────────────────────────────┼─────────────────────────────────────────┤│ • Inpatient Admissions & Ward Beds      │ • Length of Stay (LOS) Window Functions ││ • Emergency Visits & OPD Trajectories   │ • Real-time Bed Utilization Ratios      ││ • Surgical Schedules & Doctor Rosters   │ • OPD & Emergency Volume Aggregations   │└─────────────────────────────────────────┴─────────────────────────────────────────┘
---

## ✨ Core Capabilities

* 🗄️ **Normalized Relational Schema (3NF):** Modeled around primary operational entities (`patients`, `doctors`, `wards`, `beds`, `admissions`, `surgeries`, `opd_visits`, `emergency_visits`, and `donations`) with strict foreign key constraints.
* ⚡ **Analytical SQL Suite:** Queries utilizing Common Table Expressions (CTEs), Aggregations, Conditional Summaries, and Window Functions (`LAG`, `LEAD`, `DENSE_RANK`) for throughput analysis.
* 📊 **Operational Dashboarding:** Structured SQL aggregations designed for seamless ingestion into Tableau for executive visual reporting.
* 🛡️ **Anonymized Synthetic Dataset:** Modeled using realistic synthetic data parameters to simulate real-world patient volume without using actual patient health information.

---

## 🛠 Tech Stack

| Icon | Layer | Technology / Tool | Usage & Description |
| :-: | :--- | :--- | :--- |
| <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/mysql/mysql-original.svg" width="24"/> | **Database Engine** | MySQL Server 8.0+ | Relational data engine, tables, constraints, and relational indexing |
| <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/sqldeveloper/sqldeveloper-original.svg" width="24"/> | **Query Language** | SQL (DDL, DML, DQL) | Data definitions, relational integrity rules, CTEs, and window analytics |
| <img src="https://cdn.worldvectorlogo.com/logos/tableau-software.svg" width="24"/> | **Analytics & BI** | Tableau | Interactive reporting layouts for capacity and patient flow analysis |
| <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/markdown/markdown-original.svg" width="24"/> | **Documentation** | Markdown & Mermaid | Schema ERD visualization and workflow architecture specifications |

---

## 🏗 System Architecture

```mermaid
graph TD
    classDef raw fill:#1e293b,stroke:#0f766e,stroke-width:2px,color:#fff;
    classDef db fill:#0f172a,stroke:#38bdf8,stroke-width:2px,color:#fff;
    classDef analytics fill:#1e1b4b,stroke:#818cf8,stroke-width:2px,color:#fff;
    classDef bi fill:#311b92,stroke:#f59e0b,stroke-width:2px,color:#fff;

    subgraph Data_Sources ["📥 1. TRANSACTIONAL ENTRIES"]
        A1[👤 Patients & Doctors] ::: raw
        A2[🛏️ Wards & Bed Allocations] ::: raw
        A3[🚨 Emergency & OPD Visits] ::: raw
        A4[🩸 Donations & Surgical Logs] ::: raw
    end

    subgraph Relational_Database ["🗄️ 2. MYSQL 8.0 RELATIONAL ENGINE"]
        B1[(🏛️ 3NF Normalized Schema)] ::: db
        B2[🔑 Foreign Key Constraints & Indexes] ::: db
    end

    subgraph SQL_Analytics ["📊 3. ANALYTICAL QUERY SUITE"]
        C1[⏱️ Length of Stay CTEs] ::: analytics
        C2[🏥 Ward Occupancy Metrics] ::: analytics
        C3[📈 OPD vs Emergency Throughput] ::: analytics
    end

    subgraph Visual_Reporting ["📈 4. DASHBOARD SUITE"]
        D1[🖥️ Tableau Operational Views] ::: bi
    end

    Data_Sources --> Relational_Database
    Relational_Database --> SQL_Analytics
    SQL_Analytics --> Visual_Reporting
📐 Database Schema & Entity RelationshipsThe schema models core healthcare operational workflows across 9 core entities.Code snippeterDiagram
    PATIENTS ||--o{ ADMISSIONS : "admitted for"
    PATIENTS ||--o{ OPD_VISITS : "attends"
    PATIENTS ||--o{ EMERGENCY_VISITS : "presents"
    PATIENTS ||--o{ SURGERIES : "undergoes"
    PATIENTS ||--o{ DONATIONS : "contributes"

    DOCTORS ||--o{ ADMISSIONS : "attends"
    DOCTORS ||--o{ OPD_VISITS : "consults"
    DOCTORS ||--o{ SURGERIES : "performs"

    WARDS ||--o{ BEDS : "contains"
    BEDS ||--o{ ADMISSIONS : "assigned to"

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
        string specialization
        string contact_number
    }

    WARDS {
        int ward_id PK
        string ward_name
        string ward_type
        int capacity
    }

    BEDS {
        int bed_id PK
        int ward_id FK
        string bed_number
        string status
    }

    ADMISSIONS {
        int admission_id PK
        int patient_id FK
        int doctor_id FK
        int bed_id FK
        datetime admission_date
        datetime discharge_date
        string admission_type
    }

    SURGERIES {
        int surgery_id PK
        int patient_id FK
        int doctor_id FK
        datetime surgery_date
        string surgery_type
        string status
    }

    OPD_VISITS {
        int opd_id PK
        int patient_id FK
        int doctor_id FK
        datetime visit_date
        string diagnosis
    }

    EMERGENCY_VISITS {
        int emergency_id PK
        int patient_id FK
        datetime visit_date
        string condition_severity
        string outcome
    }

    DONATIONS {
        int donation_id PK
        int patient_id FK
        decimal amount
        date donation_date
        string donation_type
    }
Table NamePrimary KeyKey Foreign KeysPrimary Purposepatientspatient_idNoneCentral demographic index for all individuals receiving caredoctorsdoctor_idNonePhysician registry and clinical specializationswardsward_idNoneHospital care units and overall capacity limitsbedsbed_idward_idInpatient bed inventory and availability stateadmissionsadmission_idpatient_id, doctor_id, bed_idInpatient stay logs with admission/discharge timestampssurgeriessurgery_idpatient_id, doctor_idSurgical procedures, schedule, and completion statusesopd_visitsopd_idpatient_id, doctor_idOutpatient department consultations and diagnosis logsemergency_visitsemergency_idpatient_idUrgent/Emergency intake logs, severity, and outcome trackingdonationsdonation_idpatient_idPhilanthropic financial and material contribution records💻 Advanced SQL AnalyticsSample queries from the analytical suite designed for operational throughput tracking.1. Inpatient Length of Stay (LOS) ComputationUses SQL DATEDIFF and window functions to compute inpatient stay duration per ward.SQLSELECT 
    w.ward_name,
    COUNT(a.admission_id) AS total_admissions,
    ROUND(AVG(DATEDIFF(a.discharge_date, a.admission_date)), 2) AS avg_length_of_stay_days,
    MAX(DATEDIFF(a.discharge_date, a.admission_date)) AS max_stay_days
FROM admissions a
JOIN beds b ON a.bed_id = b.bed_id
JOIN wards w ON b.ward_id = w.ward_id
WHERE a.discharge_date IS NOT NULL
GROUP BY w.ward_name
ORDER BY avg_length_of_stay_days DESC;
SQLSELECT 
    w.ward_name,
    w.capacity AS total_capacity,
    COUNT(b.bed_id) AS total_beds_configured,
    SUM(CASE WHEN b.status = 'Occupied' THEN 1 ELSE 0 END) AS occupied_beds,
    ROUND((SUM(CASE WHEN b.status = 'Occupied' THEN 1 ELSE 0 END) * 100.0 / w.capacity), 2) AS ward_occupancy_pct
FROM wards w
LEFT JOIN beds b ON w.ward_id = b.ward_id
GROUP BY w.ward_id, w.ward_name, w.capacity
ORDER BY ward_occupancy_pct DESC;
SQLSELECT 
    condition_severity,
    outcome,
    COUNT(emergency_id) AS total_cases,
    ROUND((COUNT(emergency_id) * 100.0 / (SELECT COUNT(*) FROM emergency_visits)), 2) AS percentage_of_total
FROM emergency_visits
GROUP BY condition_severity, outcome
ORDER BY total_cases DESC;
📊 Operations Dashboard & VisualizationAnalytical views engineered in SQL are imported into Tableau to present operational visual insights:Inpatient Flow: Admissions trend vs. discharge timelines.Bed Occupancy: Live availability tracking across configured wards.Outpatient & Emergency Intake: Patient volume metrics by department and severity.(Add your dashboard screenshots or Tableau Public links here)⚡ Setup & Execution GuidePrerequisitesMySQL Server 8.0+ or MySQL Workbench installed.Git for repository cloning.1. Clone the RepositoryBashgit clone [https://github.com/m2ammar/indus-hospital-operations-intelligence.git](https://github.com/m2ammar/indus-hospital-operations-intelligence.git)
cd indus-hospital-operations-intelligence
2. Database InitializationRun the SQL scripts in your MySQL client to build the schema and populate initial data:SQL-- Execute schema creation
SOURCE schema.sql;

-- Execute analytical queries
SOURCE analytics.sql;
🔒 Data Privacy & ComplianceData Integrity & Anonymization Note:No real patient health information (PHI) or confidential hospital administrative records were used in this project.All records within this database—including patient demographics, dates, doctor names, and visit histories—were programmatically generated as anonymized synthetic data to model operational healthcare database patterns responsibly.🙏 Internship Context & AcknowledgementsThis project was built independently during a 40-hour data analytics internship, designed to practice database normalization, foreign key constraint management, and analytical SQL modeling on realistic healthcare data structures.👤 AuthorMuhammad Ammar Saleem🎓 Education: B.S. Computer Science (Data Science Specialization), Karachi School of Business & Leadership (KSBL)💼 Focus Areas: Database Engineering, SQL Analytics, Data Pipelines & Business Intelligence📧 Email: ma9731501@gmail.com🐙 GitHub: @m2ammar
