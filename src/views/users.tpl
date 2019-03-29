<!DOCTYPE html>
<html lang="pt-br">
% include('./src/views/head.tpl')
% include('./src/views/navbar.tpl')
    <body>
        <div class='container'>
            <div class="card mx-auto mt-4">
                <div class="card-header container" style="justify: space-between">
                    <div class='row'>
                        <h5 class='col'>Clientes</h5>
                        % if search:
                            <p class='col-4'>Buscando por: {{search}}</p>
                            <a href='/clientes'>
                                <button class='btn btn-sm btn-danger' title='Limpar pesquisa'>
                                    <i class="fas fa-times"></i>
                                </button>
                            </a>
                        % end
                        <form class='col-4' action='/clientes' method='post' enctype='application/json' accept-charset="ISO-8859-1">
                            <input 
                                class="form-control form-control-sm" 
                                id="search" 
                                name="search" 
                                placeholder="Buscar cliente..." 
                                type="text"/>
                        </form>
                        <a href="/clientes/criar">
                            <button type="button" class='btn btn-sm btn-primary mr-3'>
                                Cadastrar cliente
                            </button>
                        </a>
                    </div>
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
                        % for cliente in clientes:
                            <tr>
                            <th scope="row">{{cliente['codigo']}}</th>
                            <td>{{cliente['nome']}}</td>
                            <td>{{cliente['contato']}}</td>
                            <td>{{len(cliente['reservas'])}}</td>
                            <td>
                            % url = '/clientes/'+str(cliente['codigo'])
                                <a href={{url}} style=' text-decoration: none '>
                                    <button type="button" class="btn btn-primary" title="Visualizar Cliente">
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