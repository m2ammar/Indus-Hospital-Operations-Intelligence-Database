-- ============================================================
-- Indus Hospital Project — Database Schema
-- Engine: MySQL
-- Order: parent tables first, then tables with foreign keys
-- ============================================================
 
CREATE DATABASE IF NOT EXISTS indus_hospital;
USE indus_hospital;
 
  
-- ============================================================
-- 1. PATIENTS (12,000 rows)
-- ============================================================
CREATE TABLE patients (
    patient_id          VARCHAR(10) PRIMARY KEY,
    name                VARCHAR(100) NOT NULL,
    age                 INT NOT NULL,
    gender              VARCHAR(10),          -- intentionally dirty: 'Male','male','M', etc.
    city                VARCHAR(100),
    contact             VARCHAR(30) NULL,      -- ~3% NULL by design
    registration_date   DATE NOT NULL,
    insurance_status    VARCHAR(20) NULL       -- 'Insured','Uninsured', or NULL
);
Select * from patients;
SELECT COUNT(*) FROM patients;
 
-- ============================================================
-- 2. DISEASES (40 rows) — reference table
-- ============================================================
CREATE TABLE diseases (
    disease_id    VARCHAR(10) PRIMARY KEY,
    disease_name  VARCHAR(100) NOT NULL
);
Select * from diseases;
SELECT COUNT(*) FROM diseases;
 
-- ============================================================
-- 3. DOCTORS (180 rows)
-- ============================================================
CREATE TABLE doctors (
    doctor_id          VARCHAR(10) PRIMARY KEY,
    name               VARCHAR(100) NOT NULL,
    department         VARCHAR(50) NOT NULL,
    is_surgeon         BOOLEAN NOT NULL,
    experience_years   INT NOT NULL
);
Select * from doctors;
SELECT COUNT(*) FROM doctors;

-- ============================================================
-- 4. WARDS (20 rows)
-- ============================================================
CREATE TABLE wards (
    ward_id    VARCHAR(10) PRIMARY KEY,
    ward_name  VARCHAR(100) NOT NULL
);
Select * from wards; 
DELETE FROM wards WHERE ward_id = 'ward_id' OR ward_id IS NULL;
SELECT COUNT(*) FROM wards;
 
-- ============================================================
-- 5. BEDS (500 rows) — depends on wards
-- ============================================================
CREATE TABLE beds (
    bed_id   VARCHAR(10) PRIMARY KEY,
    ward_id  VARCHAR(10) NOT NULL,
    FOREIGN KEY (ward_id) REFERENCES wards(ward_id)
);
Select * from beds;
SELECT COUNT(*) FROM beds;

SELECT * FROM beds WHERE bed_id NOT LIKE 'BED_%';
DELETE FROM beds WHERE bed_id IS NULL;
COMMIT;
SELECT bed_id, ward_id FROM beds WHERE bed_id IS NULL OR bed_id = '' OR ward_id IS NULL;
DELETE FROM beds WHERE bed_id = 'bed_id' OR bed_id IS NULL;


-- ============================================================
-- 6. PATIENT_DISEASE (18,000 rows) — bridge table, many-to-many
-- ============================================================
CREATE TABLE patient_disease (
    record_id   VARCHAR(10) PRIMARY KEY,
    patient_id  VARCHAR(10) NOT NULL,
    disease_id  VARCHAR(10) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (disease_id) REFERENCES diseases(disease_id)
);

Select * from patient_disease;
SELECT COUNT(*) FROM patient_disease;
 
-- ============================================================
-- 7. ADMISSIONS (18,000 rows) — depends on patients, doctors, beds
-- ============================================================
CREATE TABLE admissions (
    admission_id     VARCHAR(10) PRIMARY KEY,
    patient_id       VARCHAR(10) NOT NULL,
    doctor_id        VARCHAR(10) NOT NULL,
    bed_id           VARCHAR(10) NOT NULL,
    admit_date       DATE NOT NULL,
    discharge_date   DATE NOT NULL,
    length_of_stay   INT NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
    FOREIGN KEY (bed_id) REFERENCES beds(bed_id)
);

Select * from admissions;
SELECT COUNT(*) FROM admissions;
 
-- ============================================================
-- 8. DONATIONS (4,000 rows) — independent table
-- ============================================================
CREATE TABLE donations (
    donation_id    VARCHAR(10) PRIMARY KEY,
    donor_name     VARCHAR(100) NULL,      -- ~15% anonymous (NULL)
    amount         DECIMAL(12,2) NOT NULL,
    campaign       VARCHAR(50) NOT NULL,
    donation_date  DATE NOT NULL,
    recurring      BOOLEAN NOT NULL
);

