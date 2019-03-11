<!DOCTYPE html>
<html lang="pt-br">
% include('./src/views/head.tpl')
% include('./src/views/navbar.tpl')

    <body>
        <div class='container'>

        %if error:
            <div class="alert alert-danger mt-2" role="alert">
                {{error}}
            </div>
        %end

        %if success:
            <div class="alert alert-success mt-2" role="alert">
                Cliente cadastrado com sucesso!
            </div>
        %end

            <div class='card mt-4' style='width: 50%; margin: auto'>
                <div class='card-header'>
                    <h5>Novo Cliente</h5>
                </div>
                <div class='card-body'>
                    <form action='/clientes/criar' method='post' enctype='application/json'>
                        <div class="form-group">
                            <label for="codigo">Código</label>
                            <input 
                                class="form-control" 
                                id="codigo" 
                                name="codigo" 
                                placeholder="Insira o código..." 
                                min=1
                                type="number"/>
                        </div>
                        <div class="form-group">
                            <label for="nome">Nome</label>
                            <input 
                                class="form-control" 
                                id="nome" 
                                name="nome" 
                                placeholder="Insira o nome..." 
                                min=1
                                type="text"/>
                        </div>
                        <div class="form-group">
                            <label for="contato">Contato</label>
                            <input 
                                class="form-control" 
                                id="contato" 
                                name="contato" 
                                placeholder="Insira o contato..." 
                                min=1
                                type="text"/>
                        </div>
                        <button class="btn btn-primary mr-3" id='button2'>Criar</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>