# Traffic Monitoring Database

## Description
This project implements a SQL database to manage vehicle and camera data for monitoring traffic in a restricted zone. 
It allows tracking vehicles, checking permits, and calculating time intervals between permit issuance and first camera captures.

## Database Structure
The database includes the following tables:

- `camera`: information about cameras (ID and perimeter type)
- `keeper`: citizen details (ID, name and address)
- `vehicle`: vehicle information (ID, keeper)
- `image`: records of vehicle photos taken by cameras(camera, when and reg)
- `permit`: vehicle permits for restricted zone entry (reg, date and charge type with allows valius 'daily', 'weekly' and 'monthly')

## How to Run
1. Create a PostgreSQL database.
2. Run the SQL script to create tables and insert sample data.
3. Execute the queries to see results.

## Notes
- All timestamps are in `YYYY-MM-DD HH:MM:SS` format.
- Queries make use of runtime views, EXISTS operator, and time calculations.
- The project is intended for educational purposes or traffic monitoring simulations.