Select * from donations;
SELECT COUNT(*) FROM donations;
 
-- ============================================================
-- 9. EMERGENCY_VISITS (6,000 rows) — depends on patients
-- ============================================================
CREATE TABLE emergency_visits (
    emergency_id   VARCHAR(10) PRIMARY KEY,
    patient_id     VARCHAR(10) NOT NULL,
    arrival_date   DATE NOT NULL,
    arrival_time   TIME NOT NULL,
    triage_level   VARCHAR(20) NOT NULL,   -- 'Critical','Urgent','Non-urgent'
    outcome        VARCHAR(30) NOT NULL,   -- 'Admitted','Treated & Discharged','Referred'
    department     VARCHAR(50) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

Select * from emergency_visits;
SELECT COUNT(*) FROM emergency_visits;
 
-- ============================================================
-- 10. OPD_VISITS (15,000 rows) — depends on patients, doctors, diseases
-- ============================================================
CREATE TABLE opd_visits (
    opd_id                VARCHAR(10) PRIMARY KEY,
    patient_id            VARCHAR(10) NOT NULL,
    doctor_id             VARCHAR(10) NOT NULL,
    department            VARCHAR(50) NOT NULL,
    disease_id            VARCHAR(10) NOT NULL,
    visit_date            DATE NOT NULL,
    follow_up_required    BOOLEAN NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
    FOREIGN KEY (disease_id) REFERENCES diseases(disease_id)
);

Select * from opd_visits;
SELECT COUNT(*) FROM opd_visits;
 
-- ============================================================
-- 11. SURGERIES (4,000 rows) — depends on admissions, patients, doctors
-- ============================================================
CREATE TABLE surgeries (
    surgery_id            VARCHAR(10) PRIMARY KEY,
    admission_id          VARCHAR(10) NOT NULL,
    patient_id            VARCHAR(10) NOT NULL,
    doctor_id             VARCHAR(10) NOT NULL,
    procedure_name        VARCHAR(100) NOT NULL,
    department             VARCHAR(50) NOT NULL,
    scheduled_date         DATE NOT NULL,
    status                 VARCHAR(20) NOT NULL,   -- 'Completed','Cancelled','Postponed'
    cancellation_reason    VARCHAR(100) NULL,      -- only set when status = 'Cancelled'
    FOREIGN KEY (admission_id) REFERENCES admissions(admission_id),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

Select * from surgeries;
SELECT COUNT(*) FROM surgeries;


-- =======================================================
-- Tier 1 — Orphan checks (FK values with no matching parent row). 
-- These should all return 0 if your CSVs were generated correctly:
-- =======================================================

-- admissions
SELECT COUNT(*) FROM admissions a LEFT JOIN patients p ON a.patient_id = p.patient_id WHERE p.patient_id IS NULL;
SELECT COUNT(*) FROM admissions a LEFT JOIN doctors d ON a.doctor_id = d.doctor_id WHERE d.doctor_id IS NULL;
SELECT COUNT(*) FROM admissions a LEFT JOIN beds b ON a.bed_id = b.bed_id WHERE b.bed_id IS NULL;

-- beds
SELECT COUNT(*) FROM beds b LEFT JOIN wards w ON b.ward_id = w.ward_id WHERE w.ward_id IS NULL;

-- patient_disease
SELECT COUNT(*) FROM patient_disease pd LEFT JOIN patients p ON pd.patient_id = p.patient_id WHERE p.patient_id IS NULL;
SELECT COUNT(*) FROM patient_disease pd LEFT JOIN diseases dz ON pd.disease_id = dz.disease_id WHERE dz.disease_id IS NULL;

-- opd_visits
SELECT COUNT(*) FROM opd_visits o LEFT JOIN patients p ON o.patient_id = p.patient_id WHERE p.patient_id IS NULL;
SELECT COUNT(*) FROM opd_visits o LEFT JOIN doctors d ON o.doctor_id = d.doctor_id WHERE d.doctor_id IS NULL;
SELECT COUNT(*) FROM opd_visits o LEFT JOIN diseases dz ON o.disease_id = dz.disease_id WHERE dz.disease_id IS NULL;

-- emergency_visits
SELECT COUNT(*) FROM emergency_visits e LEFT JOIN patients p ON e.patient_id = p.patient_id WHERE p.patient_id IS NULL;

-- surgeries
SELECT COUNT(*) FROM surgeries s LEFT JOIN admissions a ON s.admission_id = a.admission_id WHERE a.admission_id IS NULL;
SELECT COUNT(*) FROM surgeries s LEFT JOIN patients p ON s.patient_id = p.patient_id WHERE p.patient_id IS NULL;
SELECT COUNT(*) FROM surgeries s LEFT JOIN doctors d ON s.doctor_id = d.doctor_id WHERE d.doctor_id IS NULL;
 

-- =======================================================
-- Tier 3 — Logical/business-rule checks. These catch bugs the FK 
-- checks can't (data that's structurally valid but logically wrong):
-- =======================================================

-- discharge should never be before admit
SELECT COUNT(*) FROM admissions WHERE discharge_date < admit_date;

-- surgery scheduled_date should fall within the linked admission's stay
SELECT COUNT(*) 
FROM surgeries s 
JOIN admissions a ON s.admission_id = a.admission_id
WHERE s.scheduled_date < a.admit_date OR s.scheduled_date > a.discharge_date;

-- cancellation_reason should be NULL unless status = 'Cancelled', and non-NULL when it is
SELECT COUNT(*) FROM surgeries WHERE status = 'Cancelled' AND cancellation_reason IS NULL;
SELECT COUNT(*) FROM surgeries WHERE status != 'Cancelled' AND cancellation_reason IS NOT NULL;

-- surgery's patient_id should match the admission's patient_id (since surgery links to both)
SELECT COUNT(*) 
FROM surgeries s 
JOIN admissions a ON s.admission_id = a.admission_id
WHERE s.patient_id != a.patient_id;


SELECT s.surgery_id, s.scheduled_date, a.admit_date, a.discharge_date,
       DATEDIFF(s.scheduled_date, a.admit_date) AS days_before_admit,
       DATEDIFF(s.scheduled_date, a.discharge_date) AS days_after_discharge
FROM surgeries s
JOIN admissions a ON s.admission_id = a.admission_id
WHERE s.scheduled_date < a.admit_date OR s.scheduled_date > a.discharge_date
LIMIT 10;


SELECT DISTINCT cancellation_reason FROM surgeries WHERE status != 'Cancelled' LIMIT 5;


TRUNCATE TABLE surgeries;

SELECT cancellation_reason, 
       LENGTH(cancellation_reason) AS len, 
       cancellation_reason IS NULL AS is_real_null,
       COUNT(*) AS row_count
FROM surgeries
WHERE status != 'Cancelled'
GROUP BY cancellation_reason, LENGTH(cancellation_reason), cancellation_reason IS NULL;

SELECT COUNT(*) 
FROM surgeries s 
JOIN admissions a ON s.admission_id = a.admission_id
WHERE s.scheduled_date < a.admit_date OR s.scheduled_date > a.discharge_date;

UPDATE surgeries SET cancellation_reason = NULL WHERE cancellation_reason = '';
UPDATE patients SET contact = NULL WHERE contact = '';
UPDATE patients SET insurance_status = NULL WHERE insurance_status = '';
UPDATE patients SET gender = NULL WHERE gender = '';
UPDATE donations SET donor_name = NULL WHERE donor_name = '';

SET SQL_SAFE_UPDATES = 0;

SELECT COUNT(*) FROM surgeries WHERE cancellation_reason = '';   -- should be 0
SELECT COUNT(*) FROM patients WHERE contact = '';                 -- should be 0
SELECT COUNT(*) FROM patients WHERE insurance_status = '';        -- should be 0


TRUNCATE TABLE surgeries;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE admissions;
SET FOREIGN_KEY_CHECKS = 1;

SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM admissions;
SET FOREIGN_KEY_CHECKS = 1;
SELECT COUNT(*) FROM admissions;   -- should show 0


-- ============================================================
-- Indus Hospital Project — KPI / Business Question Queries
-- Engine: MySQL
-- Organized by domain. Each block: business question + query.
-- ============================================================

USE indus_hospital;


-- ============================================================
-- SECTION 1: PATIENTS & DEMOGRAPHICS
-- ============================================================

-- 1.1 Total registered patients
SELECT COUNT(*) AS total_patients FROM patients;

-- 1.2 Gender distribution (cleaning dirty data: Male/male/M -> Male, etc.)
SELECT 
    CASE 
        WHEN UPPER(gender) IN ('M','MALE') THEN 'Male'
        WHEN UPPER(gender) IN ('F','FEMALE') THEN 'Female'
        ELSE 'Unknown'
    END AS gender_clean,
    COUNT(*) AS patient_count
FROM patients
GROUP BY gender_clean
ORDER BY patient_count DESC;

-- 1.3 Age group distribution
SELECT 
    CASE 
        WHEN age < 18 THEN '0-17'
        WHEN age BETWEEN 18 AND 35 THEN '18-35'
        WHEN age BETWEEN 36 AND 55 THEN '36-55'
        WHEN age BETWEEN 56 AND 75 THEN '56-75'
        ELSE '76+'
    END AS age_group,
    COUNT(*) AS patient_count
FROM patients
GROUP BY age_group
ORDER BY age_group;

-- 1.4 Insurance status breakdown (% insured vs uninsured vs unknown)
SELECT 
    COALESCE(insurance_status, 'Unknown') AS insurance_status,
    COUNT(*) AS patient_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM patients), 2) AS pct_of_total
