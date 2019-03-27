import os
import requests
import json
import datetime
from bson.json_util import dumps
from bottle import Bottle, template, request, static_file

root = Bottle()

base_url = 'https://hoteltop.herokuapp.com'
# base_url = 'http://localhost:8080'
views = './src/views/'
static = './src/static'

def changeReservaStatus(request):
    error = None

    if(request.method == 'POST'):
        alteracao = json.loads(dumps(request.forms))
        alteracoes = {'status': alteracao['status']}
        error = alteracoes['status'] + ' realizado com sucesso!'

        if(alteracao['status'] == 'Check-In'):
            if(alteracao['hospedes'] == ''):
                return "Você precisa informar o número de hospedes"
            alteracoes['hospedes'] = int(alteracao['hospedes'])

        # tipoData = 'entrada' if alteracao['status']=='Check-In' else 'saida'

        if(alteracao['status'] == 'Check-Out'):
            if(alteracao['saida'] == ''):
                return "Você precisa informar uma data"

            date = alteracao['saida']
            date = date.split('-')
            date = date[0]+date[1]+date[2]
            alteracoes['saida'] = int(date)

        real_alteracao = {
            "_id": alteracao['_id'],
            "alteracoes": alteracoes
        }
        
        res = requests.put(base_url+'/reservas', json=real_alteracao)

        if(res and res.json()['result'] == False):
            error = "Erro: "+res.json()['message']

    return error

@root.get('/static/logo')
def getLogo():
    return static_file('logo.png', root=static)

@root.get('/style')
def getLogo():
    return static_file('style.css', root=static)

dateR = ''
monthR = None
yearR= None
dateH = ''
monthH = None
yearH = None

@root.route('/', method=['GET', 'POST'])
def home():

    formData = json.loads(dumps(request.forms))
    error = None
    global dateH, dateR, monthH, monthR, yearH, yearR

    if request.method=='GET':
        dateR = datetime.date.today()
        dateR = str(dateR)
        dateR = dateR.split('-')
        monthR = int(dateR[1])
        yearR = int(dateR[0])
        dateR = dateR[0]+dateR[1]

        dateH = datetime.date.today()
        dateH = str(dateH)
        dateH = dateH.split('-')
        monthH = int(dateH[1])
        yearH = int(dateH[0])
        dateH = dateH[0]+dateH[1]
    elif formData and formData['typeForm']=='popup':
        error = changeReservaStatus(request)
    elif formData and formData['typeForm']=='recebimento':
        dateR = formData['month']
        dateR = dateR.split('-')
        monthR = int(dateR[1])
        yearR = int(dateR[0])
        dateR = dateR[0]+dateR[1]
    elif formData and formData['typeForm']=='hospedes':
        dateH = formData['month']
        dateH = dateH.split('-')
        monthH = int(dateH[1])
        yearH = int(dateH[0])
        dateH = dateH[0]+dateH[1]

    today = datetime.date.today()
    today = str(today).split('-')
    today = today[0]+today[1]+today[2]

    req = requests.get(base_url+'/reservas/day/'+today)
    reservas = req.json()['result']

    for reserva in reservas:
        reqCliente = requests.get(base_url+'/clientes/codigo/'+str(reserva['cliente']))
        cliente = reqCliente.json()['results']['nome']
        reserva['nameCliente'] = cliente

    req2 = requests.get(base_url+'/quartos/ocupados')
    quartosOcupados = req2.json()['result']

    req3 = requests.get(base_url+'/reservas/recebimento/'+dateR)
    recebimento = req3.json()['result']

    req4 = requests.get(base_url+'/clientes/mensal/'+dateH)
    hospedes = req4.json()['result']

    return template(views+'home.tpl', reservas=reservas, quartosOcupados=quartosOcupados, recebimento=recebimento, hospedes=hospedes, monthR=monthR, yearR=yearR, monthH=monthH, yearH=yearH, error=error)


@root.route('/clientes', method=['GET', 'POST'])
def showUsers():

    urlReq = base_url+'/clientes'

    if request.method=='POST':
        search = json.loads(dumps(request.forms))['search']
        if search:
            urlReq = urlReq+'/nome/'+search

    req = requests.get(urlReq)
    print(req.json())
    result = req.json()['result']
    return template(views+'users.tpl', clientes=result)


@root.route('/clientes/<codigo>', method=['GET', 'POST'])
def infoUser(codigo):
    error = changeReservaStatus(request)

    req = requests.get(base_url+'/clientes/codigo/'+str(codigo))
    result = req.json()['results']

    cliente = {
        'nome': result['nome'],
        'codigo': result['codigo'],
        'contato': result['contato']
    }
    reservas = result['reservas']

    return template(views+'user.tpl', cliente=cliente, reservas=reservas, error=error)


@root.get('/clientes/criar')
def newCliente():
    return template(views+'criar-cliente.tpl', base_url=base_url, success=False, error=None)


@root.post('/clientes/criar')
def newCliente():
    cliente = json.loads(dumps(request.forms))

    if(cliente['codigo'] == ''):
        return template(views+'criar-cliente.tpl', base_url=base_url, success=False, error='Voce precisa informar um código')

    elif cliente['nome'] == '':
        return template(views+'criar-cliente.tpl', base_url=base_url, success=False, error='Voce precisa informar um nome')

    elif cliente['contato'] == '':
        return template(views+'criar-cliente.tpl', base_url=base_url, success=False, error='Voce precisa informar um contato')

    cliente['codigo'] = int(cliente['codigo'])

    req = requests.post(base_url+'/clientes', json=cliente)

    resposta = json.loads(req.content)

    if resposta['result'] == 'Cliente cadastrado com sucesso!':
        return template(views+'criar-cliente.tpl', base_url=base_url, success=True, error=None)
    else:
        return template(views+'criar-cliente.tpl', base_url=base_url, success=False, error=resposta['result'])


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

@root.route('/reservas', method=['GET', 'POST'])
def getAllReservas():
    month = datetime.date.today()
    month = str(month).split('-')
    just_month = month[1]
    month = month[0]+month[1]

    if request.method=='POST':
        month = json.loads(dumps(request.forms))['month']
        month = month.split('-')
        just_month = month[1]
        month = month[0]+month[1]

    req = requests.get(base_url+'/reservas/month/'+month)
    reservas = req.json()['result']

    for reserva in reservas:
        reqCliente = requests.get(base_url+'/clientes/codigo/'+str(reserva['cliente']))
        cliente = reqCliente.json()['results']['nome']
        reserva['nameCliente'] = cliente

    return template(views+'reservas.tpl', reservas=reservas, month=int(just_month))

@root.get('/quartos')
def showQuartos():
    req = requests.get(base_url+'/quartos')
    result = req.json()['result']
    return template(views+'quartos.tpl', quartos=result)


@root.route('/quartos/<numero>', method=['GET', 'POST'])
def infoQuarto(numero):

    error = changeReservaStatus(request)

    req = requests.get(base_url+'/quartos/'+str(numero))
    result = req.json()['result']

    quarto = {
        'numero': result['numero'],
        'tipo': result['tipo'],
        'diaria': result['diaria'],
        'capacidade': result['capacidade']
    }
    reservas = result['reservas']

    return template(views+'quarto.tpl', quarto=quarto, reservas=reservas, error=error)


# heroku
# root.run(host="0.0.0.0", port=int(os.environ.get("PORT", 5000)))

# Local
root.run(host='localhost', port=8081, debug=True, reloader=True)
