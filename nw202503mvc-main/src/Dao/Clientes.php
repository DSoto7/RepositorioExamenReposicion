<?php
namespace Dao;

class Clientes extends Table
{
    public static function getClientes(
        string $partialNombre = "",
        string $estado = "",
        string $orderBy = "",
        bool $orderDescending = false,
        int $page = 0,
        int $itemsPerPage = 10
    ) {
        $sql = "SELECT cliente_id, nombre, correo, telefono, estado FROM clientes";
        $sqlCount = "SELECT COUNT(*) as count FROM clientes";
        $conditions = [];
        $params = [];

        if ($partialNombre !== "") {
            $conditions[] = "nombre LIKE :nombre";
            $params["nombre"] = "%$partialNombre%";
        }

        if ($estado !== "") {
            $conditions[] = "estado = :estado";
            $params["estado"] = $estado;
        }

        if ($conditions) {
            $where = " WHERE " . implode(" AND ", $conditions);
            $sql .= $where;
            $sqlCount .= $where;
        }

        if (in_array($orderBy, ["nombre","correo","telefono","estado"])) {
            $sql .= " ORDER BY $orderBy";
            if ($orderDescending) $sql .= " DESC";
        }

        $total = self::obtenerUnRegistro($sqlCount, $params)["count"];
        $sql .= " LIMIT " . ($page * $itemsPerPage) . ", $itemsPerPage";

        return [
            "clientes" => self::obtenerRegistros($sql, $params),
            "total" => $total
        ];
    }

    public static function getById(int $id)
    {
        return self::obtenerUnRegistro(
            "SELECT * FROM clientes WHERE cliente_id=:id",
            ["id"=>$id]
        );
    }

    public static function insert(string $nombre, string $correo, string $telefono, string $estado)
    {
        return self::executeNonQuery(
            "INSERT INTO clientes (nombre, correo, telefono, estado)
             VALUES (:nombre,:correo,:telefono,:estado)",
            compact("nombre","correo","telefono","estado")
        );
    }

    public static function update(int $id, string $nombre, string $correo, string $telefono, string $estado)
    {
        return self::executeNonQuery(
            "UPDATE clientes
             SET nombre=:nombre, correo=:correo, telefono=:telefono, estado=:estado
             WHERE cliente_id=:id",
            compact("id","nombre","correo","telefono","estado")
        );
    }

    public static function delete(int $id)
    {
        return self::executeNonQuery(
            "DELETE FROM clientes WHERE cliente_id=:id",
            ["id"=>$id]
        );
    }
}