FROM patients
GROUP BY insurance_status;

-- 1.5 Patient registration trend by month
SELECT 
    DATE_FORMAT(registration_date, '%Y-%m') AS month,
    COUNT(*) AS new_registrations
FROM patients
GROUP BY month
ORDER BY month;

-- 1.6 % of patients missing contact info (data quality KPI)
SELECT 
    ROUND(SUM(CASE WHEN contact IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS pct_missing_contact
FROM patients;


-- ============================================================
-- SECTION 2: ADMISSIONS / PATIENT FLOW (INPATIENT)
-- ============================================================

-- 2.1 Average length of stay (overall)
SELECT ROUND(AVG(length_of_stay), 2) AS avg_length_of_stay
FROM admissions;

-- 2.2 Average length of stay by department (via doctor)
SELECT 
    d.department,
    ROUND(AVG(a.length_of_stay), 2) AS avg_los,
    COUNT(*) AS admission_count
FROM admissions a
JOIN doctors d ON a.doctor_id = d.doctor_id
GROUP BY d.department
ORDER BY avg_los DESC;

-- 2.3 30-day readmission rate (window function: LAG to find prior discharge per patient)
WITH patient_admissions AS (
    SELECT 
        patient_id,
        admission_id,
        admit_date,
        discharge_date,
        LAG(discharge_date) OVER (PARTITION BY patient_id ORDER BY admit_date) AS prev_discharge_date
    FROM admissions
),
readmissions AS (
    SELECT *,
        DATEDIFF(admit_date, prev_discharge_date) AS days_since_last_discharge
    FROM patient_admissions
    WHERE prev_discharge_date IS NOT NULL
)
SELECT 
    COUNT(*) AS total_readmission_candidates,
    SUM(CASE WHEN days_since_last_discharge <= 30 THEN 1 ELSE 0 END) AS readmissions_within_30d,
    ROUND(SUM(CASE WHEN days_since_last_discharge <= 30 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS readmission_rate_pct
FROM readmissions;

-- 2.4 Monthly admission volume trend
SELECT 
    DATE_FORMAT(admit_date, '%Y-%m') AS month,
    COUNT(*) AS admissions_count
FROM admissions
GROUP BY month
ORDER BY month;

-- 2.5 Department-wise admission volume
SELECT 
    d.department,
    COUNT(*) AS admission_count
FROM admissions a
JOIN doctors d ON a.doctor_id = d.doctor_id
GROUP BY d.department
ORDER BY admission_count DESC;

-- 2.6 Longest-staying patients (top 10) — useful for a dashboard "watch list" table
SELECT 
    a.admission_id, a.patient_id, p.name, a.length_of_stay, d.department
FROM admissions a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
ORDER BY a.length_of_stay DESC
LIMIT 10;


-- ============================================================
-- SECTION 3: BED & WARD OCCUPANCY
-- ============================================================

-- 3.1 Total beds per ward
SELECT 
    w.ward_name,
    COUNT(b.bed_id) AS total_beds
FROM wards w
JOIN beds b ON w.ward_id = b.ward_id
GROUP BY w.ward_name
ORDER BY total_beds DESC;

-- 3.2 Bed utilization — how many times each bed has been used across all admissions
SELECT 
    w.ward_name,
    COUNT(a.admission_id) AS times_used,
    ROUND(COUNT(a.admission_id) / COUNT(DISTINCT b.bed_id), 2) AS avg_uses_per_bed
FROM beds b
JOIN wards w ON b.ward_id = w.ward_id
LEFT JOIN admissions a ON b.bed_id = a.bed_id
GROUP BY w.ward_name
ORDER BY times_used DESC;

-- 3.3 Currently occupied beds (patients admitted but not yet discharged, relative to today)
SELECT COUNT(DISTINCT bed_id) AS currently_occupied_beds
FROM admissions
WHERE admit_date <= CURDATE() AND discharge_date >= CURDATE();

-- 3.4 Bed occupancy rate (currently occupied / total beds)
SELECT 
    ROUND(
        (SELECT COUNT(DISTINCT bed_id) FROM admissions WHERE admit_date <= CURDATE() AND discharge_date >= CURDATE())
        * 100.0 / (SELECT COUNT(*) FROM beds), 2
    ) AS bed_occupancy_rate_pct;


-- ============================================================
-- SECTION 4: DOCTORS / STAFF
-- ============================================================

-- 4.1 Doctor workload — total patients handled (admissions + OPD + surgeries combined)
SELECT 
    doc.doctor_id, doc.name, doc.department,
    (SELECT COUNT(*) FROM admissions WHERE doctor_id = doc.doctor_id) AS admissions_handled,
    (SELECT COUNT(*) FROM opd_visits WHERE doctor_id = doc.doctor_id) AS opd_visits_handled,
    (SELECT COUNT(*) FROM surgeries WHERE doctor_id = doc.doctor_id) AS surgeries_performed
FROM doctors doc
ORDER BY admissions_handled DESC
LIMIT 10;

-- 4.2 Department-wise doctor count and average experience
SELECT 
    department,
    COUNT(*) AS doctor_count,
    ROUND(AVG(experience_years), 1) AS avg_experience_years,
    SUM(CASE WHEN is_surgeon = 1 THEN 1 ELSE 0 END) AS surgeon_count
FROM doctors
GROUP BY department
ORDER BY doctor_count DESC;

-- 4.3 Surgeon ratio per department (% of doctors who are surgeons)
SELECT 
    department,
    ROUND(SUM(CASE WHEN is_surgeon = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS pct_surgeons
FROM doctors
GROUP BY department
ORDER BY pct_surgeons DESC;


-- ============================================================
-- SECTION 5: OPD VISITS
-- ============================================================

-- 5.1 OPD visit volume by department
SELECT department, COUNT(*) AS visit_count
FROM opd_visits
GROUP BY department
ORDER BY visit_count DESC;

-- 5.2 Follow-up required rate
SELECT 
    ROUND(SUM(follow_up_required) * 100.0 / COUNT(*), 2) AS pct_follow_up_required
FROM opd_visits;

-- 5.3 Top 5 most common diseases diagnosed in OPD
SELECT 
    dz.disease_name,
    COUNT(*) AS diagnosis_count
FROM opd_visits o
JOIN diseases dz ON o.disease_id = dz.disease_id
GROUP BY dz.disease_name
ORDER BY diagnosis_count DESC
LIMIT 5;

-- 5.4 Monthly OPD visit trend
SELECT 
    DATE_FORMAT(visit_date, '%Y-%m') AS month,
    COUNT(*) AS opd_visits
FROM opd_visits
GROUP BY month
ORDER BY month;


-- ============================================================
-- SECTION 6: EMERGENCY (ER) VISITS
-- ============================================================

-- 6.1 ER visit volume trend (monthly)
SELECT 
    DATE_FORMAT(arrival_date, '%Y-%m') AS month,
    COUNT(*) AS er_visits
FROM emergency_visits
GROUP BY month
ORDER BY month;

-- 6.2 Triage level distribution
SELECT 
    triage_level,
    COUNT(*) AS visit_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM emergency_visits), 2) AS pct_of_total
FROM emergency_visits
GROUP BY triage_level
ORDER BY visit_count DESC;

-- 6.3 Outcome rate BY triage level (e.g. % of Critical patients admitted vs discharged vs referred)
SELECT 
    triage_level,
    outcome,
    COUNT(*) AS count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY triage_level), 2) AS pct_within_triage
FROM emergency_visits
GROUP BY triage_level, outcome
ORDER BY triage_level, count DESC;

-- 6.4 ER department load (which departments get the most ER cases)
SELECT department, COUNT(*) AS er_case_count
FROM emergency_visits
GROUP BY department
ORDER BY er_case_count DESC;


-- ============================================================
-- SECTION 7: SURGERIES
-- ============================================================

-- 7.1 Surgery status breakdown (Completed / Cancelled / Postponed %)
SELECT 
    status,
    COUNT(*) AS count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM surgeries), 2) AS pct_of_total
