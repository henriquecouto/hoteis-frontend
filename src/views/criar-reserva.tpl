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
                Reserva cadastrada com sucesso!
            </div>
        %end

            <div class='card mt-4' style='width: 50%; margin: auto'>
                <div class='card-header'>
                    <h5>Nova Reserva</h5>
                </div>
                <div class='card-body'>
                    <form action='/reservas/criar' method='post' enctype='application/json'>
                        <div class="form-group">
                            <label for="cliente">Código do cliente</label>
                            <input 
                                class="form-control" 
                                id="cliente" 
                                name="cliente" 
                                placeholder="Insira o código..." 
                                min=1
                                type="number"/>
                        </div>
                        <div class="form-group">
                            <label for="quarto">Número do quarto</label>
                            <input 
                                class="form-control" 
                                id="quarto" 
                                name="quarto" 
                                placeholder="Insira o número..." 
                                max=10
                                min=1
                                type="number"/>
                        </div>
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
                        <div class='row'>
                            <div class="form-group col">
                                <label for="entrada">Data de entrada</label>
                                <input class="form-control" id="entrada" name="entrada" type="date"/>
                            </div>
                            <div class="form-group col">
                                <label for="saida">Data de saída</label>
                                <input class="form-control" id="saida" name="saida" type="date"/>
                            </div>
                        </div>
                        <button class="btn btn-primary mr-3" id='button2'>Criar</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>