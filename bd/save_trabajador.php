<?php
//Script para insertar un registro den la tabla trabajador
header('Content-Type: application/json');
include 'conectar.php';

if (isset($_POST['data'])) {

    $data = json_decode($_POST['data'], true);
    $nombre = $data['tra_nom'];
    $apPaterno = $data['tra_pat'];
    $apMaterno = $data['tra_mat'];
    $codigo = $data['tra_cod'];
		
    //Consulta para realizar la insercion de un trabajador
    $query = "
        INSERT INTO prueba.trabajador (tra_nom, tra_pat, tra_mat, tra_cod, est_ado) 
        VALUES ('$nombre', '$apPaterno', '$apMaterno', '$codigo', 0) RETURNING tra_ide
    ";

    $result = pg_query($dbconn, $query);

    if ($result) {
        // Obtener el ID insertado
        $insertedId = pg_fetch_result($result, 0, 'tra_ide');

        echo json_encode([
            'success' => true,
            'data' => [
                'tra_ide' => $insertedId,
                'tra_nom' => $nombre,
                'tra_pat' => $apPaterno,
                'tra_mat' => $apMaterno,
                'tra_cod' => $codigo,
                'est_ado' => 0
            ],
            'message' => 'Registro insertado correctamente.'
        ]);
    } else {
        echo json_encode([
            'success' => false,
            'message' => 'Error al insertar el registro en la base de datos.'
        ]);
    }
} else {
    echo json_encode([
        'success' => false,
        'message' => 'Los datos nos son correctos.'
    ]);
}
?>	