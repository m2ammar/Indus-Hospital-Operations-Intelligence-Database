import pandas as pd
import numpy as np
from faker import Faker
import random
from datetime import timedelta

fake = Faker()
Faker.seed(42)
random.seed(42)
np.random.seed(42)

print("Generating data... Please wait.")

# ---------------------------------------------------------
# 1. Patients (12,000 rows)
# ---------------------------------------------------------
num_patients = 12000
genders_dirty = ['Male', 'Female', 'male', 'M', 'F']  # intentional inconsistency

patients = {
    "patient_id": [f"PAT_{i:05d}" for i in range(1, num_patients + 1)],
    "name": [fake.name() for _ in range(num_patients)],
    "age": np.random.randint(1, 90, num_patients),
    "gender": [random.choice(genders_dirty) for _ in range(num_patients)],
    "city": [fake.city() for _ in range(num_patients)],
    "contact": [fake.phone_number() for _ in range(num_patients)],
    "registration_date": [fake.date_between(start_date="-3y", end_date="today") for _ in range(num_patients)],
    "insurance_status": [random.choice(['Insured', 'Uninsured', 'Uninsured', 'Uninsured', None]) for _ in range(num_patients)],
}
df_patients = pd.DataFrame(patients)
# inject missing contact numbers deliberately (dirty data)
df_patients.loc[df_patients.sample(frac=0.03, random_state=42).index, 'contact'] = None

# ---------------------------------------------------------
# 2. Diseases (40 rows) — reference table
# ---------------------------------------------------------
disease_list = [
    'Cancer', 'Diabetes', 'Hypertension', 'Heart Disease', 'Kidney Failure',
    'Stroke', 'Asthma', 'Tuberculosis', 'Liver Disease', 'Anemia',
    'Hepatitis B', 'Hepatitis C', 'Chronic Kidney Disease', 'Pneumonia',
    'Bronchitis', 'Arthritis', 'Thyroid Disorder', 'Malaria', 'Typhoid',
    'Dengue', 'COVID-19', 'Epilepsy', 'Depression', 'Anxiety Disorder',
    'Obesity', 'Osteoporosis', 'Gastritis', 'Ulcer', 'Migraine', 'Cataract',
    'Glaucoma', 'Skin Infection', 'Burns', 'Fracture', 'Appendicitis',
    'Gallstones', 'Prostate Disorder', 'Leukemia', 'Lymphoma', 'COPD'
]
df_diseases = pd.DataFrame({
    "disease_id": [f"DIS_{i:03d}" for i in range(1, len(disease_list) + 1)],
    "disease_name": disease_list,
})

# ---------------------------------------------------------
# 3. Patient-Disease bridge (~18,000) — many-to-many
# ---------------------------------------------------------
num_patient_disease = int(num_patients * 1.5)   
patient_ids_base = list(df_patients["patient_id"])  # every patient gets >=1 disease
extra_needed = num_patient_disease - num_patients
patient_ids_extra = [random.choice(patient_ids_base) for _ in range(extra_needed)]
final_patient_ids = patient_ids_base + patient_ids_extra
random.shuffle(final_patient_ids)

df_patient_disease = pd.DataFrame({
    "record_id": [f"PD_{i:05d}" for i in range(1, num_patient_disease + 1)],
    "patient_id": final_patient_ids,
    "disease_id": [random.choice(df_diseases["disease_id"]) for _ in range(num_patient_disease)],
})

# ---------------------------------------------------------
# 4. Doctors (180 rows)
# ---------------------------------------------------------
num_doctors = 180
departments = ['Cardiology', 'Oncology', 'Nephrology', 'Endocrinology',
               'General Surgery', 'Pulmonology', 'Neurology', 'Orthopedics',
               'Pediatrics', 'Emergency Medicine']

