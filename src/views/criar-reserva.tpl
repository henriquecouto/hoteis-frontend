<!DOCTYPE html>
<html lang="pt-br">
% include('./src/views/head.tpl')
% include('./src/views/navbar.tpl')
% url = base_url+'/reservas'

    <body>
        <div class='container'>
            <div class='card mt-4' style='width: 50%; margin: auto'>
                <div class='card-header'>
                    <h5>Nova Reserva</h5>
                </div>
                <div class='card-body'>
                    <form action={{url}} method="post">
                        <div class="form-group">
                            <label for="cliente">Código do cliente</label>
                            <input 
                                class="form-control" 
                                id="cliente" 
                                name="cliente" 
                                placeholder="Insira o código..." 
                                type="number"/>
                        </div>
                        <div class="form-group">
                            <label for="quarto">Número do quarto</label>
                            <input 
                                class="form-control" 
                                id="quarto" 
                                name="quarto" 
                                placeholder="Insira o número..." 
                                type="number"/>
                        </div>
                        <div class="form-group">
                            <label for="quarto">Número de hóspedes</label>
                            <input 
                                class="form-control" 
                                id="quarto" 
                                name="quarto" 
                                placeholder="Insira o número..." 
                                type="number"/>
                        </div>
                        <div class="form-group">
                            <label for="entrada">Data de entrada</label>
                            <input 
                                class="form-control" 
                                id="entrada" 
                                name="entrada"
                                type="date"
                                placeholder="dd/mm/yyyy"/>
                        </div>
                        <div class="form-group">
                            <label for="saida">Data de saída</label>
                            <input 
                                class="form-control" 
                                id="saida" 
                                name="saida"
                                type="date"
                                placeholder="dd/mm/yyyy"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>