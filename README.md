<!-- ====================================================== -->
<!--               HOSPITAL ANALYTICS PROJECT               -->
<!-- ====================================================== -->

<h1 align="center">🏥 Hospital Analytics Dashboard</h1>

<h3 align="center">
Executive Healthcare Intelligence using Tableau Public
</h3>

<p align="center">

<img src="https://img.shields.io/badge/Status-In%20Development-success?style=for-the-badge"/>

<img src="https://img.shields.io/badge/Tableau-28%20KPIs-E97627?style=for-the-badge&logo=tableau&logoColor=white"/>

<img src="https://img.shields.io/badge/Dashboards-4-blue?style=for-the-badge"/>

<img src="https://img.shields.io/badge/Data-Synthetic-important?style=for-the-badge"/>

</p>

---

> 💡 **Portfolio Project**
>
> This project demonstrates healthcare analytics using a synthetic hospital dataset designed to mirror real operational workflows.
>
> **No real patient information was used.**

---

# 📚 Table of Contents

- 🎯 Goal
- 🗂 Dataset
- 🏗 Project Progress
- 📊 Dashboard Pages
- 📈 KPI Progress
- 🛠 Technologies
- 🧮 Calculated Fields
- 🎨 Design System
- 📂 Repository Structure
- ⚠ Important Notes
- 🚀 Roadmap

---

# 🎯 Goal

Build a **professional healthcare analytics dashboard** in Tableau Public featuring **28 executive KPIs** across **4 dashboard pages**.

The finished project will become a complete portfolio case study including:

✅ Tableau Dashboard

✅ GitHub Repository

✅ Documentation

✅ Portfolio Website

✅ LinkedIn Showcase

---

# 🗂 Dataset

The project uses the following CSV tables.

| 📄 Table | Description |
|------------|----------------------------|
| 👤 patients.csv | Patient master records |
| 🏥 admission.csv | Admission history |
| 👨‍⚕️ doctors.csv | Doctor information |
| 🛏 beds.csv | Hospital bed records |
| 🏢 wards.csv | Hospital wards |
| 🦠 diseases.csv | Disease catalog |
| 🔗 patient_disease.csv | Patient-Disease bridge |
| 🚑 emergency_visits.csv | Emergency visits |
| 🩺 opd_visits_enriched.csv | OPD visits |
| 🔪 surgeries.csv | Surgery records |
| ❤️ donations.csv | Donation information |

---

# 🏗 Project Progress

```
Overall Progress

██████████████████░░░░░░░░░░░░ 70%

Dashboard Pages

███████████████░░░░░ 2.5 / 4

KPIs

██████████████░░░░░░ 11 / 28

Documentation

██░░░░░░░░░░░░░░░░░░ 5%
```

---

# 📊 Dashboard Pages

## 🏥 Page 1 — Admissions Overview

| Status | KPI |
|--------|----------------------------|
| ✅ | Total Admissions |
| ✅ | Total Patients |
| ✅ | Emergency Visits |
| ✅ | Visits by Triage |
| ✅ | Average Length of Stay |
| ✅ | Admissions Over Time |

---

## 👨‍⚕️ Page 2 — Doctors & Departments

| Status | KPI |
|--------|----------------------------|
| ✅ | Total Doctors |
| ✅ | Surgeon Ratio |
| ✅ | Average Experience |
| ✅ | Admissions by Department |
| ✅ | Doctor Workload |

---

## 🚑 Page 3 — Emergency & OPD

| Status | KPI |
|--------|----------------------------|
| ⏳ | Emergency Outcomes |
| ⏳ | OPD Visits |
| ⏳ | OPD by Department |
| ⏳ | Top Diseases |

---

## ❤️ Page 4 — Surgeries & Donations

| Status | KPI |
|--------|----------------------------|
| ⏳ | Total Surgeries |
| ⏳ | Surgery Success Rate |
| ⏳ | Total Donations |
| ⏳ | Donations by Category |
| ⏳ | Bed Occupancy |

---

# 📈 KPI Progress

## ✅ Completed KPIs

🏥 Total Admissions — **18,000**

