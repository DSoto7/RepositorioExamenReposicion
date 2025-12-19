<section class="container-m px-4 py-4">
<h1>Gestion de Clientes</h1>

<form method="GET" class="row mb-3">
<input type="hidden" name="page" value="Clientes">
<input type="text" name="partialNombre" value="{{partialNombre}}" placeholder="Buscar nombre">
<button class="primary">Buscar</button>
<a class="button" href="index.php?page=ClientesForm&mode=INS">Nuevo</a>
</form>

<table class="full-width">
<thead>
<tr>
<th>Nombre</th>
<th>Correo</th>
<th>Telefono</th>
<th>Estado</th>
<th>Acciones</th>
</tr>
</thead>
<tbody>
{{foreach cliente in clientes}}
<tr>
<td>{{nombre}}</td>
<td>{{correo}}</td>
<td>{{telefono}}</td>
<td>{{estado}}</td>
<td>
<a href="index.php?page=ClientesForm&mode=DSP&cliente_id={{cliente_id}}">Ver</a> |
<a href="index.php?page=ClientesForm&mode=UPD&cliente_id={{cliente_id}}">Editar</a> |
<a href="index.php?page=ClientesForm&mode=DEL&cliente_id={{cliente_id}}">Eliminar</a>
</td>
</tr>
{{endforeach cliente}}
</tbody>
</table>
</section>
