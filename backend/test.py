import mysql.connector

mydb = mysql.connector.connect(
  host="127.0.0.1",
  user="ecom_usr",
  password="1234",
  database="mydatabase"
)

mycursor = mydb.cursor()

# mycursor.execute("CREATE TABLE customers (name VARCHAR(255), address VARCHAR(255))")


mycursor.execute("SELECT * FROM customers")

myresult = mycursor.fetchall()

for x in myresult:
  print(x)

