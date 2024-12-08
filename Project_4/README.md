Commands Used in the Project:

1. PostgreSQL Installation and Setup

* Install PostgreSQL: `sudo pacman -S postgresql`

* Initialize PostgreSQL database: `sudo -iu postgres initdb -D /var/lib/postgres/data`

* Start PostgreSQL service: `sudo systemctl start postgresql`

* Enable PostgreSQL to start on boot: `sudo systemctl enable postgresql`

* Access PostgreSQL shell: `sudo -iu postgres psql`

* Create a new database: `CREATE DATABASE my_database;`

* Exit PostgreSQL shell: `\q`

2. Python Virtual Environment Setup

* Create a virtual environment: `python -m venv ~/Zero_To_Devops/Project_4/venv`

* Activate the virtual environment: `source ~/Zero_To_Devops/Project_4/venv/bin/activate`

* Install psycopg2 in the virtual environment: `pip install psycopg2`

* Save dependencies to a requirements file: `pip freeze > ~/Zero_To_Devops/Project_4/requirements.txt`

3. Cron Setup

* Install cronie (cron daemon): `sudo pacman -S cronie`

* Enable and start cron service: `sudo systemctl enable cronie`
`sudo systemctl start cronie`

* Edit cron jobs: `crontab -e`

* Check existing cron jobs: `crontab -l`

4. Cron Job Debugging and Logs

* Check cron service logs: `sudo journalctl -u cronie`

* Debug cron job output: `cat /tmp/cron_debug.log`

* View custom log file: `cat ~/Zero_To_Devops/Project_4/backups/cron.log`

5. File and Permission Management

* Check directory permissions: `ls -ld ~/Zero_To_Devops/Project_4`

* Change directory permissions: `chmod 755 ~/Zero_To_Devops/Project_4`
