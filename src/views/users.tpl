<!DOCTYPE html>
<html lang="en">
% include('./src/views/head.tpl')
% include('./src/views/navbar.tpl')
    <body>
        <div class='container'>
            <div class="card mx-auto mt-4">
                <h5 class="card-header">Clientes</h5>
                <table class="card-body table">
                    <thead>
                        <tr>
                            <th scope="col">Código</th>
                            <th scope="col">Nome</th>
                            <th scope="col">Contato</th>
                            <th scope="col">Reservas</th>
                            <th scope="col">Ocupações</th>
                            <th scope="col">Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        % for cliente in clientes:
                            <tr>
                            <th scope="row">{{cliente['codigo']}}</th>
                            <td>{{cliente['nome']}}</td>
                            <td>{{cliente['contato']}}</td>
                            <td>{{len(cliente['reservas'])}}</td>
                            <td>0</td>
                            <td>
                            % url = '/user/'+str(cliente['codigo'])
                                <a href={{url}} style=' text-decoration: none '>
                                    <button type="button" class="btn btn-primary">
                                        <i class="fas fa-plus-square"></i>
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