-- =====================================================================
-- Question 2 - Stored Procedure: AddInmateAndUpdateCell
-- =====================================================================

USE Mdze_219080682;


-- ---------------------------------------------------------------------
-- Create the stored procedure
-- ---------------------------------------------------------------------

DELIMITER //

CREATE PROCEDURE AddInmateAndUpdateCell(
    IN fname VARCHAR(50),
    IN lname VARCHAR(50),
    IN dob DATE,
    IN crime_type VARCHAR(100),
    IN sentence INT,
    IN admission DATE,
    IN target_cell_id INT
)
BEGIN

    INSERT INTO Mdze_Inmates (
        first_name,
        last_name,
        dob,
        crime,
        sentence_years,
        date_admitted,
        cell_id
    )
    VALUES (
        fname,
        lname,
        dob,
        crime_type,
        sentence,
        admission,
        target_cell_id
    );

    UPDATE Mdze_Cells
    SET current_occupancy = current_occupancy + 1
    WHERE cell_id = target_cell_id;

END //

DELIMITER ;


-- ---------------------------------------------------------------------
-- Test the stored procedure
-- ---------------------------------------------------------------------

CALL AddInmateAndUpdateCell(
    'Xolani',
    'Zwane',
    '1992-10-10',
    'Theft',
    4,
    '2025-06-17',
    1
);


-- Verify that the inmate was added
SELECT *
FROM Mdze_Inmates
WHERE first_name = 'Xolani'
  AND last_name = 'Zwane';


-- Verify that cell occupancy increased
SELECT *
FROM Mdze_Cells
WHERE cell_id = 1;