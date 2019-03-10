import os
import requests
from bottle import Bottle, template

root = Bottle()

base_url = 'http://localhost:8080'


@root.get('/')
def showUsers():
    req = requests.get(base_url+'/clientes')
    result = req.json()['result']
    return template('./src/views/users.tpl', clientes=result)


@root.get('/user/<codigo>')
def infoUser(codigo):
    req = requests.get(base_url+'/clientes/codigo/'+str(codigo))
    result = req.json()['results']

    cliente = {
        'nome': result['nome'],
        'codigo': result['codigo'],
        'contato': result['contato']
    }
    reservas = result['reservas']

    return template('./src/views/user.tpl', cliente=cliente, reservas=reservas)


if os.environ.get('APP_LOCATION') == 'heroku':
    root.run(host="0.0.0.0", port=int(os.environ.get("PORT", 5000)))
else:
    root.run(host='localhost', port=8081, debug=True, reloader=True)