doctors = {
    "doctor_id": [f"DOC_{i:03d}" for i in range(1, num_doctors + 1)],
    "name": [fake.name() for _ in range(num_doctors)],
    "department": [random.choice(departments) for _ in range(num_doctors)],
    "is_surgeon": [random.choice([1, 0]) for _ in range(num_doctors)],   # changed True/False -> 1/0
    "experience_years": np.random.randint(1, 35, num_doctors),
}
df_doctors = pd.DataFrame(doctors)

# ---------------------------------------------------------
# 5. Wards & Beds (20 wards, 500 beds)
# ---------------------------------------------------------
num_wards = 20
df_wards = pd.DataFrame({
    "ward_id": [f"WARD_{i:02d}" for i in range(1, num_wards + 1)],
    "ward_name": [f"{random.choice(departments)} Ward {i}" for i in range(1, num_wards + 1)],
})

num_beds = 500
df_beds = pd.DataFrame({
    "bed_id": [f"BED_{i:04d}" for i in range(1, num_beds + 1)],
    "ward_id": [random.choice(df_wards["ward_id"]) for _ in range(num_beds)],
})

# ---------------------------------------------------------
# 6. Admissions (18,000 rows) — depends on patients, doctors, beds
# ---------------------------------------------------------
num_admissions = 18000
admissions = []
for i in range(1, num_admissions + 1):
    admit_date = fake.date_between(start_date="-2y", end_date="today")
    length_of_stay = int(np.random.exponential(scale=4)) + 1  # most stays short, few long (realistic)
    discharge_date = admit_date + timedelta(days=length_of_stay)

    admissions.append({
        "admission_id": f"ADM_{i:05d}",
        "patient_id": random.choice(df_patients["patient_id"]),
        "doctor_id": random.choice(df_doctors["doctor_id"]),
        "bed_id": random.choice(df_beds["bed_id"]),
        "admit_date": admit_date,
        "discharge_date": discharge_date,
        "length_of_stay": length_of_stay,
    })
df_admissions = pd.DataFrame(admissions)

# ---------------------------------------------------------
# 7. Donations (4,000 rows)
# ---------------------------------------------------------
num_donations = 4000
campaigns = ['Dialysis Fund', 'Cancer Ward', 'Cardiac Care', 'General Fund',
             'Pediatric Wing', 'Emergency Relief', 'Equipment Fund']

donations = {
    "donation_id": [f"DON_{i:05d}" for i in range(1, num_donations + 1)],
    "donor_name": [fake.name() if random.random() > 0.15 else None for _ in range(num_donations)],  # 15% anonymous
    "amount": np.round(np.random.exponential(scale=15000, size=num_donations), 2),  # few large donors, many small
    "campaign": [random.choice(campaigns) for _ in range(num_donations)],
    "donation_date": [fake.date_between(start_date="-2y", end_date="today") for _ in range(num_donations)],
    "recurring": [random.choice([1, 0, 0, 0]) for _ in range(num_donations)],
}
df_donations = pd.DataFrame(donations)

# ---------------------------------------------------------
# Save all to CSV
# ---------------------------------------------------------
df_patients.to_csv("data/raw/patients.csv", index=False)
df_diseases.to_csv("data/raw/diseases.csv", index=False)
df_patient_disease.to_csv("data/raw/patient_disease.csv", index=False)
df_doctors.to_csv("data/raw/doctors.csv", index=False)
df_wards.to_csv("data/raw/wards.csv", index=False)
df_beds.to_csv("data/raw/beds.csv", index=False)
df_admissions.to_csv("data/raw/admissions.csv", index=False)
df_donations.to_csv("data/raw/donations.csv", index=False)

print("Success! Generated files:")
for name, df in [("patients", df_patients), ("diseases", df_diseases),
                  ("patient_disease", df_patient_disease), ("doctors", df_doctors),
                  ("wards", df_wards), ("beds", df_beds),
                  ("admissions", df_admissions), ("donations", df_donations)]:
    print(f"- {name}.csv ({df.shape[0]} rows)")