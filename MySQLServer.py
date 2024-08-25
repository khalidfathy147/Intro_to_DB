import mysql.connector

# Database credentials
config = {
  'user': 'your_username',
  'password': 'your_password',
  'host': 'your_host',
  'port': 'your_port',  # If not using default port (3306), set it here
}

# Create the database if it doesn't exist
try:
    conn = mysql.connector.connect(**config)
    cursor = conn.cursor()
    cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
    conn.commit()
    print("Database 'alx_book_store' created successfully!")

except mysql.connector.Error as err:
    print(f"Error connecting to MySQL: {err}")

finally:
    if conn:
        cursor.close()
        conn.close()