-- =====================================================================
-- Question 1 - Advanced Query: Window Functions
-- =====================================================================

USE Mdze_219080682;


-- ---------------------------------------------------------------------
-- 1a. RANK()
-- Ranks inmates by sentence length within each cell block.
-- The ranking restarts for each block.
-- ---------------------------------------------------------------------

SELECT
    i.inmate_id,
    i.first_name,
    i.last_name,
    i.sentence_years,
    c.block,
    RANK() OVER (
        PARTITION BY c.block
        ORDER BY i.sentence_years DESC
    ) AS sentence_rank_in_block
FROM Mdze_Inmates i
JOIN Mdze_Cells c
    ON i.cell_id = c.cell_id;


-- ---------------------------------------------------------------------
-- 1b. ROW_NUMBER()
-- Numbers inmates by seniority within each cell block.
-- The earliest admission date receives number 1.
-- Each inmate receives a unique number.
-- ---------------------------------------------------------------------

SELECT
    i.inmate_id,
    i.first_name,
    i.last_name,
    c.block,
    TIMESTAMPDIFF(
        YEAR,
        i.date_admitted,
        CURDATE()
    ) AS years_served,
    ROW_NUMBER() OVER (
        PARTITION BY c.block
        ORDER BY i.date_admitted ASC
    ) AS seniority_rank
FROM Mdze_Inmates i
JOIN Mdze_Cells c
    ON i.cell_id = c.cell_id;