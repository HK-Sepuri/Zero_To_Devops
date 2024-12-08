import os
import subprocess
from datetime import datetime

def backup_database():
    db_name = "my_project_db"
    backup_dir = "/home/hari/Zero_To_Devops/Project_4/backups"  # Adjust if needed
    os.makedirs(backup_dir, exist_ok=True)

    # Create a timestamped backup filename
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    backup_file = os.path.join(backup_dir, f"{db_name}_backup_{timestamp}.sql")

    try:
        # Run the pg_dump command
        subprocess.run(
            ["pg_dump", "-U", "postgres", "-d", db_name, "-F", "c", "-f", backup_file],
            check=True
        )
        print(f"Backup successful: {backup_file}")
    except subprocess.CalledProcessError as e:
        print(f"Backup failed: {e}")
    except Exception as e:
        print(f"Unexpected error: {e}")

if __name__ == "__main__":
    backup_database()
