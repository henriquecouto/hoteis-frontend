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
                            %for key in quarto:
                                <li class="list-group-item">
                                <b>{{key.title()}}:</b>
                                {{quarto[key]}}
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
                                    <th scope="col">Status</th>
                                    <th scope="col">Valor</th>
                                    <th scope="col">Ações</th>
                                </tr>
                            % for reserva in reservas:
                                % entrada = str(reserva['entrada'])
                                % saida = str(reserva['saida'])
                                <tr>
                                    <th scope="row">{{entrada[6]}}{{entrada[7]}}/{{entrada[4]}}{{entrada[5]}}/{{entrada[0]}}{{entrada[1]}}{{entrada[2]}}{{entrada[3]}}</th>
                                    <td>{{saida[6]}}{{saida[7]}}/{{saida[4]}}{{saida[5]}}/{{saida[0]}}{{saida[1]}}{{saida[2]}}{{saida[3]}}</td>
                                    <td>{{reserva['quarto']}}</td>
                                    <td>{{reserva['status']}}</td>
                                    <td>
                                    % if 'valor' in reserva:
                                        {{reserva['valor']}}
                                    % end  
                                    </td> 
                                    <td>
                                    % if reserva['status'] == 'Aguardando':
                                        <form action={{"/quartos/"+str(quarto['numero'])}} method='post' enctype='application/json'>
                                            <input name="_id" value={{reserva['_id']['$oid']}} style="display: none;"/>
                                            <input name="status" value="Check-In" style="display: none;"/>
                                            <button type="submit" class="btn btn-primary" title="Check-In">
                                                <i class="fas fa-check-square"></i>
                                            </button>
                                        </form>
                                    %end
                                    % if reserva['status'] == 'Check-In':
                                        <form action={{"/quartos/"+str(quarto['numero'])}} method='post' enctype='application/json'>
                                            <input name="_id" value={{reserva['_id']['$oid']}} style="display: none;"/>
                                            <input name="status" value="Check-Out" style="display: none;"/>
                                            <button type="submit" class="btn btn-primary" title="Check-Out">
                                            <i class="fas fa-sign-out-alt"></i>
                                        </button>
                                        </form>
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