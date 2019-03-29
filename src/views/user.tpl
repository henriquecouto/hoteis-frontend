<!DOCTYPE html>
<html lang="pt-br">
% include('./src/views/head.tpl')
% include('./src/views/navbar.tpl')

<body>
    <div class='container'>

        %if error:
            %if 'sucesso' in error:
            <div class="alert alert-success mt-2" role="alert">
                {{error}}
            </div>
            %else:
                <div class="alert alert-danger mt-2" role="alert">
                {{error}}
            </div>
            %end
        %end

        <div class='row'>
            <div class='col-3'>
                <div class='card mx-auto mt-4'>
                    <div class="card-header">
                        <h5>Informações</h5>
                    </div>
                    <ul class="list-group list-group-flush">
                        %for key in cliente:
                        <li class="list-group-item">
                            <b>{{key.title()}}:</b>
                            {{cliente[key]}}
                        </li>
                        %end
                    </ul>
                </div>
            </div>
            <div class='col'>
                <div class="card mx-auto mt-4">
                    <div class="card-header">
                        <div class="container">
                            <div class="row">
                                <div class="col">
                                    <h5>Reservas</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <table class="card-body table mb-0">
                        <tbody>
                            <tr>
                                <th scope="col">Entrada</th>
                                <th scope="col">Saída</th>
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
                                <th scope="row">
                                    {{entrada[6]}}{{entrada[7]}}/{{entrada[4]}}{{entrada[5]}}/{{entrada[0]}}{{entrada[1]}}{{entrada[2]}}{{entrada[3]}}
                                </th>
                                <td>
                                    <div class="mytd">
                                        <span class='saida'>{{saida[6]}}{{saida[7]}}/{{saida[4]}}{{saida[5]}}/{{saida[0]}}{{saida[1]}}{{saida[2]}}{{saida[3]}}</span>
                                        <span class='diarias'>{{f"{reserva['diarias']} Diárias"}}</span>
                                    </div>
                                </td>
                                <td>
                                <a href={{'/quartos/'+str(reserva['quarto'])}}>{{reserva['quarto']}}</a>
                                </td>
                                <td>{{reserva['hospedes']}}</td>
                                <td>{{reserva['status']}}</td>
                                <td>
                                    % if 'valor' in reserva:
                                    {{reserva['valor']}}
                                    % end
                                </td>
                                <td>
                                    % if reserva['status'] == 'Aguardando':
                                    % popup = {'nome': 'Check-In', 'type': 'cliente', 'url': 'popup-ci-'+reserva['_id']['$oid']}
                                    <a href={{"#popup-ci-"+reserva['_id']['$oid']}}>
                                        <button class="btn btn-primary" title='Fazer Check-In'>
                                            <i class="fas fa-check-square"></i>
                                        </button>
                                    </a>

                                    %include('./src/views/popup.tpl')

                                    %end
                                    % if reserva['status'] == 'Check-In':
                                    % popup = {'nome': 'Check-Out', 'type': 'cliente', 'url': 'popup-co-'+reserva['_id']['$oid']}
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
        </div>
</body>

</html>