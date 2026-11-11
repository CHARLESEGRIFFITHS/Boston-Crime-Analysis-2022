# Boston Crime Incidents 2022 — SQL Analysis

A SQL analysis of Boston Police Department crime incident reports for 2022: what kinds of incidents were reported, where, and when.

## The data

Public open data from the Boston Police Department — Crime Incident Reports, 2022. One row per reported incident.

- **73,852 incidents**, January 1 to December 31, 2022
- **120 offense types**, **13 districts**
- Columns include incident number, offense code and description, district, reporting area, shooting flag, date and time, day of week, hour, street, and latitude/longitude
- 3,808 records have no coordinates

## Questions and findings

**What were the most common offenses?**
INVESTIGATE PERSON led with 8,070 incidents, followed by SICK ASSIST (5,484) and M/V – LEAVING SCENE – PROPERTY DAMAGE (4,562). Sixteen offense types had more than 1,500 incidents each; 87 types had fewer than 500.

**Where did incidents happen?**
District B2 recorded the most (10,031), then D4 (9,592) and C11 (9,136). The busiest street was Washington St (5,942 incidents), followed by Gibson St (2,670) and Harrison Ave (2,655).

**When did incidents happen?**
Midnight was the busiest hour (5,704 incidents); 4am was the quietest (767). INVESTIGATE PERSON incidents peaked on Friday (1,288) and were lowest on Sunday (975).

**Shootings**
733 incidents in 2022 involved a shooting.

## How to run it

Load the CSV into SQLite, then run the queries in `analysis.sql`.

In DB Browser for SQLite: File → Import → Table from CSV, choose `data/boston-crime-incidents-2022.csv`, name the table `incidents`, then open the Execute SQL tab and run `analysis.sql`.

From the command line:

```bash
sqlite3 boston-crime.db
sqlite> .mode csv
sqlite> .import data/boston-crime-incidents-2022.csv incidents
sqlite> .read analysis.sql
```

## Files

- `analysis.sql` — the queries, each written under the question it answers
- `data/boston-crime-incidents-2022.csv` — the full dataset (73,852 rows)

## Skills

SQL (SQLite) · `SELECT` · `WHERE` · `GROUP BY` · `HAVING` · `ORDER BY` · `COUNT`
