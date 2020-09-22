const { query } = require('express');
const express = require('express');
const mysql = require('mysql');

const app = express();

const TABLE_CUSTMAST = 'custmast';

const TABLE_PRODMAST = 'prodmast';
const TABLE_UNITMAST = 'unitmast';
const TABLE_CASTGMAST = 'castgmast';
const TABLE_EMPLMAST = 'emplmast';

const TABLE_ORDERMAST = 'ordermast';
const TABLE_ORDERDETL = 'orderdetl';

let config = {
    host: 'localhost',
    user: 'ecom_usr',
    password: '1234',
    database: 'ecom'
}

let connection = mysql.createConnection(config);

// initilize database
function init(conn) {
    conn.connect(err => {
        if (err)
            return console.error('error: ' + err.message);
        console.log('Connected to the MySQL server');
    });
    conn.query('SHOW TABLES', (err, res) => {
        if (err) throw err;
        // fetch table 
        let tables_name = [];
        res.forEach(element => {
            tables_name.push(element[Object.keys(element)[0]]);
        });

        if (tables_name.indexOf(TABLE_CUSTMAST) < 0)
            conn.query("CREATE TABLE " + TABLE_CUSTMAST + " (CustCode INT NOT NULL PRIMARY KEY AUTO_INCREMENT, CustName VARCHAR(50), CustCont VARCHAR(10), CustAddr VARCHAR(250), CustGST VARCHAR(25), CustEmail VARCHAR(50), CustPwd VARCHAR(10), RegDate DATE, CustStat CHAR(3))", (err, res) => { if (err) throw err; });

        if (tables_name.indexOf(TABLE_PRODMAST) < 0)
            conn.query("CREATE TABLE " + TABLE_PRODMAST + " (ProdCode INT NOT NULL PRIMARY KEY AUTO_INCREMENT, ProdTag VARCHAR(15), ProdDesc VARCHAR(100), PurRate DECIMAL(18,0), SalesRate DECIMAL(18,0), MaxDisc DECIMAL(18,0), ProdCatg CHAR(3), UnitCode CHAR(3), ProdStat CHAR(3), ImgUrl VARCHAR(200))", (err, res) => { if (err) throw err; });

        if (tables_name.indexOf(TABLE_UNITMAST) < 0)
            conn.query("CREATE TABLE " + TABLE_UNITMAST + " (UnitCode INT NOT NULL PRIMARY KEY AUTO_INCREMENT, UnitDesc VARCHAR(25), UnitStat CHAR(3))", (err, res) => { if (err) throw err; });

        if (tables_name.indexOf(TABLE_CASTGMAST) < 0)
            conn.query("CREATE TABLE " + TABLE_CASTGMAST + " (CatgCode INT NOT NULL PRIMARY KEY AUTO_INCREMENT, CatgDesc VARCHAR(25), CatgStat CHAR(3))", (err, res) => { if (err) throw err; });

        if (tables_name.indexOf(TABLE_ORDERMAST) < 0)
            conn.query("CREATE TABLE " + TABLE_ORDERMAST + " (OrderNo INT NOT NULL PRIMARY KEY AUTO_INCREMENT, OrderDt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, CustCode CHAR(6), ProdCode INT, OrderAmt DECIMAL(18,0), DiscAmt DECIMAL(18,0), OthChgsAmt DECIMAL(18,0), NetAmt DECIMAL(18,0))", (err, res) => { if (err) throw err; });

        if (tables_name.indexOf(TABLE_ORDERDETL) < 0)
            conn.query("CREATE TABLE " + TABLE_ORDERDETL + " (OrderNo INT NOT NULL, SLNo INT NOT NULL PRIMARY KEY AUTO_INCREMENT, ProdCode CHAR(6), Quantity DECIMAL(18,0), Rate DECIMAL(18,0), Amount DECIMAL(18,0), DiscAmt DECIMAL(18,0), OrderCancelStat CHAR(3), OrderCancelDate DATETIME, OrderAcptDate DATETIME, OrderRejDate DATETIME, OrderRejReason VARCHAR(50), OrderDispDate DATETIME, OrderDelvDate DATETIME, OrderRecdDate DATETIME, OrderStat CHAR(3))", (err, res) => { if (err) throw err; });

    });

}
// init
init(connection);


// root 
app.get('/', (req, res) => {
    res.end('');
});

// login
app.get('/login', (req, res) => {
    let query = "select * from "+TABLE_CUSTMAST+" where CustEmail = '"+req.query.email+"' and CustPwd = '"+req.query.pass+"'";

    connection.query(query, (err, result) => {
        if (err) return res.json({'stat': false});
        res.json({
            'stat': result.length != 0
        });
    });
});


// products
app.get('/products', (req, res) => {
    let query = "select * from "+TABLE_PRODMAST;

    connection.query(query, (err, result) => {
        if (err) return res.json({});
        res.json(result);
    });
});

// product
app.get('/product', (req, res) => {
    let query = "select * from "+TABLE_PRODMAST+" where ProdCode = '"+req.query.prod_code+"'";

    connection.query(query, (err, result) => {
        if (err) return res.json({});
        res.json(result);
    });
});

// add to cart
app.get('/add-cart', (req, res) => {
    let query = "insert into "+TABLE_ORDERMAST+" (CustCode, ProdCode, OrderAmt, NetAmt) "+
                                        "values ("+req.query.cust_code+", "+req.query.prod_code+", "+req.query.order_amt+", "+req.query.net_amt+")";
    

    connection.query(query, (err, result) => {
        if (err) return res.json({
            'stat': false
        });
        res.json({
            'stat': true
        })        
    });
});


// add to cart
app.get('/orders', (req, res) => {
    let query = "select CustCode, ProdCode, OrderAmt, NetAmt from "+TABLE_ORDERMAST+" where CustCode = '"+ req.query.cust_code +"'";
    

    connection.query(query, (err, result) => {
        if (err) throw err; //return res.json({});
        res.json(result)        
    });
});




app.listen(port=8000);
