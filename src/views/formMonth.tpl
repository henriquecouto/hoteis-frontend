% import datetime

<form action="/" method="post" enctype='application/json'>

    <label for="inputDate">Selecionar mês:</label>
    <input name='typeForm' value={{typeForm}} style="display: none" />

    % today = datetime.date.today()
    % today = str(today).split('-')
    % today = today[0]+'-'+today[1]
    <input class="form-control m-0" type="month" name="month" value={{today}} />
    <button type='submit' class='btn btn-primary mt-2' 
        style='width:100%' title='OK'> OK </button>
</form>