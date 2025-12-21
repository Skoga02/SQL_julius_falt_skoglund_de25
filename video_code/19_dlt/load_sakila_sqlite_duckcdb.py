import dlt 
from dlt.sources.sql_database import sql_database 
from pathlib import Path

# Shows where the duckdb and sqlite files should be created. 
DATA_PATH = Path(__file__).parent / "data" 
SQLITE_PATH = DATA_PATH / "sqlite-sakila.db"
DUCKDB_PATH = DATA_PATH / "sakila.duckdb"

# Creates a Data Loading Tool, to read tables from the SQLite file.
source = sql_database(credentials=f"sqlite:///{SQLITE_PATH}", schema="main")

# Creates the name pipline and makes all tables to be arenged under staging. (ex. staging.customer)
pipeline = dlt.pipeline(pipeline_name="sakila_sqlite_duckkdb", 
                        destination=dlt.destinations.duckdb(str(DUCKDB_PATH)),
                        dataset_name="staging")


# Runs dlt-pipline and replaces the old data with the new data everytime it runs.
load_info = pipeline.run(source, write_disposition="replace")

# load contains the metadata, that might be tables, rows, if the run failed or succeded and eventual errors.
print(load_info)
