import psycopg2
from config import config


def get_query(file_name):
    if ".sql" in file_name:
        with open(file_name, "r") as sql_file:
            query = sql_file.read()
            return query
    else:
        assert "Wrong type of file"


class PostgreSQLDatabase:
    def __init__(self):
        self.params = config()
        self.connection = None
        self.init_connection()
        self.cursor = self.connection.cursor()

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

    def execute_query(self, query, params=None):
        try:
            self.cursor.execute(query, params)
            self.connection.commit()
            self.cursor.close()
        except Exception as error:
            assert f"Error executing query {error}"


if __name__ == "__main__":
    db = PostgreSQLDatabase()
    query = get_query("crud_operation.sql")
    result = db.execute_query(query)
    print(result)
