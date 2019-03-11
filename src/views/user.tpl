<!DOCTYPE html>
<html lang="pt-br">
% include('./src/views/head.tpl')
% include('./src/views/navbar.tpl')

    <body>
        <div class='container'>
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
                                    <th scope="col">Ações</th>
                                </tr>
                            % for reserva in reservas:
                                % entrada = str(reserva['entrada'])
                                % saida = str(reserva['saida'])
                                <tr>
                                    <th scope="row">{{entrada[6]}}{{entrada[7]}}/{{entrada[4]}}{{entrada[5]}}/{{entrada[0]}}{{entrada[1]}}{{entrada[2]}}{{entrada[3]}}</th>
                                    <td>{{saida[6]}}{{saida[7]}}/{{saida[4]}}{{saida[5]}}/{{saida[0]}}{{saida[1]}}{{saida[2]}}{{saida[3]}}</td>
                                    <td>{{reserva['quarto']}}</td>
                                    <td>
                                        <button type="button" class="btn btn-primary">
                                            <i class="fas fa-plus-square"></i>
                                        </button>
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