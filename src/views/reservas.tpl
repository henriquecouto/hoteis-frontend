<!DOCTYPE html>
<html lang="pt-br">
% include('./src/views/head.tpl')
% include('./src/views/navbar.tpl')
% import datetime

% months = ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro']

<body>
    <div class='container mt-4'>
        <div class="card mx-auto mt-4 mb-4">
            <div class="card-header">
                <div class='row'>
                    <h5 class='col'>
                        Reservas finalizadas em {{months[month-1]}}
                    </h5>
                    <div class='col-3'>
                        <form action='/reservas' method='post' enctype='application/json'>
                            <div class='row'>
                            % today = datetime.date.today()
                            % today = str(today).split('-')
                            % today = today[0]+'-'+today[1]
                                <input title='Selecione um mês' class="form-control form-control-sm mr-2 col-9" type="month" name="month" value={{today}} />
                                <button type='submit' class='btn btn-sm btn-primary col-2' title='OK'>OK</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <table class="card-body table mb-0">
                <tbody>
                    <tr>
                        <th scope="col">Cliente</th>
                        <th scope="col">Data de Entrada</th>
                        <th scope="col">Data de Saída</th>
                        <th scope="col">Quarto</th>
                        <th scope="col">Hóspedes</th>
                        <th scope="col">Status</th>
                        <th scope="col">Valor</th>
                        <th scope="col">Ações</th>
                    </tr>
                    % for reserva in reservas:
                    % entrada = str(reserva['entrada'])
                    % saida = str(reserva['saida'])
                    <tr>
                        <th><a href={{"/clientes/"+str(reserva['cliente'])}}>{{reserva['nameCliente']}}</a></th>

                        <td scope="row">
                            {{entrada[6]}}{{entrada[7]}}/{{entrada[4]}}{{entrada[5]}}/{{entrada[0]}}{{entrada[1]}}{{entrada[2]}}{{entrada[3]}}
                        </td>
                        <td>{{saida[6]}}{{saida[7]}}/{{saida[4]}}{{saida[5]}}/{{saida[0]}}{{saida[1]}}{{saida[2]}}{{saida[3]}}
                        </td>
                        <td>{{reserva['quarto']}}</td>
                        <td>{{reserva['hospedes']}}</td>
                        <td>{{reserva['status']}}</td>
                        <td>
                            % if 'valor' in reserva:
                            {{reserva['valor']}}
                            % end
                        </td>
                        <td>
                            % if reserva['status'] == 'Aguardando':
                            % popup = {'nome': 'Check-In', 'type': 'reserva', 'url': 'popup-ci-'+reserva['_id']['$oid']}
                            <a href={{"#popup-ci-"+reserva['_id']['$oid']}}>
                                <button class="btn btn-primary" title='Fazer Check-In'>
                                    <i class="fas fa-check-square"></i>
                                </button>
                            </a>

                            %include('./src/views/popup.tpl')

                            %end
                            % if reserva['status'] == 'Check-In':
                            % popup = {'nome': 'Check-Out', 'type': 'reserva', 'url': 'popup-co-'+reserva['_id']['$oid']}
                            <a href={{"#popup-co-"+reserva['_id']['$oid']}}>
                                <button class="btn btn-primary" title='Fazer Check-Out'>
                                    <i class="fas fa-sign-out-alt"></i>
                                </button>
                            </a>
                            
                            %include('./src/views/popup.tpl')

                            %end
                        </td>
                    </tr>
                    % end
                </tbody>
            </table>
        </div>
    </div>
</body>

</html>