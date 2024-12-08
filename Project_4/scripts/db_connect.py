import psycopg2

def connect_to_db():
    try:
        connection = psycopg2.connect(
            database="my_project_db",
            user="postgres",
            password="your_password",
            host="localhost",
            port="5432"
        )
        print("Connected to the database!")
        return connection
    except Exception as error:
        print(f"Error: {error}")
        return None

if __name__ == "__main__":
    conn = connect_to_db()
    if conn:
        conn.close()
