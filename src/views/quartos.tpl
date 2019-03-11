<!DOCTYPE html>
<html lang="pt-br">
% include('./src/views/head.tpl')
% include('./src/views/navbar.tpl')
    <body>
        <div class='container'>
            <div class="card mx-auto mt-4">
                <div class="card-header container">
                    <div class='row'>
                        <h5 class='col'>Quartos</h5>
                    </div>
                </div>
                <table class="card-body table mb-0">

                    <tbody>
                        <tr>
                            <th scope="col">Número</th>
                            <th scope="col">Tipo</th>
                            <th scope="col">Valor diária</th>
                            <th scope="col">Capacidade</th>
                            <th scope="col">Reservas</th>
                            <th scope="col">Ações</th>
                        </tr>
                        % for quarto in quartos:
                            <tr>
                            <th scope="row">{{quarto['numero']}}</th>
                            <td>{{quarto['tipo'].title()}}</td>
                            <td>R$ {{quarto['diaria']}}</td>
                            <td>{{quarto['capacidade']}}</td>
                            <td>{{len(quarto['reservas'])}}</td>
                            <td>
                            % url = '/quartos/'+str(quarto['numero'])
                                <a href={{url}} style=' text-decoration: none '>
                                    <button type="button" class="btn btn-primary">
                                        <i class="fas fa-external-link-alt"></i>
                                    </button>
                                </a>
                            </td>
                        </tr>
                        % end
                        </tbody>
                </table>
            </div>
        </div>
    </body>

</html>