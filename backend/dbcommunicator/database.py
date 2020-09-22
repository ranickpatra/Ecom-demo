import mysql.connector

TABLE_CUSTMAST = 'custmast'

TABLE_PRODMAST = 'prodmast'
TABLE_UNITMAST = 'unitmast'
TABLE_CASTGMAST = 'castgmast'
TABLE_EMPLMAST = 'emplmast'

TABLE_ORDERMAST = 'ordermast'
TABLE_ORDERDETL = 'orderdetl'


class DATABSE:
    def __init__(self):
        self.db = mysql.connector.connect(
            host="127.0.0.1",
            user="ecom_usr",
            password="1234",
            database="ecom"
        )
        self.cursor = self.db.cursor()


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
            self.cursor.execute(f"CREATE TABLE {TABLE_CUSTMAST} (CustCode INT NOT NULL PRIMARY KEY AUTO_INCREMENT, CustName VARCHAR(50), CustCont VARCHAR(10), CustAddr VARCHAR(250), CustGST VARCHAR(25), CustEmail VARCHAR(50), CustPwd VARCHAR(10), RegDate DATE, CustStat CHAR(3))")
        
        if TABLE_PRODMAST not in tables_name:
            self.cursor.execute(f"CREATE TABLE {TABLE_PRODMAST} (ProdCode INT NOT NULL PRIMARY KEY AUTO_INCREMENT, ProdTag VARCHAR(15), ProdDesc VARCHAR(100), PurRate DECIMAL(18,0), SalesRate DECIMAL(18,0), MaxDisc DECIMAL(18,0), ProdCatg CHAR(3), UnitCode CHAR(3), ProdStat CHAR(3), ImgUrl VARCHAR(200))")
        
        if TABLE_UNITMAST not in tables_name:
            self.cursor.execute(f"CREATE TABLE {TABLE_UNITMAST} (UnitCode INT NOT NULL PRIMARY KEY AUTO_INCREMENT, UnitDesc VARCHAR(25), UnitStat CHAR(3))")
        
        if TABLE_CASTGMAST not in tables_name:
            self.cursor.execute(f"CREATE TABLE {TABLE_CASTGMAST} (CatgCode INT NOT NULL PRIMARY KEY AUTO_INCREMENT, CatgDesc VARCHAR(25), CatgStat CHAR(3))")
        
        if TABLE_ORDERMAST not in tables_name:
            self.cursor.execute(f"CREATE TABLE {TABLE_ORDERMAST} (OrderNo CHAR(15), OrderDt DATETIME, CustCode CHAR(6), OrderAmt DECIMAL(18,0), DiscAmt DECIMAL(18,0), OthChgsAmt DECIMAL(18,0), NetAmt DECIMAL(18,0))")
        
        if TABLE_ORDERDETL not in tables_name:
            self.cursor.execute(f"CREATE TABLE {TABLE_ORDERDETL} (OrderNo CHAR(15), SLNo INT NOT NULL PRIMARY KEY AUTO_INCREMENT, ProdCode CHAR(6), Quantity DECIMAL(18,0), Rate DECIMAL(18,0), Amount DECIMAL(18,0), DiscAmt DECIMAL(18,0), OrderCancelStat CHAR(3), OrderCancelDate DATETIME, OrderAcptDate DATETIME, OrderRejDate DATETIME, OrderRejReason VARCHAR(50), OrderDispDate DATETIME, OrderDelvDate DATETIME, OrderRecdDate DATETIME, OrderStat CHAR(3))")


    def query_select(self, q):
        self.cursor.execute(q)
        return self.cursor.fetchall()

        
