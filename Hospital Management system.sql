-- Create Hospital table
CREATE TABLE hospital (
    hospital_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    contact_number VARCHAR(15)
);

-- Create Department table
CREATE TABLE department (
    department_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    head_of_department VARCHAR(100)
);

-- Create Patient table
CREATE TABLE Patient (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    dob DATE,
    gender VARCHAR(10),
    contact_number VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(255),
    emergency_contact VARCHAR(100)
);

-- Create Doctor table
CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    contact_number VARCHAR(15),
    email VARCHAR(100),
    office_address VARCHAR(255),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Create Appointment table
CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    status VARCHAR(50),
    notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

-- Create Medical_Record table
CREATE TABLE Medical_Record (
    record_id INT PRIMARY KEY,
    patient_id INT,
    diagnosis TEXT,
    treatment TEXT,
    date DATE,
    doctor_id INT,
    notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

-- Create Prescription table
CREATE TABLE Prescription (
    prescription_id INT PRIMARY KEY,
    appointment_id INT,
    medication_id INT,
    dosage VARCHAR(100),
    duration VARCHAR(100),
    instructions TEXT,
    FOREIGN KEY (appointment_id) REFERENCES Appointment(appointment_id),
    FOREIGN KEY (medication_id) REFERENCES Medication(medication_id)
);

-- Create Medication table
CREATE TABLE Medication (
    medication_id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    side_effects TEXT,
    manufacturer VARCHAR(100),
    price DECIMAL(10, 2)
);

-- Create Ward table
CREATE TABLE Ward (
    ward_id INT PRIMARY KEY,
    ward_name VARCHAR(100),
    capacity INT,
    location VARCHAR(100),
    type VARCHAR(50),
    department_id INT,
    hospital_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id),
    FOREIGN KEY (hospital_id) REFERENCES Hospital(hospital_id)
);

