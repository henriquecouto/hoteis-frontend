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
                        % if search:
                            <p class='col-4'>Buscando por: {{search}}</p>
                            <a href='/quartos'>
                                <button class='btn btn-sm btn-danger' title='Limpar pesquisa'>
                                    <i class="fas fa-times"></i>
                                </button>
                            </a>
                        % end
                        <form class='col-4' action='/quartos' method='post' enctype='application/json' accept-charset="ISO-8859-1">
                            <input 
                                class="form-control form-control-sm" 
                                id="search" 
                                name="search" 
                                placeholder="Buscar quarto por tipo ou número..." 
                                type="text"/>
                        </form>
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
                            <th scope="col">Ocupado</th>
                            <th scope="col">Ações</th>
                        </tr>
                        % for quarto in quartos:
                            <tr>
                            <th scope="row">{{quarto['numero']}}</th>
                            <td>{{quarto['tipo'].title()}}</td>
                            <td>R$ {{quarto['diaria']}}</td>
                            <td>{{quarto['capacidade']}}</td>
                            <td>{{len(quarto['reservas'])}}</td>
                            <td>{{quarto['ocupado']}}</td>
                            <td>
                            % url = '/quartos/'+str(quarto['numero'])
                                <a href={{url}} style=' text-decoration: none '>
                                    <button type="button" class="btn btn-primary" title='Visualizar Quarto'>
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