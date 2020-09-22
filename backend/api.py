from flask import Flask, jsonify
from flask import request
from dbcommunicator import database
from datetime import datetime

db = database.DATABSE()
db.init()

app = Flask(__name__)

@app.route('/')
def root():
    return ''

@app.route('/prod')
def product():
    query = "SELECT ProdCode, ProdDesc, PurRate, ImgUrl FROM {table}".format(table=database.TABLE_PRODMAST)
    result = db.query_select(query)
    data = []
    for res in result:
        r = {}
        r['prodCode'] = res[0]
        r['desc'] = res[1]
        r['purRate'] = int(res[2])
        r['url'] = res[3]
        data.append(r)
        
    return jsonify(data)

@app.route('/place-order', methods = ['GET'])
def palce_order():
    query = '''INSERT INTO {table} (OrderDt, CustCode, OrderAmt, NetAmt)
                                    VALUE({date}, {cust_code}, {ord_amt}, {nt_amt})'''.format(
                                        table=database.TABLE_ORDERMAST,
                                        date=datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
                                        cust_code='',
                                        ord_amt='',
                                        nt_amt='')
    
    db.get_CURSOR().execute('INSERT INTO {table} (CustCode, OrderAmt, NetAmt) VALUES(%s, %s, %s)'.format(table=database.TABLE_ORDERMAST),
                                                (10, 50, 50))
            
    return 'done...'






if __name__ == '__main__':
    app.run(port=8000, debug=True)

