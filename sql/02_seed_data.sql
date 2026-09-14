-- =====================================================================
-- Mdze_219080682 - Seed Data
-- =====================================================================

USE Mdze_219080682;


-- ---------------------------------------------------------------------
-- Insert Cells
-- ---------------------------------------------------------------------

INSERT INTO Mdze_Cells (
    block,
    capacity,
    current_occupancy,
    security_level
) VALUES
('A1', 10, 2, 'Medium'),
('B2', 8, 1, 'Low'),
('C3', 12, 1, 'High'),
('D4', 6, 0, 'Maximum');


-- ---------------------------------------------------------------------
-- Insert Inmates
-- ---------------------------------------------------------------------

INSERT INTO Mdze_Inmates (
    first_name,
    last_name,
    dob,
    crime,
    sentence_years,
    date_admitted,
    cell_id
) VALUES
('Sibusiso', 'Nkosi', '1990-05-10', 'Housebreaking', 5, '2022-04-01', 1),
('Bongani', 'Dlamini', '1988-08-21', 'Fraud', 3, '2023-01-12', 2),
('Thabo', 'Mokoena', '1995-11-02', 'Assault', 7, '2021-06-15', 1),
('Sifiso', 'Khumalo', '1993-03-19', 'Drug Trafficking', 10, '2020-09-03', 3);


-- ---------------------------------------------------------------------
-- Insert Guards
-- ---------------------------------------------------------------------

INSERT INTO Mdze_Guards (
    full_name,
    guard_rank,
    hire_date,
    shift,
    phone_number
) VALUES
('Sipho Dube', 'Sergeant', '2018-01-15', 'Day', '0821234567'),
('Zanele Mahlangu', 'Warden', '2020-06-01', 'Night', '0839876543'),
('Vusi Mthembu', 'Senior Warden', '2015-09-10', 'Day', '0845557777'),
('Ayanda Ngubane', 'Corporal', '2023-03-25', 'Night', '0812345678');


-- ---------------------------------------------------------------------
-- Insert Visits
-- ---------------------------------------------------------------------

INSERT INTO Mdze_Visits (
    inmate_id,
    visitor_name,
    relationship,
    visit_date
) VALUES
(1, 'Gogo Nomvula', 'Grandmother', '2024-12-01'),
(2, 'Bongani Dlamini', 'Brother', '2025-01-15'),
(3, 'Thembi Mokoena', 'Mother', '2025-03-20');


-- ---------------------------------------------------------------------
-- Insert Rehabilitation Programs
-- ---------------------------------------------------------------------

INSERT INTO Mdze_Programs (
    inmate_id,
    program_name,
    enrollment_date,
    completion_date,
    status
) VALUES
(1, 'Skills Development - Plumbing', '2023-07-01', NULL, 'Ongoing'),
(2, 'Basic Computer Literacy', '2024-01-10', '2024-06-10', 'Completed'),
(3, 'Anger Management', '2024-09-01', NULL, 'Ongoing'),
(4, 'Substance Abuse Recovery', '2022-03-15', '2023-03-15', 'Completed');