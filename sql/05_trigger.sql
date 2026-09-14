-- =====================================================================
-- Question 3 - Trigger: after_inmate_delete
-- =====================================================================

USE Mdze_219080682;


-- ---------------------------------------------------------------------
-- Create the trigger
-- ---------------------------------------------------------------------
-- Automatically decreases the cell occupancy when an inmate is
-- deleted from Mdze_Inmates.

DELIMITER //

CREATE TRIGGER after_inmate_delete
AFTER DELETE ON Mdze_Inmates
FOR EACH ROW
BEGIN

    UPDATE Mdze_Cells
    SET current_occupancy = current_occupancy - 1
    WHERE cell_id = OLD.cell_id;

END //

DELIMITER ;


-- ---------------------------------------------------------------------
-- Test the trigger
-- ---------------------------------------------------------------------
-- A temporary inmate is inserted without any linked visit or
-- rehabilitation records. This allows the inmate to be safely deleted
-- without violating the foreign key constraints.

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
    'Mandla',
    'Nkuna',
    '1991-07-11',
    'Vandalism',
    2,
    '2025-06-17',
    1
);


-- Check occupancy before deletion
SELECT *
FROM Mdze_Cells
WHERE cell_id = 1;


-- Delete the temporary inmate
DELETE FROM Mdze_Inmates
WHERE first_name = 'Mandla'
  AND last_name = 'Nkuna';


-- Check occupancy after deletion
SELECT *
FROM Mdze_Cells
WHERE cell_id = 1;