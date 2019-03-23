<form action="/" method="post" enctype='application/json'>
    <label for="inputDate">Selecionar mês:</label>
    <input name='typeForm' value={{typeForm}} style="display: none" />

    <input class="form-control m-0" type="month" name="month" />

    <button type='submit' class='btn btn-primary mt-2' 
        style='width:100%' title='OK'>OK</button>
</form>