-- =====================================================================
-- Question 4 - Function, Cursor, and Event
-- =====================================================================

USE Mdze_219080682;


-- =====================================================================
-- 4a. FUNCTION: GetYearsRemaining
-- =====================================================================
-- Calculates the number of years remaining on an inmate's sentence.

DELIMITER //

CREATE FUNCTION GetYearsRemaining(inmateId INT)
RETURNS INT
DETERMINISTIC
BEGIN

    DECLARE yearsServed INT;
    DECLARE totalYears INT;
    DECLARE remaining INT;

    SELECT
        TIMESTAMPDIFF(YEAR, date_admitted, CURDATE()),
        sentence_years
    INTO
        yearsServed,
        totalYears
    FROM Mdze_Inmates
    WHERE inmate_id = inmateId;

    SET remaining = totalYears - yearsServed;

    RETURN IF(remaining < 0, 0, remaining);

END //

DELIMITER ;


-- Test the function

SELECT
    inmate_id,
    first_name,
    last_name,
    sentence_years,
    GetYearsRemaining(inmate_id) AS years_remaining
FROM Mdze_Inmates;


-- =====================================================================
-- 4b. CURSOR: ShowInmatePrograms
-- =====================================================================
-- Processes inmate program records one row at a time.

DELIMITER //

CREATE PROCEDURE ShowInmatePrograms()
BEGIN

    DECLARE done INT DEFAULT 0;
    DECLARE inmateName VARCHAR(100);
    DECLARE programName VARCHAR(100);

    DECLARE cur CURSOR FOR
        SELECT
            CONCAT(i.first_name, ' ', i.last_name),
            p.program_name
        FROM Mdze_Inmates i
        JOIN Mdze_Programs p
            ON i.inmate_id = p.inmate_id;

    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = 1;

    OPEN cur;

    read_loop: LOOP

        FETCH cur INTO inmateName, programName;

        IF done THEN
            LEAVE read_loop;
        END IF;

        SELECT CONCAT(
            'Inmate: ',
            inmateName,
            ' | Program: ',
            programName
        ) AS record;

    END LOOP;

    CLOSE cur;

END //

DELIMITER ;


-- Test the cursor

CALL ShowInmatePrograms();


-- =====================================================================
-- 4c. EVENT: CleanOldVisits
-- =====================================================================
-- Runs once per day and removes visit records older than one year.

SET GLOBAL event_scheduler = ON;

DELIMITER //

CREATE EVENT CleanOldVisits
ON SCHEDULE EVERY 1 DAY
DO
BEGIN

    DELETE FROM Mdze_Visits
    WHERE visit_date < CURDATE() - INTERVAL 1 YEAR;

END //

DELIMITER ;


-- Confirm that the event exists

SHOW EVENTS FROM Mdze_219080682;