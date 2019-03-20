<div id={{popup['url']}} class="overlay">
    <div class="card popup">
        <div class="card-header">
            <h3>Fazer {{popup['nome']}}</h3>
        </div>
        <div class="card-body">
            <form action={{"/clientes/"+str(cliente['codigo'])}} method='post' enctype='application/json'>
                <input name="_id" value={{reserva['_id']['$oid']}} style="display: none;" />

                <input name="status" value={{popup['nome']}} style="display: none;" />
                % if popup['nome'] == 'Check-In':
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
                % end
                % if popup['nome'] == 'Check-Out':
                <div class="form-group">
                    <label for="entrada">Data</label>
                    <input 
                        class="form-control" 
                        id="saida" 
                        name="saida" 
                        type="date"/>
                </div>
                % end
                <div>
                    <a href="#" style="text-decoration: none;">
                        <button type="button" class='btn btn-secondary'>
                            Cancelar
                        </button>
                    </a>
                    <button type="submit" class="btn btn-primary" title="Check-In">
                        Continuar
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>