FROM surgeries
GROUP BY status
ORDER BY count DESC;

-- 7.2 Cancellation reason breakdown (only among cancelled surgeries)
SELECT 
    cancellation_reason,
    COUNT(*) AS count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM surgeries WHERE status = 'Cancelled'), 2) AS pct_of_cancellations
FROM surgeries
WHERE status = 'Cancelled'
GROUP BY cancellation_reason
ORDER BY count DESC;

-- 7.3 Surgeries by department
SELECT department, COUNT(*) AS surgery_count
FROM surgeries
GROUP BY department
ORDER BY surgery_count DESC;

-- 7.4 Average days from admission to surgery
SELECT 
    ROUND(AVG(DATEDIFF(s.scheduled_date, a.admit_date)), 2) AS avg_days_to_surgery
FROM surgeries s
JOIN admissions a ON s.admission_id = a.admission_id;

-- 7.5 Cancellation rate by department (which departments cancel most)
SELECT 
    department,
    COUNT(*) AS total_surgeries,
    SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled,
    ROUND(SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS cancellation_rate_pct
FROM surgeries
GROUP BY department
ORDER BY cancellation_rate_pct DESC;


-- ============================================================
-- SECTION 8: DONATIONS
-- ============================================================

-- 8.1 Total and average donation amount by campaign
SELECT 
    campaign,
    COUNT(*) AS donation_count,
    ROUND(SUM(amount), 2) AS total_amount,
    ROUND(AVG(amount), 2) AS avg_amount
FROM donations
GROUP BY campaign
ORDER BY total_amount DESC;

-- 8.2 Recurring vs one-time donor %
SELECT 
    CASE WHEN recurring = 1 THEN 'Recurring' ELSE 'One-time' END AS donor_type,
    COUNT(*) AS count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM donations), 2) AS pct_of_total
