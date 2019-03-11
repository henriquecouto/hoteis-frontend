import os
import requests
import json
from bson.json_util import dumps
from bottle import Bottle, template, request

root = Bottle()

base_url = 'http://localhost:8080'
views = './src/views/'


@root.get('/')
def showUsers():
    req = requests.get(base_url+'/clientes')
    result = req.json()['result']
    return template(views+'users.tpl', clientes=result)


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

    return template(views+'user.tpl', cliente=cliente, reservas=reservas)


@root.get('/reservas/criar')
def newReserva():
    return template(views+'criar-reserva.tpl', base_url=base_url, success=False, error=None)


@root.post('/reservas/criar')
def newReserva():
    reserva = json.loads(dumps(request.forms))

    if(reserva['cliente'] == ''):
        return template(views+'criar-reserva.tpl', base_url=base_url, success=False, error='Voce precisa informar um cliente')

    elif reserva['quarto'] == '':
        return template(views+'criar-reserva.tpl', base_url=base_url, success=False, error='Voce precisa informar um quarto')

    elif reserva['hospedes'] == '':
        return template(views+'criar-reserva.tpl', base_url=base_url, success=False, error='Voce precisa informar a quantidade de hóspedes')

    elif reserva['entrada'] == '':
        return template(views+'criar-reserva.tpl', base_url=base_url, success=False, error='Voce precisa informar uma data prevista para entrada')

    elif reserva['saida'] == '':
        return template(views+'criar-reserva.tpl', base_url=base_url, success=False, error='Voce precisa informar uma data prevista para saída')

    reserva['cliente'] = int(reserva['cliente'])
    reserva['quarto'] = int(reserva['quarto'])
    reserva['hospedes'] = int(reserva['hospedes'])

    entrada = reserva['entrada'].split('-')
    reserva['entrada'] = int(entrada[0]+entrada[1]+entrada[2])

    saida = reserva['saida'].split('-')
    reserva['saida'] = int(saida[0]+saida[1]+saida[2])

    req = requests.post(base_url+'/reservas', json=reserva)

    resposta = json.loads(req.content)

    if resposta['result'] == 'Reserva Criada':
        return template(views+'criar-reserva.tpl', base_url=base_url, success=True, error=None)
    else:
        return template(views+'criar-reserva.tpl', base_url=base_url, success=False, error=resposta['result'])


if os.environ.get('APP_LOCATION') == 'heroku':
    root.run(host="0.0.0.0", port=int(os.environ.get("PORT", 5000)))
else:
    root.run(host='localhost', port=8081, debug=True, reloader=True)