👥 Total Patients — **12,000**

🚑 Emergency Visits — **6,000**

📅 Average Length of Stay — **4.5 Days**

👨‍⚕️ Total Doctors

📊 Admissions by Department

📈 Admissions Over Time

🩺 Doctor Workload

⭐ Surgeon Ratio

📚 Average Experience

🚨 Visits by Triage Level

---

# 🛠 Technologies

<p align="center">

<img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white"/>

<img src="https://img.shields.io/badge/VS_Code-007ACC?style=for-the-badge&logo=visualstudiocode&logoColor=white"/>

<img src="https://img.shields.io/badge/MySQL_Workbench-4479A1?style=for-the-badge&logo=mysql&logoColor=white"/>

<img src="https://img.shields.io/badge/Tableau_Public-E97627?style=for-the-badge&logo=tableau&logoColor=white"/>

<img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white"/>

<img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white"/>

</p>

---

## ⚙ Technology Roles

| Tool | Purpose |
|------|---------|
| 🐍 Python | Synthetic dataset generation |
| 💻 VS Code | Development |
| 🗄 MySQL Workbench | Schema modeling & SQL |
| 📊 Tableau Public | Dashboard development |
| 🌐 GitHub | Version control |

---

# 🧮 Calculated Fields

### Surgeon Ratio

```tableau
SUM(
IF [Is Surgeon]=1
THEN 1
ELSE 0
END
)
/ COUNTD([Doctor Id])
```

Formatted as Percentage (0 decimals)

---

# 🎨 Design System

| Item | Value |
|------|--------|
| ⚫ Background | Black |
| 🔠 Labels | Gray Uppercase |
| 🔢 KPI Numbers | White Bold |
| 📊 Chart Color | #3A4149 |
| 📈 Axis | Light Gray |
| 🚫 Gridlines | Hidden |

---

# 📂 Repository Structure

```
Hospital-Analytics/

│

├── 📁 Data

│ ├── patients.csv

│ ├── admission.csv

│ ├── doctors.csv

│ ├── beds.csv

│ ├── wards.csv

│ ├── diseases.csv

│ ├── patient_disease.csv

│ ├── emergency_visits.csv

│ ├── opd_visits_enriched.csv

│ ├── surgeries.csv

│ └── donations.csv

│

├── 📁 Tableau

│

├── 📁 SQL

│

├── 📁 Images

│

├── README.md

│

└── LICENSE

```

---

# 📌 Project Snapshot

🏥 11 Data Tables

📊 28 KPIs

📄 4 Dashboard Pages

👥 12,000 Patients

🏥 18,000 Admissions

🚑 6,000 Emergency Visits

🩺 Multiple Clinical Departments

❤️ Donation Analytics

🛏 Bed Occupancy Tracking

---

# ⚠ Important Notes

> ❗ This project uses **synthetic data** generated for educational and portfolio purposes.

> 🚫 No real patient information is included.

> 📊 KPI values are calculated from the generated dataset.

---

# 🚀 Roadmap

- [x] Generate Dataset
- [x] Create Relational Tables
- [x] Import into Tableau
- [x] Build Relationships
- [x] Design Page 1
- [x] Design Page 2
- [ ] Complete Page 3
- [ ] Complete Page 4
- [ ] Publish Tableau Public
- [ ] Write Final Documentation
- [ ] Upload GitHub Repository
- [ ] Publish Portfolio Case Study
- [ ] Share on LinkedIn

---

# 🏆 Project Highlights

⭐ Executive Dashboard

⭐ Healthcare Analytics

⭐ Interactive KPIs

⭐ Trend Analysis

⭐ Department Analysis

⭐ Emergency Insights

⭐ Donation Analytics

⭐ Bed Occupancy Monitoring

⭐ Dark Executive Theme

⭐ Portfolio Ready

---

# 💬 Project Vision

> **"Transforming complex healthcare data into clear, interactive insights through modern data visualization."**

---

<div align="center">

### 🚧 Currently Under Development

**Page 2 Completed • Page 3 In Progress**

Made with ❤️ using Python, SQL & Tableau Public.

</div>
