from apscheduler.schedulers.background import BlockingScheduler
import shutil
import os
import sys
from datetime import date

def update_database_job():
    today = date.today().strftime('%Y-%m-%d')
    new_dst_dir = os.path.join(os.environ['BACKUP_DIR'], today)
    shutil.copytree(os.environ['BBDD_PATH'], new_dst_dir)
    print(f"Backup executed in {new_dst_dir} from {os.environ['BBDD_PATH']} in {date.today()}")


# Crea un planificador
scheduler = BlockingScheduler()
scheduler.add_job(update_database_job, 'interval', seconds=5)
scheduler.start()
