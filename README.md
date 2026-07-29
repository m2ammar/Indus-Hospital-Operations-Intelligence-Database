# Hospital Analytics Project — Progress Log
*(Paste this whole file into a new chat to bring Claude back up to speed — memory is currently off in Settings.)*

---

## 🎯 Goal
Build a full Tableau hospital analytics project (28 KPIs, 4 dashboard pages) as a real portfolio piece — then document it properly (README, GitHub push, website case study, LinkedIn post) so it's defensible in interviews. Deadline: Tableau done by Thursday, documentation Friday.

---

## 🗂 Real Data Tables (confirmed from actual Tableau sidebar — use ONLY these in any README/schema writeup)
- `patients.csv`
- `admission.csv`
- `doctors.csv`
- `beds.csv`
- `wards.csv` (referenced via Ward Id in beds.csv)
- `diseases.csv`
- `patient_disease.csv`
- `emergency_visits.csv`
- `opd_visits_enriched.csv`
- `surgeries.csv`
- `donations.csv`

⚠️ Confirm exact field names per table before writing final SQL/README — some abbreviated in screenshots.

---

## 🎨 Design System (locked in, keep consistent across all 28 KPIs)
- **Background:** pure black (`Format → Shading → Worksheet`)
- **Label text:** small (~12-14pt), gray, uppercase (e.g. "TOTAL ADMISSIONS")
- **Number text:** large (~48-60pt), bold, white
- **Chart fill/bars:** slate/graphite tone — `#3A4149` (primary choice used so far)
- **Gridlines:** off where possible (some residual lines on one chart couldn't be removed — accepted as-is, not worth more time)
- **Axis/label text:** light gray or white for readability on black

---

## ✅ KPIs Completed So Far

### Page 1 — Admissions Overview
1. ✅ Total Admissions — 18,000 (`KPI_Total_Admissions`)
2. ✅ Total Patients — 12,000 (`Total_Patients`)
3. ✅ Emergency Visits — 6,000 (`KPI_Emergency_Visits`)
4. ✅ Visits by Triage Level — Non-urgent 3,309 / Urgent 2,102 / Critical 589 (`Visits_By_Triage`)
5. ✅ Avg Length of Stay — 4.506 → rounded to 1 decimal (`KPI_Avg_LOS`)
6. ✅ Admissions Over Time — monthly trend, area chart, Jan 1,447 → Dec 1,509, peak Oct 1,594 (`KPI_Admissions_Over_Time`)

### Page 2 — Doctors & Departments
7. ✅ Total Doctors (`KPI_Total_Doctors`)
8. ✅ Surgeon Ratio — 50% (calculated field, see below) (`KPI_Surgeon_Ratio`)
9. ✅ Avg Experience Years — 17.66 (`KPI_Avg_Experience`)
10. ✅ Admissions by Department — sorted bar chart: Orthopedics 2,483 (top) → Pulmonology 1,029 (bottom) (`KPI_Admissions_by_Department`)
11. ✅ Doctor Workload — Top 10 filter applied: Sarah Franklin 130 (top) → Larry Ballard 115 (`KPI_Doctor_Workload`)

### Page 3 — Emergency & OPD (in progress)
12. 🔲 Emergency Outcomes — next up, bar chart, `Outcome` × CNTD(`Emergency Id`)
13. 🔲 OPD Visits Total
14. 🔲 OPD Visits by Department
15. 🔲 Top Diseases (OPD)

### Page 4 — Surgeries & Donations (not started)
16. 🔲 Total Surgeries
17. 🔲 Surgery Success Rate (if outcome/status field exists)
18. 🔲 Total Donations
19. 🔲 Donations by Type/Category
20. 🔲 Bed Occupancy by Ward

*(Remaining KPIs to reach 28 total — to be finalized as each page is built out.)*

---

## 🛠 Tech Stack (confirmed — use these badges in the real README)

Markdown to paste directly into README:

```markdown
<p align="center">
  <img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white" alt="Python" />
  <img src="https://img.shields.io/badge/VS_Code-007ACC?style=for-the-badge&logo=visualstudiocode&logoColor=white" alt="VS Code" />
  <img src="https://img.shields.io/badge/MySQL_Workbench-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL Workbench" />
  <img src="https://img.shields.io/badge/Tableau_Public-E97627?style=for-the-badge&logo=tableau&logoColor=white" alt="Tableau Public" />
</p>
```

Renders as clean pill-shaped badges (same style as the earlier template, just accurate now):

| Tool | Actual Role in This Project |
|---|---|
| **Python (VS Code)** | Generated the synthetic hospital dataset — patients, admissions, doctors, beds, wards, diseases, emergency/OPD visits, surgeries, donations — exported to CSV |
| **MySQL Workbench** | Used for schema design / querying the relational structure before/alongside the CSV exports (confirm: did you also load the CSVs into MySQL and query them there, or was MySQL used only for schema modeling? — matters for how we word this in the real README) |
| **Tableau Public** | Built the 28-KPI, 4-page executive dashboard — relationships, calculated fields, styled KPI cards, bar/line/area charts |

⚠️ Note: don't add "MySQL Server 8.0+", "Advanced SQL Analytics" with fake window-function scripts, or any SQL code block unless you actually wrote and ran those queries. Only include real SQL if you can paste the actual `.sql` file content.

---

## 🧮 Calculated Fields Created
```
Surgeon Ratio =
SUM(IF [Is Surgeon] = 1 THEN 1 ELSE 0 END) / COUNTD([Doctor Id])
```
Formatted as percentage, 0 decimal places.

---

## ⚠️ README — Critical Correction Notes
An earlier draft README (AI-generated template, not based on real project) was reviewed and rejected for these reasons — **do not reuse any of the following in the final README:**

- ❌ Fabricated schema — tables like `BILLING`, `DEPARTMENTS`, `BED_ALLOCATION` with fields like `insurance_covered`, `payment_status` **do not exist** in the real dataset.
- ❌ Fabricated statistics — "ICU at 88-92% capacity," "avg LOS 4.2 days," "peak admissions 18:00-23:00," "64% insurance coverage" were never computed from real data.
- ❌ False claim of hospital partnership — language like "special thanks to Indus Hospital & Health Network for providing guidance on operational workflows" implies a real institutional collaboration that didn't happen. This is the highest-risk item — a recruiter could fact-check this directly.
- ❌ Wrong contact info / GitHub username / clone URL — all pointed to someone else's repo.
- ❌ References to files that don't exist (ERD diagrams, `.twbx` exports, view-creation SQL scripts) — only include files actually in the repo.

**What's worth keeping from that template:** the visual structure — badges, table of contents, mermaid architecture diagram, styled markdown tables. Just rebuild the *content* using:
- Your actual table/field names (list above)
- Real KPI numbers you've actually pulled in Tableau (list above)
- Your real GitHub username/email
- No claims of hospital partnership — frame it instead as "synthetic dataset modeled on hospital operations data" (accurate and still impressive)

---

## 📌 Next Steps
1. Finish Page 3 (Emergency Outcomes → OPD Visits Total → OPD by Dept → Top Diseases)
2. Finish Page 4 (Surgeries → Donations → Bed Occupancy)
3. Assemble all 4 dashboard pages in Tableau's Dashboard view
4. Friday: write README using only verified real content (this doc is your source of truth)
5. Push to GitHub with proper repo structure
6. Publish as case study on personal site
7. Post on LinkedIn

---
*Last updated: mid-build, Page 2 complete, starting Page 3.*
