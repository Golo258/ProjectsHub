import psycopg2
from config import config
from pathlib import Path


class PostgreSQLDatabase:
    def __init__(self, queries_files_dict):
        self.params = config()
        self.connection = None
        self.init_connection()
        self.queries_files_dict = queries_files_dict

    def init_connection(self):
        try:
            if not self.connection:
                self.connection = psycopg2.connect(**self.params)
            with psycopg2.connect(**self.params) as conn:
                print("Connected successfully to PostgreSQL server")
                self.connection = conn
        except Exception as error:
            assert f"Error occured while connecting to db {error}"

    def disconnect(self):
        if self.connection:
            self.connection.close()

    def get_sql_file_queries(self, file_key):
        spec_file = self.queries_files_dict[file_key]
        if Path(spec_file).suffix == ".sql":
            with open(spec_file, "r") as file:
                queries = file.read()
                return queries
        else:
            assert "Wrong type of file"

    def get_sub_query(self, queries, fun_use):
        sub_query = []
        is_multiple_line_query = False
        for line in queries.splitlines():
            current_line = line.strip()
            if (current_line.startswith("-- QUERY")
                    and fun_use in current_line
                    or is_multiple_line_query):
                is_multiple_line_query = True if not current_line.endswith(";") else False
                sub_query.append(current_line)

        return "\n".join(sub_query)

    def perform_query(self, query, params=None, return_required=False):
        try:
            cursor = self.connection.cursor()
            cursor.execute(query, params)
            if return_required:
                fetch_result = cursor.fetchall()
                return fetch_result
            else:
                self.connection.commit()
            cursor.close()
        except Exception as error:
            assert f"Error executing query {error}"


if __name__ == "__main__":
    query_files = {
        "crud": "crud_operation.sql"
    }
    queries_fun = {
        "CREATE": "create_table",
        "INSERT": "insert_data",
        "SELECT": ["select_all", True],
    }
    db = PostgreSQLDatabase(query_files)
    queries = db.get_sql_file_queries("crud")

    for operation in queries_fun.values():
        if isinstance(operation,list):
            sub_query = db.get_sub_query(queries, operation[0])
            result = db.perform_query(sub_query, return_required=operation[1])
            print(result)
        else:
            sub_query = db.get_sub_query(queries, operation)
            result = db.perform_query(sub_query)
