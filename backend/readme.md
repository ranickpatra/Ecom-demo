# DEMO ECOM APP FLUTTER WITH SQL SERVER 
----------------------

## App login detaile
user email: test@gmail.com

user password: 1234

------------------

## Database details

**db ports:**
db port: 3306

phpmyadmin port: 8080

    - user: root
    - pass: toor


**db connection details:**
    
    - user: ecom_usr
    - pass: 1234
    - database: ecom

----------------

## docker sql server start 

```
docker-compose up -d
npm install
node api.js
```
----------------

## API end point

**Login:**
`http://localhost:8000/login?email=EMAIL_ADDRESS&pass=PASSWORD`

**Products:**
`http://localhost:8000/products`

**Single Product By Product Code:**
`http://localhost:8000/product?prod_code=PRODUCT_CODE`

**Add to Cart**
`http://localhost:8000/add-cart?cust_code=CUSTOMER_CODE&prod_code=PRODUCT_CODE&order_amt=ORDER_AMMOUNT&net_amt=NET_AMMOUNT`

**Show All Orders**
`localhost:8000/orders?cust_code=CUSTOMER_CODE`

