<section class="container-m row px-4 py-4">
  <h1>Formulario Clientes</h1>
</section>

<section class="container-m row px-4 py-4">
  {{with cliente}}
  <form action="index.php?page=ClientesForm&mode={{~mode}}&id={{cliente_id}}"
        method="POST"
        class="col-12 col-m-8 offset-m-2">

    <div class="row my-2 align-center">
      <label class="col-12 col-m-3">ID</label>
      <input class="col-12 col-m-9" readonly disabled value="{{cliente_id}}">
      <input type="hidden" name="cliente_id" value="{{cliente_id}}">
    </div>

    <div class="row my-2 align-center">
      <label class="col-12 col-m-3">Nombre</label>
      <input class="col-12 col-m-9" {{~readonly}} name="nombre" value="{{nombre}}">
      {{if nombre_error}}
      <div class="error col-12 col-m-9 offset-m-3">{{nombre_error}}</div>
      {{endif nombre_error}}
    </div>

    <div class="row my-2 align-center">
      <label class="col-12 col-m-3">Correo</label>
      <input class="col-12 col-m-9" {{~readonly}} name="correo" value="{{correo}}">
      {{if correo_error}}
      <div class="error col-12 col-m-9 offset-m-3">{{correo_error}}</div>
      {{endif correo_error}}
    </div>

    <div class="row my-2 align-center">
      <label class="col-12 col-m-3">Teléfono</label>
      <input class="col-12 col-m-9" {{~readonly}} name="telefono" value="{{telefono}}">
      {{if telefono_error}}
      <div class="error col-12 col-m-9 offset-m-3">{{telefono_error}}</div>
      {{endif telefono_error}}
    </div>

    <div class="row my-2 align-center">
      <label class="col-12 col-m-3">Estado</label>
      <input class="col-12 col-m-9" {{~readonly}} name="estado" value="{{estado}}">
      {{if estado_error}}
      <div class="error col-12 col-m-9 offset-m-3">{{estado_error}}</div>
      {{endif estado_error}}
    </div>

    {{endwith cliente}}

    <div class="row my-4 align-center flex-end">
      {{if showCommitBtn}}
      <button class="primary col-12 col-m-2" type="submit">Confirmar</button>
      {{endif showCommitBtn}}

      <button class="col-12 col-m-2" type="button" id="btnCancelar">
        {{if showCommitBtn}}Cancelar{{endif showCommitBtn}}
        {{ifnot showCommitBtn}}Regresar{{endifnot showCommitBtn}}
      </button>
    </div>
  </form>
</section>

<script>
document.addEventListener("DOMContentLoaded", ()=>{
  document.getElementById("btnCancelar").onclick = ()=>{
    window.location.assign("index.php?page=Clientes");
  };
});
</script>
