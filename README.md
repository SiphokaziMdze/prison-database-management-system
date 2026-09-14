# Prison Management Database

A MySQL/MariaDB database project developed as part of the GA9 Advanced SQL Queries assessment.

The project demonstrates advanced SQL techniques using a prison management system, including window functions, stored procedures, triggers, functions, cursors, and scheduled events.

## Database Overview

**Database Name:** `Mdze_219080682`

| Table | Purpose |
|---|---|
| `Mdze_Inmates` | Stores inmate personal details, crimes, sentences, and cell assignments |
| `Mdze_Cells` | Stores cell blocks, capacity, security level, and current occupancy |
| `Mdze_Guards` | Stores prison staff information |
| `Mdze_Visits` | Stores inmate visitation records |
| `Mdze_Programs` | Stores rehabilitation programme enrolment records |

## Advanced SQL Features

### Window Functions

Window functions allow calculations to be performed across related rows without combining them into a single grouped result.

This project demonstrates:

- **`RANK()`** - ranks inmates by sentence length within each cell block.
- **`ROW_NUMBER()`** - assigns a unique position to inmates based on their admission date within each block.

See [`sql/03_window_functions.sql`](sql/03_window_functions.sql).

### Stored Procedure

`AddInmateAndUpdateCell` adds a new inmate and automatically increases the occupancy count of the selected cell.

This combines two related database operations into one reusable procedure.

See [`sql/04_stored_procedure.sql`](sql/04_stored_procedure.sql).

### Trigger

`after_inmate_delete` automatically decreases a cell's occupancy when an inmate is deleted.

The trigger uses `OLD.cell_id` to identify the cell previously assigned to the deleted inmate.

See [`sql/05_trigger.sql`](sql/05_trigger.sql).

### Function

`GetYearsRemaining()` calculates the estimated number of years remaining on an inmate's sentence based on their admission date and sentence length.

See [`sql/06_function_cursor_event.sql`](sql/06_function_cursor_event.sql).

### Cursor

`ShowInmatePrograms()` uses a cursor to process inmate rehabilitation programme records one row at a time.

See [`sql/06_function_cursor_event.sql`](sql/06_function_cursor_event.sql).

### Scheduled Event

`CleanOldVisits` is a scheduled MySQL event that runs daily and removes visit records older than one year.

See [`sql/06_function_cursor_event.sql`](sql/06_function_cursor_event.sql).

## Project Structure

```text
prison-database-management-system/
│
├── sql/
│   ├── 01_schema.sql
│   ├── 02_seed_data.sql
│   ├── 03_window_functions.sql
│   ├── 04_stored_procedure.sql
│   ├── 05_trigger.sql
│   └── 06_function_cursor_event.sql
│
├── REFLECTION.md
├── REFERENCES.md
└── README.md