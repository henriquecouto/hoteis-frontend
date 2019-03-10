<!DOCTYPE html>
<html lang="en">
% include('./src/views/head.tpl')
% include('./src/views/navbar.tpl')

    <body>
        <div class='container'>
            <div class="card mx-auto mt-4">
                <h5 class="card-header">Reservas de {{cliente['nome']}}</h5>
                <table class="card-body table">
                    <thead>
                        <tr>
                            <th scope="col">Entrada prevista</th>
                            <th scope="col">Saída prevista</th>
                            <th scope="col">Quarto</th>
                            <th scope="col">Ações</th>
                        </tr>
                    </thead>
                    <tbody>
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
    </body>

</html>