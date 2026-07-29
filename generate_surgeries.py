# generate_surgeries.py

import pandas as pd
import random
from faker import Faker
from datetime import timedelta

fake = Faker()
Faker.seed(42)
random.seed(42)

print("Generating Surgeries data...")

df_admissions = pd.read_csv("data/raw/admissions.csv", parse_dates=["admit_date", "discharge_date"])
df_doctors = pd.read_csv("data/raw/doctors.csv")
df_surgeons = df_doctors[df_doctors["is_surgeon"] == True]

# NEW: procedures mapped to the department that would realistically perform them
department_procedures = {
    'Cardiology': ['Coronary Bypass', 'Angioplasty', 'Pacemaker Insertion'],
    'Oncology': ['Mastectomy', 'Tumor Resection', 'Lymph Node Biopsy'],
    'Nephrology': ['Kidney Transplant', 'Dialysis Access Surgery'],
    'Endocrinology': ['Thyroidectomy', 'Adrenalectomy'],
    'General Surgery': ['Appendectomy', 'Gallbladder Removal', 'Hernia Repair'],
    'Pulmonology': ['Lung Biopsy', 'Lobectomy'],
    'Neurology': ['Craniotomy', 'Spinal Fusion'],
    'Orthopedics': ['Hip Replacement', 'Knee Replacement', 'Fracture Fixation'],
    'Pediatrics': ['Tonsillectomy', 'Hernia Repair', 'Appendectomy'],
    'Emergency Medicine': ['Emergency Laparotomy', 'Trauma Surgery'],
}

cancellation_reasons = [
    'Patient No-show', 'Equipment Unavailable', 'Doctor Unavailable',
    'Patient Condition Changed', 'Anesthesia Complication'
]

num_surgeries = 4000
sampled_admissions = df_admissions.sample(n=num_surgeries, replace=True, random_state=42).reset_index(drop=True)

surgeries = []
for i in range(1, num_surgeries + 1):
    adm = sampled_admissions.iloc[i - 1]
    admit_date = adm["admit_date"]
    discharge_date = adm["discharge_date"]

    stay_days = (discharge_date - admit_date).days
    if stay_days < 1:
        stay_days = 1
    offset = random.randint(0, stay_days)
    scheduled_date = admit_date + timedelta(days=offset)

    surgeon_row = df_surgeons.sample(1).iloc[0]
    surgeon_dept = surgeon_row["department"]

    # NEW: pick procedure only from the surgeon's own department's list
    procedure_name = random.choice(department_procedures[surgeon_dept])

    status = random.choices(
        ['Completed', 'Cancelled', 'Postponed'],
        weights=[80, 12, 8]
    )[0]
    cancellation_reason = random.choice(cancellation_reasons) if status == 'Cancelled' else None

    surgeries.append({
        "surgery_id": f"SUR_{i:05d}",
        "admission_id": adm["admission_id"],
        "patient_id": adm["patient_id"],
        "doctor_id": surgeon_row["doctor_id"],
        "procedure_name": procedure_name,
        "department": surgeon_dept,
        "scheduled_date": scheduled_date,
        "status": status,
        "cancellation_reason": cancellation_reason,
    })

df_surgeries = pd.DataFrame(surgeries)
df_surgeries.to_csv("data/raw/surgeries.csv", index=False)

print(f"Success! surgeries.csv generated with {df_surgeries.shape[0]} rows.")
print(df_surgeries.head())