FROM donations
GROUP BY donor_type;

-- 8.3 Anonymous donation %
SELECT 
    ROUND(SUM(CASE WHEN donor_name IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS pct_anonymous
FROM donations;

-- 8.4 Monthly donation trend (amount + count)
SELECT 
    DATE_FORMAT(donation_date, '%Y-%m') AS month,
    COUNT(*) AS donation_count,
    ROUND(SUM(amount), 2) AS total_amount
FROM donations
GROUP BY month
ORDER BY month;

-- 8.5 Running total of donations over time (window function — good "advanced SQL" showcase)
SELECT 
    donation_date,
    amount,
    SUM(amount) OVER (ORDER BY donation_date) AS running_total
FROM donations
ORDER BY donation_date;

-- 8.6 Top 10 largest single donations
SELECT donation_id, COALESCE(donor_name, 'Anonymous') AS donor, amount, campaign, donation_date
FROM donations
ORDER BY amount DESC
LIMIT 10;


-- ============================================================
-- SECTION 9: DISEASES / COMORBIDITY
-- ============================================================

-- 9.1 Most common diseases overall (across patient_disease bridge)
SELECT 
    dz.disease_name,
    COUNT(*) AS patient_count
FROM patient_disease pd
JOIN diseases dz ON pd.disease_id = dz.disease_id
GROUP BY dz.disease_name
ORDER BY patient_count DESC
LIMIT 10;

-- 9.2 Average number of diseases per patient (comorbidity load)
SELECT 
    ROUND(COUNT(*) * 1.0 / COUNT(DISTINCT patient_id), 2) AS avg_diseases_per_patient
FROM patient_disease;

-- 9.3 Patients with multiple comorbidities (2+ diagnosed diseases)
SELECT 
    COUNT(*) AS patients_with_multiple_conditions
FROM (
    SELECT patient_id
    FROM patient_disease
    GROUP BY patient_id
    HAVING COUNT(*) >= 2
) AS multi_condition_patients;

-- 9.4 Rank patients by number of comorbidities (window function, top 10)
SELECT 
    patient_id,
    COUNT(*) AS disease_count,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS comorbidity_rank
FROM patient_disease
GROUP BY patient_id
ORDER BY disease_count DESC
LIMIT 10;

-- ===================================================
-- Verification after importing data to Tableau Public
-- ===================================================
SELECT follow_up_required, COUNT(*) FROM opd_visits GROUP BY follow_up_required;

SELECT o.opd_id, o.patient_id, o.doctor_id, o.department, 
       o.disease_id, d.disease_name, o.visit_date, o.follow_up_required
FROM opd_visits o
JOIN diseases d ON o.disease_id = d.disease_id;




