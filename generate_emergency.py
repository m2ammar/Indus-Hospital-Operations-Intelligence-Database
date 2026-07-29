# generate_emergency.py

import pandas as pd
import random
from faker import Faker

fake = Faker()
Faker.seed(42)
random.seed(42)

print("Generating Emergency data...")

# Step 1: Load parent tables — Emergency only needs patients
# (no doctor assigned at ER arrival in most real systems, so we skip doctors here)
df_patients = pd.read_csv("data/raw/patients.csv")

num_emergency = 6000

emergency_visits = []

for i in range(1, num_emergency + 1):
    patient_id = random.choice(df_patients["patient_id"].tolist())

    arrival_date = fake.date_between(start_date="-2y", end_date="today")
    arrival_time = fake.time()  # just a time string, e.g. '14:32:10'

    # Triage: most ER visits are non-urgent in real hospitals, critical is rare
    triage_level = random.choices(
        ['Critical', 'Urgent', 'Non-urgent'],
        weights=[10, 35, 55]
    )[0]

    # Outcome logically depends a bit on triage — critical patients are
    # more likely to be admitted, non-urgent more likely discharged same-day
    if triage_level == 'Critical':
        outcome = random.choices(
            ['Admitted', 'Treated & Discharged', 'Referred'],
            weights=[70, 20, 10]
        )[0]
    elif triage_level == 'Urgent':
        outcome = random.choices(
            ['Admitted', 'Treated & Discharged', 'Referred'],
            weights=[35, 55, 10]
        )[0]
    else:  # Non-urgent
        outcome = random.choices(
            ['Admitted', 'Treated & Discharged', 'Referred'],
            weights=[5, 90, 5]
        )[0]

    department = random.choice([
        'Cardiology', 'Oncology', 'Nephrology', 'Endocrinology',
        'General Surgery', 'Pulmonology', 'Neurology', 'Orthopedics',
        'Pediatrics', 'Emergency Medicine'
    ])

    emergency_visits.append({
        "emergency_id": f"ER_{i:05d}",
        "patient_id": patient_id,
        "arrival_date": arrival_date,
        "arrival_time": arrival_time,
        "triage_level": triage_level,
        "outcome": outcome,
        "department": department,
    })

df_emergency = pd.DataFrame(emergency_visits)
df_emergency.to_csv("data/raw/emergency_visits.csv", index=False)

print(f"Success! emergency_visits.csv generated with {df_emergency.shape[0]} rows.")
print(df_emergency.head())