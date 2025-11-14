# cse4020-Final-Project

Final Project for Database Systems

## Phase 1: Create the local database on your machine

Prerequisites:
- MySQL Server installed and running
- MySQL client (`mysql`) available in your terminal

Steps:
1. Clone this repo and navigate into it in your terminal:
   - `cd /path/to/cse4020-Final-Project`
2. Start MySQL with local infile enabled:
   - `mysql --local-infile=1 -u root` (add `-p` if you use a password)
3. In the `mysql>` prompt, enable local infile on the server (if needed):
   - `SET GLOBAL local_infile = 1;`
4. Find the full path to the repo (from a normal terminal, not inside MySQL):
   - Run `pwd` while in the repo folder and note the path.
5. Open `phase1_create_and_load.sql` and replace:
   - `'/ABSOLUTE/PATH/TO/REPO/CompanyDataClean.csv'`
   with your actual path, for example:
   - `'/Users/yourname/path/to/cse4020-Final-Project/CompanyDataClean.csv'`
6. Back in the `mysql>` prompt, run the Phase 1 script:
   - `SOURCE /full/path/to/cse4020-Final-Project/phase1_create_and_load.sql;`
7. Verify the data loaded:
   - `USE company_db;`
   - `SELECT COUNT(*) FROM company_raw;`

This lets each team member create their own local instance of the project database using the same CSV and SQL script.
