# generate_opd.py

import pandas as pd
import random
from faker import Faker

fake = Faker()
Faker.seed(42)
random.seed(42)

print("Generating OPD data...")

# Step 1: Load the tables we already generated.
# We need these because OPD visits must reference REAL patients and doctors
# — not made-up IDs. This is the "sample from parent table" rule.
df_patients = pd.read_csv("data/raw/patients.csv")
df_doctors = pd.read_csv("data/raw/doctors.csv")
df_diseases = pd.read_csv("data/raw/diseases.csv")

# Step 2: Decide how many OPD visits to generate.
num_opd = 15000

# Step 3: Build the rows.
# We use a for-loop instead of dict-of-lists this time so we can pick ONE
# doctor per row and reuse THAT SAME doctor's department — this is the
# "inherit from parent" rule (avoids a doctor being in Cardiology but
# somehow having an OPD visit tagged as Neurology).
opd_visits = []

for i in range(1, num_opd + 1):
    # pick one random patient row (not just an ID — the whole row)
    patient_id = random.choice(df_patients["patient_id"].tolist())

    # pick one random doctor ROW (not just an ID) so we can read their department
    doctor_row = df_doctors.sample(1).iloc[0]
    doctor_id = doctor_row["doctor_id"]
    department = doctor_row["department"]   # inherited, not re-randomized

    disease_id = random.choice(df_diseases["disease_id"].tolist())
    visit_date = fake.date_between(start_date="-2y", end_date="today")

    # follow-up: weighted so ~30% need follow-up, not a 50/50 coin flip
    follow_up_required = random.choices([1, 0], weights=[30, 70])[0]

    opd_visits.append({
        "opd_id": f"OPD_{i:05d}",
        "patient_id": patient_id,
        "doctor_id": doctor_id,
        "department": department,
        "disease_id": disease_id,
        "visit_date": visit_date,
        "follow_up_required": follow_up_required,
    })

# Step 4: Turn the list of rows into a DataFrame (table).
df_opd = pd.DataFrame(opd_visits)

# Step 5: Save it.
df_opd.to_csv("data/raw/opd_visits.csv", index=False)

print(f"Success! opd_visits.csv generated with {df_opd.shape[0]} rows.")
print(df_opd.head())