import psycopg2

USER = "postuser"
PASSWORD = "postmammothera"
HOST = "postgres"           # This should be the name of the PostgreSQL service in your Docker Compose file
PORT = "5432"
DATABASE = "postairline"

QUERY1 =    """ SELECT * FROM airports"""

QUERY2 =    """ SELECT * FROM people"""

QUERY3 =    """ SELECT * FROM flights"""

QUERY4 =    """ SELECT * FROM passengers"""


def show_all_entries(cursor, query: str):
    cursor.execute(query)
    records = cursor.fetchall()
    for record in records:
        print(record)


def main():
    try:
        # Connect to the PostgreSQL database
        with psycopg2.connect(
            user=USER,
            password=PASSWORD,
            host=HOST,
            port=PORT,
            database=DATABASE,
        ) as connection:
            with connection.cursor() as cursor:
                # Execute your queries here
                show_all_entries(cursor, QUERY1)
                show_all_entries(cursor, QUERY2)
                show_all_entries(cursor, QUERY3)
                show_all_entries(cursor, QUERY4)

    except (Exception, psycopg2.Error) as error:
        print("Error while connecting to PostgreSQL", error)


if __name__ == "__main__":
    main()
