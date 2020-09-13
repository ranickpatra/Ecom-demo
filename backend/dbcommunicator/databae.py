import mysql.connector

TABLE_CUSTMAST = 'custmast'

TABLE_PRODMAST = 'prodmast'
TABLE_UNITMAST = 'unitmast'
TABLE_CASTGMAST = 'castgmast'
TABLE_EMPLMAST = 'emplmast'
TABLE_UNITMAST = 'unitmast'

TABLE_ORDERMAST = 'ordermast'
TABLE_ORDERDETL = 'orderdetl'


class DATABSE:
    def __init__(self):
        db = mysql.connector.connect(
            host="127.0.0.1",
            user="ecom_usr",
            password="1234",
            database="ecom"
        )
        self.db = db
        self.cursor = db.cursor()


    # connection with database
    def get_DATABASE(self):
        return self.db

    # get database cursor
    def get_CURSOR(self):
        return self.cursor

    # initilize and create tables and database
    def init(self):
        self.cursor.execute('SHOW TABLES')
        tables_name = []        
        for x in self.cursor:
            tables_name.append(x[0])
        
        if TABLE_CUSTMAST not in tables_name:
            self.cursor.execute(f"CREATE TABLE {TABLE_CUSTMAST} (CustCode char(6) NOT NULL PRIMARY KEY CLUSTERED, CustName VARCHAR(50), CustCont VARCHAR(10), CustAddr VARCHAR(250), CustGST VARCHAR(25), CustEmail VARCHAR(50), CustPwd VARCHAR(10), RegDate DATE, CustStat CHAR(3))")
        
        # if TABLE_PRODUCTS not in tables_name:
        #     self.cursor.execute(f"CREATE TABLE {TABLE_PRODUCTS} (id INT AUTO_INCREMENT PRIMARY KEY, sku VARCHAR(255), name VARCHAR(500), price VARCHAR(255), desc VARCHAR(10000), )")
