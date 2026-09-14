-- =====================================================================
-- Mdze_219080682 - Prison Management Database
-- Schema
-- =====================================================================

DROP DATABASE IF EXISTS Mdze_219080682;
CREATE DATABASE Mdze_219080682;
USE Mdze_219080682;


-- ---------------------------------------------------------------------
-- Mdze_Cells - prison cell blocks and occupancy
-- ---------------------------------------------------------------------

CREATE TABLE Mdze_Cells (
    cell_id           INT AUTO_INCREMENT PRIMARY KEY,
    block             VARCHAR(10),
    capacity          INT,
    current_occupancy INT,
    security_level    VARCHAR(50)
);


-- ---------------------------------------------------------------------
-- Mdze_Inmates - stores prisoner details
-- ---------------------------------------------------------------------

CREATE TABLE Mdze_Inmates (
    inmate_id      INT AUTO_INCREMENT PRIMARY KEY,
    first_name     VARCHAR(50),
    last_name      VARCHAR(50),
    dob            DATE,
    crime          VARCHAR(100),
    sentence_years INT,
    date_admitted  DATE,
    cell_id        INT,
    FOREIGN KEY (cell_id) REFERENCES Mdze_Cells(cell_id)
);


-- ---------------------------------------------------------------------
-- Mdze_Guards - staff information
-- ---------------------------------------------------------------------

CREATE TABLE Mdze_Guards (
    guard_id     INT AUTO_INCREMENT PRIMARY KEY,
    full_name    VARCHAR(100),
    guard_rank   VARCHAR(50),
    hire_date    DATE,
    shift        VARCHAR(20),
    phone_number VARCHAR(20)
);


-- ---------------------------------------------------------------------
-- Mdze_Visits - visitation records
-- ---------------------------------------------------------------------

CREATE TABLE Mdze_Visits (
    visit_id     INT AUTO_INCREMENT PRIMARY KEY,
    inmate_id    INT,
    visitor_name VARCHAR(100),
    relationship VARCHAR(50),
    visit_date   DATE,
    FOREIGN KEY (inmate_id) REFERENCES Mdze_Inmates(inmate_id)
);


-- ---------------------------------------------------------------------
-- Mdze_Programs - rehabilitation program enrollment
-- ---------------------------------------------------------------------

CREATE TABLE Mdze_Programs (
    program_id      INT AUTO_INCREMENT PRIMARY KEY,
    inmate_id       INT,
    program_name    VARCHAR(100),
    enrollment_date DATE,
    completion_date DATE,
    status          VARCHAR(50),
    FOREIGN KEY (inmate_id) REFERENCES Mdze_Inmates(inmate_id)
);