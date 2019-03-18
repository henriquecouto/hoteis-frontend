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
                                    <a href={{"#popup-ci-"+reserva['_id']['$oid']}}>
                                        <button class="btn btn-primary">
                                            <i class="fas fa-check-square"></i>
                                        </button
                                    </a>

                                    <div id={{"popup-ci-"+reserva['_id']['$oid']}} class="overlay">
                                        <div class="card popup">
                                            <div class="card-header">
                                                <h4>Check-In</h4>
                                                <a class="close" href="#">&times;</a>
                                            </div>
                                            <div class="card-body">
                                                <form action={{"/clientes/"+str(cliente['codigo'])}} method='post' enctype='application/json'>
                                                    <input name="_id" value={{reserva['_id']['$oid']}} style="display: none;" />

                                                    <input name="status" value="Check-In" style="display: none;" />
                                                    
                                                    <div class="form-group">
                                                        <label for="hospedes">Número de hóspedes</label>
                                                        <input 
                                                            class="form-control" 
                                                            id="hospedes" 
                                                            name="hospedes" 
                                                            placeholder="Insira o número..." 
                                                            max=5
                                                            min=1
                                                            type="number"/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="entrada">Data</label>
                                                        <input class="form-control" id="entrada" name="entrada" type="date"/>
                                                    </div>
                                                    
                                                    <button type="submit" class="btn btn-primary" title="Check-In">
                                                        Continuar
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                    %end
                                    % if reserva['status'] == 'Check-In':
                                    <a href={{"#popup-co-"+reserva['_id']['$oid']}}>
                                        <button class="btn btn-primary">
                                            <i class="fas fa-sign-out-alt"></i>
                                        </button>
                                    </a>
                                    <div id={{"popup-co-"+reserva['_id']['$oid']}} class="overlay">
                                        <div class="card popup">
                                            <div class="card-header">
                                                <h4>Check-Out</h4>
                                                <a class="close" href="#">&times;</a>
                                            </div>
                                            <div class="card-body">
                                                <form action={{"/clientes/"+str(cliente['codigo'])}} method='post' enctype='application/json'>
                                                    <input name="_id" value={{reserva['_id']['$oid']}} style="display: none;" />

                                                    <input name="status" value="Check-Out" style="display: none;" />
                                                    
                                                    <div class="form-group">
                                                        <label for="saida">Data</label>
                                                        <input class="form-control" id="saida" name="saida" type="date"/>
                                                    </div>
                                                    
                                                    <button type="submit" class="btn btn-primary" title="Check-In">
                                                        Continuar
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
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