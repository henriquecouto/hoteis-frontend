<!DOCTYPE html>
<html lang="pt-br">
% include('./src/views/head.tpl')
% include('./src/views/navbar.tpl')
% import datetime

<body>
    <div class='container mt-4'>
        <div class='row'>
            <div class='col-sm'>
                <div class='card'>
                    <div class='card-header'>
                        Total de Quartos
                    </div>
                    <div class='card-body'>
                        <h2>10</h2>
                    </div>
                </div>
            </div>
            <div class='col-sm'>
                <div class='card'>
                    <div class='card-header'>
                        Quartos Ocupados
                    </div>
                    <div class='card-body'>
                        <h2>8</h2>
                    </div>
                </div>
            </div>
            <div class='col-sm'>
                <div class='card'>
                    <div class='card-header'>
                        Recebimento Mensal
                    </div>
                    <div class='card-body'>
                        <h2>R$00,00</h2>
                        <div class='row'>
                            <label for="start">Selecionar mês:</label>
                            % date = datetime.date.today()
                            % date = str(date)
                            % date = date.split('-')

                            <input class='form-control' type="month" id="start" name="start"
                                value={{date[0]+'-'+date[1]}}>
                        </div>
                    </div>
                </div>
            </div>
            <div class='col-sm'>
                <div class='card'>
                    <div class='card-header'>
                        Total de Hospedes Mensal
                    </div>
                    <div class='card-body'>
                        <h2>200</h2>
                        <div class='row'>
                            <label for="start">Selecionar mês:</label>
                            % date = datetime.date.today()
                            % date = str(date)
                            % date = date.split('-')

                            <input class='form-control' type="month" id="start" name="start"
                                value={{date[0]+'-'+date[1]}}>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="card mx-auto mt-4 mb-4">
            <div class="card-header">
                Reservas Diárias
            </div>
            <table class="card-body table mb-0">

                <tbody>
                    <tr>
                        <th scope="col">Código</th>
                        <th scope="col">Nome</th>
                        <th scope="col">Contato</th>
                        <th scope="col">Reservas</th>
                        <th scope="col">Ações</th>
                    </tr>
                    % for reserva in reservas:
                    % entrada = str(reserva['entrada'])
                    % saida = str(reserva['saida'])
                    <tr>
                        <th scope="row">
                            {{entrada[6]}}{{entrada[7]}}/{{entrada[4]}}{{entrada[5]}}/{{entrada[0]}}{{entrada[1]}}{{entrada[2]}}{{entrada[3]}}
                        </th>
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
                                <button class="btn btn-primary">
                                    <i class="fas fa-check-square"></i>
                                </button>
                            </a>

                            %include('./src/views/popup.tpl')

                            %end
                            % if reserva['status'] == 'Check-In':
                            % popup = {'nome': 'Check-Out', 'type': 'reserva', 'url': 'popup-co-'+reserva['_id']['$oid']}
                            <a href={{"#popup-co-"+reserva['_id']['$oid']}}>
                                <button class="btn btn-primary">
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