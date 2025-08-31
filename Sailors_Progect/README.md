# Sailors Database Project

## Overview
This project demonstrates the creation, management, and querying of a relational database for sailors, boats, marinas, and boat reservations. It covers a variety of SQL concepts including table creation, data insertion, updates, deletions, JOINs, aggregate functions, and more.

The project is based on the `Sailors_Example_DDL_UTF8.sql` schema.

## Database Schema
The database contains the following main tables:

- `sailor`: Stores information about sailors (sid, name, rating, age).  
- `boat`: Stores information about boats (bid, name, color).  
- `marina`: Stores information about marinas (mid, name, capacity).  
- `reservation`: Tracks reservations made by sailors for boats at marinas.  
- `typos`: (Extended table) Stores boat types and descriptions.

## Key Skills Demonstrated
- SQL DDL: `CREATE TABLE`, `ALTER TABLE`, defining primary and foreign keys.  
- CRUD operations: `INSERT`, `UPDATE`, `DELETE`.  
- Advanced queries: `JOIN`, `EXCEPT`, `DISTINCT`, aggregate functions (`AVG`, `SUM`, `MIN`, `MAX`).  
- Data integrity and relational dependencies.  
- Query optimization and clean formatting.
  
## How to Use
1. Install a relational database system (PostgreSQL or MySQL recommended).  
2. Run the scripts in order from `01_create_schema_sailors_table.sql` to subsequent exercises.  
3. Observe the database changes and query results.