-- Create Bed table
CREATE TABLE Bed (
    bed_id INT PRIMARY KEY,
    ward_id INT,
    bed_number INT,
    status VARCHAR(50),
    patient_id INT,
    FOREIGN KEY (ward_id) REFERENCES Ward(ward_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

-- Create Nurse table
CREATE TABLE Nurse (
    nurse_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    ward_id INT,
    contact_number VARCHAR(15),
    email VARCHAR(100),
    shift_id INT,
    FOREIGN KEY (ward_id) REFERENCES Ward(ward_id)
);

-- Create Bill table
CREATE TABLE Bill (
    bill_id INT PRIMARY KEY,
    patient_id INT,
    amount DECIMAL(10, 2),
    date DATE,
    status VARCHAR(50),
    payment_method VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

-- Create Payment table
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    bill_id INT,
    payment_method VARCHAR(50),
    payment_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (bill_id) REFERENCES Bill(bill_id)
);

-- Create Lab_Test table
CREATE TABLE Lab_Test (
    test_id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    cost DECIMAL(10, 2),
    normal_range VARCHAR(100)
);

-- Create Lab_Result table
CREATE TABLE Lab_Result (
    result_id INT PRIMARY KEY,
    test_id INT,
    appointment_id INT,
    result TEXT,
    date DATE,
    notes TEXT,
    FOREIGN KEY (test_id) REFERENCES Lab_Test(test_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointment(appointment_id)
);

-- Create Staff table
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    role VARCHAR(100),
    department_id INT,
    contact_number VARCHAR(15),
    email VARCHAR(100),
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Create Shift table
CREATE TABLE Shift (
    shift_id INT PRIMARY KEY,
    staff_id INT,
    start_time TIME,
    end_time TIME,
    date DATE,
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);

-- Create Room table
CREATE TABLE Room (
    room_id INT PRIMARY KEY,
    ward_id INT,
    room_number INT,
    type VARCHAR(50),
    availability_status VARCHAR(50),
    FOREIGN KEY (ward_id) REFERENCES Ward(ward_id)
);

-- Create Surgery table
CREATE TABLE Surgery (
    surgery_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    date DATE,
    description TEXT,
    outcome TEXT,
    notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

-- Create Inventory table
CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY,
    name VARCHAR(100),
    quantity INT,
    description TEXT,
    supplier_id INT,
    date_received DATE,
    expiration_date DATE,
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);

-- Create Supplier table
CREATE TABLE Supplier (
    supplier_id INT PRIMARY KEY,
    name VARCHAR(100),
    contact_person VARCHAR(100),
    contact_number VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(255)
);

-- Create Insurance table
CREATE TABLE Insurance (
    insurance_id INT PRIMARY KEY,
    provider_name VARCHAR(100),
    policy_number VARCHAR(100),
    patient_id INT,
    coverage_details TEXT,
    expiry_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

-- Create Visit table
CREATE TABLE Visit (
    visit_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    visit_date DATE,
    purpose TEXT,
    notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);
------------------------------------------------------------------------------------------------------------------------------------------
-- Insert Dummy Data into Hospital table
INSERT INTO Hospital (hospital_id, name, address, contact_number) VALUES
(1, 'City Hospital', '123 Main St, City', '123-456-7890'),
(2, 'County Hospital', '456 Elm St, County', '098-765-4321'),
(3, 'Central Hospital', '789 Maple St, Central', '111-222-3333'),
(4, 'Westside Hospital', '321 Oak St, Westside', '444-555-6666'),
(5, 'Eastside Hospital', '654 Pine St, Eastside', '777-888-9999'),
(6, 'North Hospital', '987 Cedar St, North', '333-444-5555'),
(7, 'South Hospital', '123 Birch St, South', '666-777-8888'),
(8, 'Green Hospital', '456 Spruce St, Green', '999-000-1111'),
(9, 'Blue Hospital', '789 Willow St, Blue', '222-333-4444'),
(10, 'Red Hospital', '321 Fir St, Red', '555-666-7777'),
(11, 'Yellow Hospital', '654 Ash St, Yellow', '888-999-0000'),
(12, 'Purple Hospital', '987 Sycamore St, Purple', '111-222-3333'),
(13, 'Orange Hospital', '123 Poplar St, Orange', '444-555-6666'),
(14, 'Black Hospital', '456 Walnut St, Black', '777-888-9999'),
(15, 'White Hospital', '789 Chestnut St, White', '000-111-2222');

-- Insert Dummy Data into Department table
INSERT INTO Department (department_id, name, description, head_of_department) VALUES
(1, 'Cardiology', 'Heart and blood vessels treatment', 'Dr. John Doe'),
(2, 'Neurology', 'Nervous system treatment', 'Dr. Jane Smith'),
(3, 'Orthopedics', 'Bone and muscle treatment', 'Dr. Alice Brown'),
(4, 'Pediatrics', 'Child health treatment', 'Dr. Robert Johnson'),
(5, 'Dermatology', 'Skin treatment', 'Dr. Emily Davis'),
(6, 'Gynecology', 'Women health treatment', 'Dr. Mary Miller'),
(7, 'Urology', 'Urinary system treatment', 'Dr. Michael Wilson'),
(8, 'Ophthalmology', 'Eye treatment', 'Dr. William Moore'),
(9, 'Oncology', 'Cancer treatment', 'Dr. Sarah Taylor'),
(10, 'Psychiatry', 'Mental health treatment', 'Dr. David Anderson'),
(11, 'Gastroenterology', 'Digestive system treatment', 'Dr. Daniel Thomas'),
(12, 'Endocrinology', 'Hormone treatment', 'Dr. Christopher Jackson'),
(13, 'Pulmonology', 'Lung treatment', 'Dr. Patricia White'),
(14, 'Rheumatology', 'Joint and muscle treatment', 'Dr. Jennifer Harris'),
(15, 'Allergy and Immunology', 'Allergy treatment', 'Dr. Linda Martin');

-- Insert Dummy Data into Patient table
INSERT INTO Patient (patient_id, first_name, last_name, dob, gender, contact_number, email, address, emergency_contact) VALUES
(1, 'Alice', 'Johnson', '1980-01-01', 'Female', '555-1234', 'alice@example.com', '789 Pine St', 'Bob Johnson'),
(2, 'Bob', 'Smith', '1975-05-20', 'Male', '555-5678', 'bob@example.com', '101 Maple St', 'Alice Smith'),
(3, 'Charlie', 'Brown', '1990-03-15', 'Male', '555-8765', 'charlie@example.com', '202 Oak St', 'Lucy Brown'),
(4, 'David', 'White', '1985-07-22', 'Male', '555-4321', 'david@example.com', '303 Birch St', 'Linda White'),
(5, 'Emma', 'Davis', '1995-11-30', 'Female', '555-6789', 'emma@example.com', '404 Cedar St', 'John Davis'),
(6, 'Frank', 'Green', '1970-02-10', 'Male', '555-2345', 'frank@example.com', '505 Spruce St', 'Mary Green'),
(7, 'Grace', 'Wilson', '1982-08-25', 'Female', '555-3456', 'grace@example.com', '606 Willow St', 'Paul Wilson'),
(8, 'Henry', 'Moore', '1998-05-05', 'Male', '555-7890', 'henry@example.com', '707 Fir St', 'Emma Moore'),
(9, 'Ivy', 'Taylor', '1987-09-15', 'Female', '555-8901', 'ivy@example.com', '808 Ash St', 'Oliver Taylor'),
(10, 'Jack', 'Miller', '1978-12-20', 'Male', '555-9012', 'jack@example.com', '909 Sycamore St', 'Sophia Miller'),
(11, 'Karen', 'Thomas', '1969-04-30', 'Female', '555-0123', 'karen@example.com', '101 Poplar St', 'James Thomas'),
(12, 'Leo', 'Martin', '1983-06-17', 'Male', '555-1230', 'leo@example.com', '202 Walnut St', 'Ella Martin'),
(13, 'Mia', 'Jackson', '1992-10-12', 'Female', '555-2340', 'mia@example.com', '303 Chestnut St', 'Lucas Jackson'),
(14, 'Noah', 'Harris', '1988-03-25', 'Male', '555-3450', 'noah@example.com', '404 Maple St', 'Ava Harris'),
(15, 'Olivia', 'Anderson', '1976-11-05', 'Female', '555-4560', 'olivia@example.com', '505 Pine St', 'William Anderson');

-- Insert Dummy Data into Doctor table
INSERT INTO Doctor (doctor_id, first_name, last_name, specialization, contact_number, email, office_address, department_id) VALUES
(1, 'John', 'Doe', 'Cardiologist', '555-8765', 'johndoe@example.com', 'Office 101', 1),
(2, 'Jane', 'Smith', 'Neurologist', '555-4321', 'janesmith@example.com', 'Office 102', 2),
(3, 'Alice', 'Brown', 'Orthopedist', '555-5432', 'alicebrown@example.com', 'Office 103', 3),
(4, 'Robert', 'Johnson', 'Pediatrician', '555-6543', 'robertjohnson@example.com', 'Office 104', 4),
(5, 'Emily', 'Davis', 'Dermatologist', '555-7654', 'emilydavis@example.com', 'Office 105', 5),
(6, 'Mary', 'Miller', 'Gynecologist', '555-8765', 'marymiller@example.com', 'Office 106', 6),
(7, 'Michael', 'Wilson', 'Urologist', '555-9876', 'michaelwilson@example.com', 'Office 107', 7),
(8, 'William', 'Moore', 'Ophthalmologist', '555-0987', 'williammoore@example.com', 'Office 108', 8),
(9, 'Sarah', 'Taylor', 'Oncologist', '555-1098', 'sarahtaylor@example.com', 'Office 109', 9),
(10, 'David', 'Anderson', 'Psychiatrist', '555-2109', 'davidanderson@example.com', 'Office 110', 10),
(11, 'Daniel', 'Thomas', 'Gastroenterologist', '555-3210', 'danielthomas@example.com', 'Office 111', 11),
(12, 'Christopher', 'Jackson', 'Endocrinologist', '555-4321', 'christopherjackson@example.com', 'Office 112', 12),
(13, 'Patricia', 'White', 'Pulmonologist', '555-5432', 'patriciawhite@example.com', 'Office 113', 13),
(14, 'Jennifer', 'Harris', 'Rheumatologist', '555-6543', 'jenniferharris@example.com', 'Office 114', 14),
(15, 'Linda', 'Martin', 'Allergist', '555-7654', 'lindamartin@example.com', 'Office 115', 15);

-- Insert Dummy Data into Appointment table
INSERT INTO Appointment (appointment_id, patient_id, doctor_id, appointment_date, appointment_time, status, notes) VALUES
(1, 1, 1, '2023-06-01', '10:00', 'Completed', 'Follow-up in 6 months'),
(2, 2, 2, '2023-06-02', '11:00', 'Scheduled', 'Initial consultation'),
(3, 3, 3, '2023-06-03', '09:00', 'Completed', 'Prescribed medication'),
(4, 4, 4, '2023-06-04', '14:00', 'Completed', 'Routine check-up'),
(5, 5, 5, '2023-06-05', '15:00', 'Scheduled', 'Dermatology consultation'),
(6, 6, 6, '2023-06-06', '13:00', 'Completed', 'Gynecology consultation'),
(7, 7, 7, '2023-06-07', '16:00', 'Scheduled', 'Urology consultation'),
(8, 8, 8, '2023-06-08', '08:00', 'Completed', 'Eye check-up'),
(9, 9, 9, '2023-06-09', '11:30', 'Completed', 'Oncology follow-up'),
(10, 10, 10, '2023-06-10', '12:00', 'Scheduled', 'Psychiatry consultation'),
(11, 11, 11, '2023-06-11', '14:30', 'Completed', 'Gastroenterology consultation'),
(12, 12, 12, '2023-06-12', '10:30', 'Completed', 'Endocrinology consultation'),
(13, 13, 13, '2023-06-13', '15:30', 'Completed', 'Pulmonology consultation'),
(14, 14, 14, '2023-06-14', '09:30', 'Completed', 'Rheumatology consultation'),
(15, 15, 15, '2023-06-15', '13:30', 'Scheduled', 'Allergy consultation');

-- Insert Dummy Data into Medical_Record table
INSERT INTO Medical_Record (record_id, patient_id, diagnosis, treatment, date, doctor_id, notes) VALUES
(1, 1, 'Hypertension', 'Medication', '2023-06-01', 1, 'Monitor blood pressure regularly'),
(2, 2, 'Migraine', 'Medication and lifestyle changes', '2023-06-02', 2, 'Avoid triggers'),
(3, 3, 'Fracture', 'Cast and physical therapy', '2023-06-03', 3, 'Follow up in 4 weeks'),
(4, 4, 'Asthma', 'Inhaler', '2023-06-04', 4, 'Use inhaler as needed'),
(5, 5, 'Eczema', 'Topical cream', '2023-06-05', 5, 'Apply cream twice daily'),
(6, 6, 'PCOS', 'Medication', '2023-06-06', 6, 'Follow up in 3 months'),
(7, 7, 'Kidney Stone', 'Surgery', '2023-06-07', 7, 'Scheduled surgery for next week'),
(8, 8, 'Myopia', 'Glasses', '2023-06-08', 8, 'Wear glasses regularly'),
(9, 9, 'Breast Cancer', 'Chemotherapy', '2023-06-09', 9, 'Scheduled chemotherapy sessions'),
(10, 10, 'Depression', 'Therapy and medication', '2023-06-10', 10, 'Weekly therapy sessions'),
(11, 11, 'Gastritis', 'Diet changes and medication', '2023-06-11', 11, 'Avoid spicy food'),
(12, 12, 'Diabetes', 'Insulin', '2023-06-12', 12, 'Monitor blood sugar levels'),
(13, 13, 'Chronic Bronchitis', 'Inhaler and medication', '2023-06-13', 13, 'Avoid smoking'),
(14, 14, 'Arthritis', 'Medication and physical therapy', '2023-06-14', 14, 'Regular exercise'),
(15, 15, 'Hay Fever', 'Antihistamines', '2023-06-15', 15, 'Avoid allergens');

-- Insert Dummy Data into Medication table
INSERT INTO Medication (medication_id, name, description, side_effects, manufacturer, price) VALUES
(1, 'Aspirin', 'Pain reliever', 'Stomach upset', 'Pharma Inc.', 10.00),
(2, 'Lisinopril', 'Blood pressure medication', 'Dizziness', 'Pharma Inc.', 20.00),
(3, 'Metformin', 'Diabetes medication', 'Nausea', 'Pharma Inc.', 30.00),
(4, 'Atorvastatin', 'Cholesterol medication', 'Muscle pain', 'Pharma Inc.', 40.00),
(5, 'Amoxicillin', 'Antibiotic', 'Rash', 'Pharma Inc.', 50.00),
(6, 'Omeprazole', 'Heartburn medication', 'Headache', 'Pharma Inc.', 60.00),
(7, 'Losartan', 'Blood pressure medication', 'Fatigue', 'Pharma Inc.', 70.00),
(8, 'Albuterol', 'Asthma medication', 'Tremors', 'Pharma Inc.', 80.00),
(9, 'Gabapentin', 'Nerve pain medication', 'Drowsiness', 'Pharma Inc.', 90.00),
(10, 'Levothyroxine', 'Thyroid medication', 'Sweating', 'Pharma Inc.', 100.00),
(11, 'Simvastatin', 'Cholesterol medication', 'Constipation', 'Pharma Inc.', 110.00),
(12, 'Metoprolol', 'Blood pressure medication', 'Cold hands', 'Pharma Inc.', 120.00),
(13, 'Hydrochlorothiazide', 'Diuretic', 'Dry mouth', 'Pharma Inc.', 130.00),
(14, 'Furosemide', 'Diuretic', 'Increased urination', 'Pharma Inc.', 140.00),
(15, 'Montelukast', 'Asthma medication', 'Cough', 'Pharma Inc.', 150.00);

-- Insert Dummy Data into Prescription table
INSERT INTO Prescription (prescription_id, appointment_id, medication_id, dosage, duration, instructions) VALUES
(1, 1, 1, '500 mg', '7 days', 'Take one tablet twice daily after meals'),
(2, 2, 2, '10 mg', '30 days', 'Take one tablet daily in the morning'),
(3, 3, 3, '500 mg', '14 days', 'Take one tablet with breakfast and dinner'),
(4, 4, 4, '20 mg', '10 days', 'Take one tablet daily at bedtime'),
(5, 5, 5, '250 mg', '7 days', 'Take one tablet every 8 hours'),
(6, 6, 6, '40 mg', '15 days', 'Take one tablet before breakfast'),
(7, 7, 7, '50 mg', '30 days', 'Take one tablet daily'),
(8, 8, 8, '2 puffs', 'As needed', 'Use inhaler as directed by physician'),
(9, 9, 9, '100 mg', '30 days', 'Take one tablet twice daily'),
(10, 10, 10, '75 mcg', '60 days', 'Take one tablet daily before breakfast'),
(11, 11, 11, '10 mg', '30 days', 'Take one tablet daily at bedtime'),
(12, 12, 12, '50 mg', '30 days', 'Take one tablet daily in the morning'),
(13, 13, 13, '25 mg', '14 days', 'Take one tablet daily'),
(14, 14, 14, '80 mg', '30 days', 'Take one tablet daily with breakfast'),
(15, 15, 15, '10 mg', '7 days', 'Take one tablet daily in the evening');

-- Insert Dummy Data into Ward table
INSERT INTO Ward (ward_id, ward_name, capacity, location, type, department_id, hospital_id) VALUES
(1, 'Cardiology Ward', 20, 'Floor 1', 'ICU', 1, 1),
(2, 'Neurology Ward', 15, 'Floor 2', 'General', 2, 2),
(3, 'Orthopedics Ward', 25, 'Floor 3', 'ICU', 3, 3),
(4, 'Pediatrics Ward', 30, 'Floor 4', 'General', 4, 4),
(5, 'Dermatology Ward', 10, 'Floor 5', 'General', 5, 5),
(6, 'Gynecology Ward', 20, 'Floor 6', 'ICU', 6, 6),
(7, 'Urology Ward', 15, 'Floor 7', 'General', 7, 7),
(8, 'Ophthalmology Ward', 10, 'Floor 8', 'ICU', 8, 8),
(9, 'Oncology Ward', 25, 'Floor 9', 'General', 9, 9),
(10, 'Psychiatry Ward', 20, 'Floor 10', 'General', 10, 10),
(11, 'Gastroenterology Ward', 15, 'Floor 11', 'ICU', 11, 11),
(12, 'Endocrinology Ward', 10, 'Floor 12', 'General', 12, 12),
(13, 'Pulmonology Ward', 20, 'Floor 13', 'ICU', 13, 13),
(14, 'Rheumatology Ward', 15, 'Floor 14', 'General', 14, 14),
(15, 'Allergy Ward', 10, 'Floor 15', 'General', 15, 15);

-- Insert Dummy Data into Bed table
INSERT INTO Bed (bed_id, ward_id, bed_number, status, patient_id) VALUES
(1, 1, 101, 'Occupied', 1),
(2, 1, 102, 'Available', NULL),
(3, 2, 201, 'Occupied', 2),
(4, 2, 202, 'Available', NULL),
(5, 3, 301, 'Occupied', 3),
(6, 3, 302, 'Available', NULL),
(7, 4, 401, 'Occupied', 4),
(8, 4, 402, 'Available', NULL),
(9, 5, 501, 'Occupied', 5),
(10, 5, 502, 'Available', NULL),
(11, 6, 601, 'Occupied', 6),
(12, 6, 602, 'Available', NULL),
(13, 7, 701, 'Occupied', 7),
(14, 7, 702, 'Available', NULL),
(15, 8, 801, 'Occupied', 8);

-- Insert Dummy Data into Nurse table
INSERT INTO Nurse (nurse_id, first_name, last_name, ward_id, contact_number, email, shift_id) VALUES
(1, 'Nancy', 'Jones', 1, '555-0001', 'nancyjones@example.com', 1),
(2, 'Oliver', 'Brown', 2, '555-0002', 'oliverbrown@example.com', 2),
(3, 'Pamela', 'Davis', 3, '555-0003', 'pameladavis@example.com', 3),
(4, 'Quincy', 'Evans', 4, '555-0004', 'quincyevans@example.com', 4),
(5, 'Rachel', 'Garcia', 5, '555-0005', 'rachelgarcia@example.com', 5),
(6, 'Samuel', 'Harris', 6, '555-0006', 'samuelharris@example.com', 6),
(7, 'Teresa', 'Jackson', 7, '555-0007', 'teresajackson@example.com', 7),
(8, 'Ursula', 'Kim', 8, '555-0008', 'ursulakim@example.com', 8),
(9, 'Victor', 'Lee', 9, '555-0009', 'victorlee@example.com', 9),
(10, 'Wendy', 'Martinez', 10, '555-0010', 'wendymartinez@example.com', 10),
(11, 'Xander', 'Nelson', 11, '555-0011', 'xandernelson@example.com', 11),
(12, 'Yvonne', 'Ortiz', 12, '555-0012', 'yvonneortiz@example.com', 12),
(13, 'Zachary', 'Parker', 13, '555-0013', 'zacharyparker@example.com', 13),
(14, 'Abigail', 'Quinn', 14, '555-0014', 'abigailquinn@example.com', 14),
(15, 'Brandon', 'Roberts', 15, '555-0015', 'brandonroberts@example.com', 15);

-- Insert Dummy Data into Bill table
INSERT INTO Bill (bill_id, patient_id, amount, date, status, payment_method) VALUES
(1, 1, 500.00, '2023-06-01', 'Paid', 'Credit Card'),
(2, 2, 300.00, '2023-06-02', 'Unpaid', 'Cash'),
(3, 3, 700.00, '2023-06-03', 'Paid', 'Credit Card'),
(4, 4, 400.00, '2023-06-04', 'Unpaid', 'Insurance'),
(5, 5, 200.00, '2023-06-05', 'Paid', 'Cash'),
(6, 6, 600.00, '2023-06-06', 'Unpaid', 'Credit Card'),
(7, 7, 800.00, '2023-06-07', 'Paid', 'Cash'),
(8, 8, 100.00, '2023-06-08', 'Unpaid', 'Insurance'),
(9, 9, 900.00, '2023-06-09', 'Paid', 'Credit Card'),
(10, 10, 500.00, '2023-06-10', 'Unpaid', 'Cash'),
(11, 11, 300.00, '2023-06-11', 'Paid', 'Credit Card'),
(12, 12, 700.00, '2023-06-12', 'Unpaid', 'Insurance'),
(13, 13, 400.00, '2023-06-13', 'Paid', 'Cash'),
(14, 14, 200.00, '2023-06-14', 'Unpaid', 'Credit Card'),
(15, 15, 600.00, '2023-06-15', 'Paid', 'Cash');

-- Insert Dummy Data into Payment table
INSERT INTO Payment (payment_id, bill_id, payment_method, payment_date, amount) VALUES
(1, 1, 'Credit Card', '2023-06-01', 500.00),
(2, 3, 'Credit Card', '2023-06-03', 700.00),
(3, 5, 'Cash', '2023-06-05', 200.00),
(4, 7, 'Cash', '2023-06-07', 800.00),
(5, 9, 'Credit Card', '2023-06-09', 900.00),
(6, 11, 'Credit Card', '2023-06-11', 300.00),
(7, 13, 'Cash', '2023-06-13', 400.00),
(8, 15, 'Cash', '2023-06-15', 600.00);

-- Insert Dummy Data into Lab_Test table
INSERT INTO Lab_Test (test_id, name, description, cost, normal_range) VALUES
(1, 'Blood Test', 'Complete blood count', 100.00, '4.5-11.0'),
(2, 'Urine Test', 'Urinalysis', 50.00, '1.005-1.030'),
(3, 'X-Ray', 'Chest X-ray', 200.00, 'Normal'),
(4, 'MRI', 'Brain MRI', 500.00, 'Normal'),
(5, 'CT Scan', 'Abdominal CT scan', 400.00, 'Normal'),
(6, 'Ultrasound', 'Pelvic ultrasound', 300.00, 'Normal'),
(7, 'ECG', 'Electrocardiogram', 150.00, 'Normal'),
(8, 'Lipid Panel', 'Cholesterol levels', 80.00, 'Normal'),
(9, 'Liver Function', 'Liver enzyme levels', 120.00, 'Normal'),
(10, 'Kidney Function', 'Kidney enzyme levels', 110.00, 'Normal'),
(11, 'Thyroid Function', 'Thyroid hormone levels', 130.00, 'Normal'),
(12, 'Allergy Test', 'Allergy sensitivity', 90.00, 'Negative'),
(13, 'Blood Sugar', 'Glucose levels', 70.00, '70-110'),
(14, 'Bone Density', 'Bone mineral density', 250.00, 'Normal'),
(15, 'HIV Test', 'HIV antibodies', 200.00, 'Negative');

-- Insert Dummy Data into Lab_Result table
INSERT INTO Lab_Result (result_id, test_id, appointment_id, result, date, notes) VALUES
(1, 1, 1, 'Normal', '2023-06-01', 'No abnormalities detected'),
(2, 2, 2, 'Normal', '2023-06-02', 'No abnormalities detected'),
(3, 3, 3, 'Normal', '2023-06-03', 'No abnormalities detected'),
(4, 4, 4, 'Normal', '2023-06-04', 'No abnormalities detected'),
(5, 5, 5, 'Normal', '2023-06-05', 'No abnormalities detected'),
(6, 6, 6, 'Normal', '2023-06-06', 'No abnormalities detected'),
(7, 7, 7, 'Normal', '2023-06-07', 'No abnormalities detected'),
(8, 8, 8, 'Normal', '2023-06-08', 'No abnormalities detected'),
(9, 9, 9, 'Normal', '2023-06-09', 'No abnormalities detected'),
(10, 10, 10, 'Normal', '2023-06-10', 'No abnormalities detected'),
(11, 11, 11, 'Normal', '2023-06-11', 'No abnormalities detected'),
(12, 12, 12, 'Normal', '2023-06-12', 'No abnormalities detected'),
(13, 13, 13, 'Normal', '2023-06-13', 'No abnormalities detected'),
(14, 14, 14, 'Normal', '2023-06-14', 'No abnormalities detected'),
(15, 15, 15, 'Normal', '2023-06-15', 'No abnormalities detected');

-- Insert Dummy Data into Staff table
INSERT INTO Staff (staff_id, first_name, last_name, role, department_id, contact_number, email) VALUES
(1, 'Adam', 'Baker', 'Technician', 1, '555-0101', 'adambaker@example.com'),
(2, 'Bella', 'Carter', 'Technician', 2, '555-0102', 'bellacarter@example.com'),
(3, 'Carlos', 'Dixon', 'Technician', 3, '555-0103', 'carlosdixon@example.com'),
(4, 'Diana', 'Evans', 'Technician', 4, '555-0104', 'dianaevans@example.com'),
(5, 'Edward', 'Foster', 'Technician', 5, '555-0105', 'edwardfoster@example.com'),
(6, 'Fiona', 'Gordon', 'Technician', 6, '555-0106', 'fionagordon@example.com'),
(7, 'George', 'Hughes', 'Technician', 7, '555-0107', 'georgehughes@example.com'),
(8, 'Hannah', 'Ingram', 'Technician', 8, '555-0108', 'hannahingram@example.com'),
(9, 'Isaac', 'Jones', 'Technician', 9, '555-0109', 'isaacjones@example.com'),
(10, 'Jasmine', 'King', 'Technician', 10, '555-0110', 'jasmineking@example.com'),
(11, 'Kevin', 'Lewis', 'Technician', 11, '555-0111', 'kevinlewis@example.com'),
(12, 'Laura', 'Morris', 'Technician', 12, '555-0112', 'lauramorris@example.com'),
(13, 'Mark', 'Nelson', 'Technician', 13, '555-0113', 'marknelson@example.com'),
(14, 'Nina', 'Owens', 'Technician', 14, '555-0114', 'ninaowens@example.com'),
(15, 'Oscar', 'Perry', 'Technician', 15, '555-0115', 'oscarperry@example.com');

-- Insert Dummy Data into Shift table
INSERT INTO Shift (shift_id, staff_id, start_time, end_time, date) VALUES
(1, 1, '08:00', '16:00', '2023-06-01'),
(2, 2, '08:00', '16:00', '2023-06-02'),
(3, 3, '08:00', '16:00', '2023-06-03'),
(4, 4, '08:00', '16:00', '2023-06-04'),
(5, 5, '08:00', '16:00', '2023-06-05'),
(6, 6, '08:00', '16:00', '2023-06-06'),
(7, 7, '08:00', '16:00', '2023-06-07'),
(8, 8, '08:00', '16:00', '2023-06-08'),
(9, 9, '08:00', '16:00', '2023-06-09'),
(10, 10, '08:00', '16:00', '2023-06-10'),
(11, 11, '08:00', '16:00', '2023-06-11'),
(12, 12, '08:00', '16:00', '2023-06-12'),
(13, 13, '08:00', '16:00', '2023-06-13'),
(14, 14, '08:00', '16:00', '2023-06-14'),
(15, 15, '08:00', '16:00', '2023-06-15');

-- Insert Dummy Data into Room table
INSERT INTO Room (room_id, ward_id, room_number, type, availability_status) VALUES
(1, 1, 101, 'Single', 'Available'),
(2, 1, 102, 'Single', 'Occupied'),
(3, 2, 201, 'Double', 'Available'),
(4, 2, 202, 'Double', 'Occupied'),
(5, 3, 301, 'Single', 'Available'),
(6, 3, 302, 'Single', 'Occupied'),
(7, 4, 401, 'Double', 'Available'),
(8, 4, 402, 'Double', 'Occupied'),
(9, 5, 501, 'Single', 'Available'),
(10, 5, 502, 'Single', 'Occupied'),
(11, 6, 601, 'Double', 'Available'),
(12, 6, 602, 'Double', 'Occupied'),
(13, 7, 701, 'Single', 'Available'),
(14, 7, 702, 'Single', 'Occupied'),
(15, 8, 801, 'Double', 'Available');

-- Insert Dummy Data into Surgery table
INSERT INTO Surgery (surgery_id, patient_id, doctor_id, date, description, outcome, notes) VALUES
(1, 1, 1, '2023-06-01', 'Appendectomy', 'Successful', 'Patient recovered well'),
(2, 2, 2, '2023-06-02', 'Gallbladder removal', 'Successful', 'Patient recovered well'),
(3, 3, 3, '2023-06-03', 'Hip replacement', 'Successful', 'Patient recovered well'),
(4, 4, 4, '2023-06-04', 'Knee replacement', 'Successful', 'Patient recovered well'),
(5, 5, 5, '2023-06-05', 'Cataract surgery', 'Successful', 'Patient recovered well'),
(6, 6, 6, '2023-06-06', 'Hysterectomy', 'Successful', 'Patient recovered well'),
(7, 7, 7, '2023-06-07', 'Kidney stone removal', 'Successful', 'Patient recovered well'),
(8, 8, 8, '2023-06-08', 'LASIK', 'Successful', 'Patient recovered well'),
(9, 9, 9, '2023-06-09', 'Mastectomy', 'Successful', 'Patient recovered well'),
(10, 10, 10, '2023-06-10', 'Gastric bypass', 'Successful', 'Patient recovered well'),
(11, 11, 11, '2023-06-11', 'Colonoscopy', 'Successful', 'Patient recovered well'),
(12, 12, 12, '2023-06-12', 'Thyroidectomy', 'Successful', 'Patient recovered well'),
(13, 13, 13, '2023-06-13', 'Lung biopsy', 'Successful', 'Patient recovered well'),
(14, 14, 14, '2023-06-14', 'Arthroscopy', 'Successful', 'Patient recovered well'),
(15, 15, 15, '2023-06-15', 'Sinus surgery', 'Successful', 'Patient recovered well');

-- Insert Dummy Data into Supplier table
INSERT INTO Supplier (supplier_id, name, contact_person, contact_number, email, address) VALUES
(1, 'Medical Supplies Inc.', 'John Smith', '555-1001', 'johnsmith@medsupplies.com', '123 Supply St, City'),
(2, 'Healthcare Equipment Ltd.', 'Jane Doe', '555-1002', 'janedoe@healthcareequip.com', '456 Equip Ave, County'),
(3, 'Surgical Instruments Co.', 'Alice Johnson', '555-1003', 'alicejohnson@surgicalinst.com', '789 Surgical Rd, Central'),
(4, 'Pharma Distributors', 'Robert Brown', '555-1004', 'robertbrown@pharmadist.com', '321 Pharma St, Westside'),
(5, 'Hospital Essentials', 'Emily Davis', '555-1005', 'emilydavis@hospessentials.com', '654 Hospital Ave, Eastside'),
(6, 'Clinical Supplies Corp.', 'Michael Wilson', '555-1006', 'michaelwilson@clinicalsupp.com', '987 Clinical Rd, North'),
(7, 'Diagnostic Tools LLC', 'William Moore', '555-1007', 'williamm@diagtools.com', '123 Diagnostic St, South'),
(8, 'Patient Care Supplies', 'Sarah Taylor', '555-1008', 'sarahtaylor@patientcare.com', '456 Care Ave, Green'),
(9, 'Lab Equipment Ltd.', 'David Anderson', '555-1009', 'davidanderson@labequip.com', '789 Lab Rd, Blue'),
(10, 'Rehab Supplies Inc.', 'Daniel Thomas', '555-1010', 'danielthomas@rehabsupplies.com', '321 Rehab St, Red'),
(11, 'Wellness Supplies', 'Christopher Jackson', '555-1011', 'chrisjackson@wellness.com', '654 Wellness Ave, Yellow'),
(12, 'First Aid Supplies Co.', 'Patricia White', '555-1012', 'patwhite@firstaid.com', '987 First Aid Rd, Purple'),
(13, 'Pharmaceutical Essentials', 'Jennifer Harris', '555-1013', 'jennharris@pharmaessentials.com', '123 Pharma St, Orange'),
(14, 'MedTech Supplies', 'Linda Martin', '555-1014', 'lindamartin@medtech.com', '456 MedTech Ave, Black'),
(15, 'CarePlus Supplies', 'Mark Wilson', '555-1015', 'markwilson@careplus.com', '789 CarePlus Rd, White');


-- Insert Dummy Data into Inventory table
INSERT INTO Inventory (inventory_id, name, quantity, description, supplier_id, date_received, expiration_date) VALUES
(1, 'Bandages', 100, 'Sterile bandages', 1, '2023-05-01', '2025-05-01'),
(2, 'Gloves', 200, 'Disposable gloves', 2, '2023-05-02', '2025-05-02'),
(3, 'Syringes', 300, 'Disposable syringes', 3, '2023-05-03', '2025-05-03'),
(4, 'Masks', 400, 'Surgical masks', 4, '2023-05-04', '2025-05-04'),
(5, 'Thermometers', 50, 'Digital thermometers', 5, '2023-05-05', '2025-05-05'),
(6, 'Scalpel', 100, 'Surgical scalpels', 6, '2023-05-06', '2025-05-06'),
(7, 'IV Bags', 200, 'Intravenous fluid bags', 7, '2023-05-07', '2025-05-07'),
(8, 'Alcohol Swabs', 300, 'Sterile alcohol swabs', 8, '2023-05-08', '2025-05-08'),
(9, 'Stethoscope', 50, 'Diagnostic stethoscopes', 9, '2023-05-09', '2025-05-09'),
(10, 'Blood Pressure Cuffs', 100, 'Automatic blood pressure cuffs', 10, '2023-05-10', '2025-05-10'),
(11, 'ECG Machine', 10, 'Electrocardiogram machines', 11, '2023-05-11', '2025-05-11'),
(12, 'X-Ray Film', 200, 'Radiographic films', 12, '2023-05-12', '2025-05-12'),
(13, 'Gauze', 300, 'Sterile gauze pads', 13, '2023-05-13', '2025-05-13'),
(14, 'Antiseptic Solution', 100, 'Antiseptic skin cleanser', 14, '2023-05-14', '2025-05-14'),
(15, 'Wheelchair', 50, 'Manual wheelchairs', 15, '2023-05-15', '2025-05-15');


-- Insert Dummy Data into Insurance table
INSERT INTO Insurance (insurance_id, provider_name, policy_number, patient_id, coverage_details, expiry_date) VALUES
(1, 'Health Insurance Co.', 'HIC12345', 1, 'Covers 80% of hospital expenses', '2024-06-01'),
(2, 'Medicare', 'MC67890', 2, 'Covers 100% of hospital expenses', '2024-06-02'),
(3, 'Private Insurance', 'PI11223', 3, 'Covers 70% of hospital expenses', '2024-06-03'),
(4, 'Health Assurance', 'HA44556', 4, 'Covers 90% of hospital expenses', '2024-06-04'),
(5, 'Care Insurance', 'CI77889', 5, 'Covers 75% of hospital expenses', '2024-06-05'),
(6, 'Wellness Insurance', 'WI99001', 6, 'Covers 85% of hospital expenses', '2024-06-06'),
(7, 'Health Guard', 'HG22334', 7, 'Covers 95% of hospital expenses', '2024-06-07'),
(8, 'CarePlus', 'CP55667', 8, 'Covers 80% of hospital expenses', '2024-06-08'),
(9, 'Secure Health', 'SH88990', 9, 'Covers 70% of hospital expenses', '2024-06-09'),
(10, 'Total Health', 'TH11234', 10, 'Covers 100% of hospital expenses', '2024-06-10'),
(11, 'Prime Health', 'PH34567', 11, 'Covers 90% of hospital expenses', '2024-06-11'),
(12, 'Basic Health', 'BH67890', 12, 'Covers 60% of hospital expenses', '2024-06-12'),
(13, 'Advanced Health', 'AH11223', 13, 'Covers 75% of hospital expenses', '2024-06-13'),
(14, 'Family Health', 'FH44556', 14, 'Covers 85% of hospital expenses', '2024-06-14'),
(15, 'Elite Health', 'EH77889', 15, 'Covers 100% of hospital expenses', '2024-06-15');

-- Insert Dummy Data into Visit table
INSERT INTO Visit (visit_id, patient_id, doctor_id, visit_date, purpose, notes) VALUES
(1, 1, 1, '2023-06-01', 'Follow-up', 'Patient is recovering well'),
(2, 2, 2, '2023-06-02', 'Initial consultation', 'Scheduled tests'),
(3, 3, 3, '2023-06-03', 'Routine check-up', 'Prescribed medication'),
(4, 4, 4, '2023-06-04', 'Specialist consultation', 'Referred to specialist'),
(5, 5, 5, '2023-06-05', 'Dermatology consultation', 'Prescribed topical cream'),
(6, 6, 6, '2023-06-06', 'Gynecology consultation', 'Scheduled follow-up'),
(7, 7, 7, '2023-06-07', 'Urology consultation', 'Recommended surgery'),
(8, 8, 8, '2023-06-08', 'Ophthalmology consultation', 'Prescribed glasses'),
(9, 9, 9, '2023-06-09', 'Oncology consultation', 'Scheduled chemotherapy'),
(10, 10, 10, '2023-06-10', 'Psychiatry consultation', 'Scheduled therapy sessions'),
(11, 11, 11, '2023-06-11', 'Gastroenterology consultation', 'Recommended diet changes'),
(12, 12, 12, '2023-06-12', 'Endocrinology consultation', 'Prescribed medication'),
(13, 13, 13, '2023-06-13', 'Pulmonology consultation', 'Prescribed inhaler'),
(14, 14, 14, '2023-06-14', 'Rheumatology consultation', 'Recommended physical therapy'),
(15, 15, 15, '2023-06-15', 'Allergy consultation', 'Prescribed antihistamines');

------------------------------------------------------------------------------------------------------------------------------------------------
-- Queries

-- 1.Retrieve all patients who have had an appointment with a cardiologist:
SELECT p.first_name, p.last_name, d.first_name AS doctor_first_name, d.last_name AS doctor_last_name
FROM Patient p
JOIN Appointment a ON p.patient_id = a.patient_id
JOIN Doctor d ON a.doctor_id = d.doctor_id
WHERE d.specialization = 'Cardiologist';

-- 2.Retrieve the total number of beds available in the hospital:
SELECT COUNT(*) AS available_beds
FROM Bed
WHERE status = 'Available';

-- 3.Retrieve all medications prescribed to a particular patient (patient ID 1):
SELECT m.name AS medication_name, p.first_name AS patient_first_name, p.last_name AS patient_last_name
FROM Medication m
JOIN prescription pr ON m.medication_id = pr.medication_id
JOIN appointment a ON pr.appointment_id = a.appointment_id
JOIN patient p ON a.patient_id = p.patient_id
WHERE p.patient_id = 1;

-- 4. Retrieve the list of patients along with their latest appointment date
SELECT p.first_name, p.last_name, MAX(a.appointment_date) AS latest_appointment
FROM Patient p
JOIN Appointment a ON p.patient_id = a.patient_id
GROUP BY p.patient_id, p.first_name, p.last_name;

-- 5. Retrieve the total revenue generated from paid bills
SELECT SUM(b.amount) AS total_revenue
FROM Bill b
WHERE b.status = 'Paid';

-- 6. Retrieve the list of patients who have had more than 3 appointments
SELECT p.first_name, p.last_name, COUNT(a.appointment_id) AS appointment_count
FROM Patient p
JOIN Appointment a ON p.patient_id = a.patient_id
GROUP BY p.patient_id, p.first_name, p.last_name
HAVING COUNT(a.appointment_id) > 1;

-- 7. Retrieve the details of all medications prescribed in a specific ward
SELECT m.name AS medication_name, p.first_name AS patient_first_name, p.last_name AS patient_last_name, w.ward_name
FROM Medication m
JOIN Prescription pr ON m.medication_id = pr.medication_id
JOIN Appointment a ON pr.appointment_id = a.appointment_id
JOIN Patient p ON a.patient_id = p.patient_id
JOIN Bed b ON p.patient_id = b.patient_id
JOIN Ward w ON b.ward_id = w.ward_id
WHERE w.ward_id = 1;

-- 8. Retrieve the list of patients who have been admitted to the hospital for more than 7 days
SELECT p.first_name, p.last_name, DATEDIFF(CURDATE(), a.appointment_date) AS days_admitted
FROM Patient p
JOIN Appointment a ON p.patient_id = a.patient_id
WHERE a.status = 'Admitted'
  AND DATEDIFF(CURDATE(), a.appointment_date) > 2;
  
-- 9. Retrieve the average cost of lab tests performed for a specific patient
SELECT AVG(lt.cost) AS average_test_cost
FROM Lab_Test lt
JOIN Lab_Result lr ON lt.test_id = lr.test_id
JOIN Appointment a ON lr.appointment_id = a.appointment_id
WHERE a.patient_id = 1;

-- 10. Retrieve the list of doctors along with the number of surgeries they have performed
SELECT d.first_name, d.last_name, COUNT(s.surgery_id) AS surgery_count
FROM Doctor d
JOIN Surgery s ON d.doctor_id = s.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name
ORDER BY surgery_count DESC;

-- 11. Retrieve the list of patients who have appointments with multiple doctors
SELECT p.first_name, p.last_name, COUNT(DISTINCT a.doctor_id) AS doctor_count
FROM Patient p
JOIN Appointment a ON p.patient_id = a.patient_id
GROUP BY p.patient_id, p.first_name, p.last_name
HAVING COUNT(DISTINCT a.doctor_id) > 1;

-- 12. Retrieve the average, minimum, and maximum bill amounts for each department
SELECT d.name AS department_name, 
       AVG(b.amount) AS avg_bill_amount, 
       MIN(b.amount) AS min_bill_amount, 
       MAX(b.amount) AS max_bill_amount
FROM Bill b
JOIN Patient p ON b.patient_id = p.patient_id
JOIN Appointment a ON p.patient_id = a.patient_id
JOIN Doctor doc ON a.doctor_id = doc.doctor_id
JOIN Department d ON doc.department_id = d.department_id
GROUP BY d.name;

-- 13. Retrieve the list of doctors who have treated patients with a specific diagnosis more than a certain number of times
SELECT d.first_name, d.last_name, COUNT(mr.record_id) AS treatment_count
FROM Doctor d
JOIN Medical_Record mr ON d.doctor_id = mr.doctor_id
WHERE mr.diagnosis = 'Hypertension'
GROUP BY d.doctor_id, d.first_name, d.last_name
HAVING COUNT(mr.record_id) > 0;

-- Stored Procedure to Update Patient Contact Information
DELIMITER //

CREATE PROCEDURE UpdatePatientContactInfo(
    IN patientID INT,
    IN newContactNumber VARCHAR(15),
    IN newEmail VARCHAR(100),
    IN newAddress VARCHAR(255),
    IN newEmergencyContact VARCHAR(100)
)
BEGIN
    UPDATE Patient
    SET contact_number = newContactNumber,
        email = newEmail,
        address = newAddress,
        emergency_contact = newEmergencyContact
    WHERE patient_id = patientID;
END //
DELIMITER ;

CALL UpdatePatientContactInfo(1, '555-9999', 'newemail@example.com', '123 New St', 'New Contact');


-- Stored Procedure to Add a New Patient
DELIMITER //

CREATE PROCEDURE AddNewPatient(
    IN firstName VARCHAR(100),
    IN lastName VARCHAR(100),
    IN dob DATE,
    IN gender VARCHAR(10),
    IN contactNumber VARCHAR(15),
    IN email VARCHAR(100),
    IN address VARCHAR(255),
    IN emergencyContact VARCHAR(100)
)
BEGIN
    INSERT INTO Patient (first_name, last_name, dob, gender, contact_number, email, address, emergency_contact)
    VALUES (firstName, lastName, dob, gender, contactNumber, email, address, emergencyContact);
END //

DELIMITER ;

CALL AddNewPatient('John', 'Doe', '1990-05-15', 'Male', '555-1234', 'johndoe@example.com', '123 Elm St', 'Jane Doe');

-- Trigger to Update Bed Status on Patient Discharge
DELIMITER //

CREATE TRIGGER UpdateBedStatusAfterDischarge
AFTER UPDATE ON Appointment
FOR EACH ROW
BEGIN
    IF NEW.status = 'Completed' THEN
        UPDATE Bed
        SET status = 'Available', patient_id = NULL
        WHERE patient_id = NEW.patient_id;
    END IF;
END //

DELIMITER ;

-- View to Show Detailed Appointment Information
CREATE VIEW DetailedAppointments AS
SELECT 
    a.appointment_id,
    p.first_name AS patient_first_name,
    p.last_name AS patient_last_name,
    d.first_name AS doctor_first_name,
    d.last_name AS doctor_last_name,
    a.appointment_date,
    a.appointment_time,
    a.status,
    a.notes
FROM 
    Appointment a
JOIN 
    Patient p ON a.patient_id = p.patient_id
JOIN 
    Doctor d ON a.doctor_id = d.doctor_id;
    
-- --------------------------------------------------Verifying Trigger-----------------------------------------------------------------
-- Insert data into Bed
INSERT INTO Bed (bed_id, ward_id, bed_number, status, patient_id) VALUES
(16, 1, 103, 'Occupied', 1),
(17, 2, 203, 'Occupied', 2);

-- Insert data into Appointment
INSERT INTO Appointment (appointment_id, patient_id, doctor_id, appointment_date, appointment_time, status, notes) VALUES
(16, 1, 1, '2023-06-16', '10:00', 'Scheduled', 'Initial consultation'),
(17, 2, 2, '2023-06-17', '11:00', 'Scheduled', 'Follow-up visit');

-- Update the status of an appointment to 'Completed'
UPDATE Appointment
SET status = 'Completed'
WHERE appointment_id = 16;

-- Check the Bed table to verify the status update
SELECT * FROM Bed WHERE bed_id = 16;

-- ---------------------------------------------------------Verifying created view--------------------------------------------------------
SELECT * FROM DetailedAppointments;











