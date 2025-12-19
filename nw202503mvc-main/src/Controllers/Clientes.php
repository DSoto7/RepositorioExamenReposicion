<?php
namespace Controllers;

use Controllers\PublicController;
use Dao\Clientes as ClientesDao;
use Views\Renderer;

class Clientes extends PublicController
{
    private $partialNombre="";
    private $estado="";
    private $orderBy="";
    private $orderDescending=false;
    private $pageNumber=1;
    private $itemsPerPage=10;
    private $viewData=[];

    public function run(): void
    {
        $this->partialNombre = $_GET["partialNombre"] ?? "";
        $this->estado = $_GET["estado"] ?? "";
        $this->orderBy = $_GET["orderBy"] ?? "";
        $this->orderDescending = boolval($_GET["orderDescending"] ?? false);
        $this->pageNumber = intval($_GET["pageNum"] ?? 1);

        $result = ClientesDao::getClientes(
            $this->partialNombre,
            $this->estado,
            $this->orderBy,
            $this->orderDescending,
            $this->pageNumber - 1,
            $this->itemsPerPage
        );

        $this->viewData["clientes"] = $result["clientes"];
        $this->viewData["total"] = $result["total"];
        $this->viewData["pages"] = ceil($result["total"]/$this->itemsPerPage);
        $this->viewData["pageNum"] = $this->pageNumber;
        $this->viewData["partialNombre"] = $this->partialNombre;

        Renderer::render("clientes", $this->viewData);
    }
}
