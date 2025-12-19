<?php
namespace Controllers;

use Controllers\PublicController;
use Dao\Clientes;
use Views\Renderer;
use Utilities\Site;

class ClientesForm extends PublicController
{
    private $mode="DSP";
    private $readonly="";
    private $showCommitBtn=true;
    private $viewData=[];
    private $cliente=[
        "cliente_id"=>0,
        "nombre"=>"",
        "correo"=>"",
        "telefono"=>"",
        "estado"=>""
    ];

    public function run(): void
    {
        $this->mode = $_GET["mode"] ?? "DSP";
        $this->readonly = $this->mode==="DEL" ? "readonly":"";
        $this->showCommitBtn = $this->mode!=="DSP";

        if ($this->mode!=="INS") {
            $this->cliente = Clientes::getById(intval($_GET["cliente_id"]));
        }

        if ($this->isPostBack()) {
    
            $this->cliente = [
                "cliente_id" => intval($_POST["cliente_id"]),
                "nombre" => htmlspecialchars($_POST["nombre"]),
                "correo" => htmlspecialchars($_POST["correo"]),
                "telefono" => htmlspecialchars($_POST["telefono"]),
                "estado" => htmlspecialchars($_POST["estado"])
            ];

            if ($this->mode==="INS") {
                Clientes::insert(
                    $this->cliente["nombre"],
                    $this->cliente["correo"],
                    $this->cliente["telefono"],
                    $this->cliente["estado"]
                );
            }
            if ($this->mode==="UPD") {
                Clientes::update(
                    $this->cliente["cliente_id"],
                    $this->cliente["nombre"],
                    $this->cliente["correo"],
                    $this->cliente["telefono"],
                    $this->cliente["estado"]
                );
            }
            if ($this->mode==="DEL") {
                Clientes::delete($this->cliente["cliente_id"]);
            }
            Site::redirectTo("index.php?page=Clientes");
        }

        $this->viewData["cliente"] = $this->cliente;
        $this->viewData["mode"] = $this->mode;
        $this->viewData["readonly"] = $this->readonly;
        $this->viewData["showCommitBtn"] = $this->showCommitBtn;

        Renderer::render("clientesform", $this->viewData);
    }
}
