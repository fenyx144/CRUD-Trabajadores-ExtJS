<?php
//Script para actualizar los campos o el estado del trabajador

header('Content-Type: application/json');
include 'conectar.php';

if (isset($_POST['data'])) {
    $data = json_decode($_POST['data'], true);
    $estado = $data['est_ado'];

	//Actualizacion de datos del trabajador
	if ($estado == 0) {
		$id = $data['tra_ide'];
		$nombre = $data['tra_nom'];
		$apPaterno = $data['tra_pat'];
		$apMaterno = $data['tra_mat'];
		$codigo = $data['tra_cod'];
		
		$query = "UPDATE prueba.trabajador
				SET tra_cod = $1,
					tra_nom = $2,
					tra_pat = $3,
					tra_mat = $4,
					est_ado = $5
				WHERE tra_ide = $6";

		pg_prepare($dbconn, "update_trabajador", $query);

		$result = pg_execute($dbconn, "update_trabajador", array($codigo, $nombre, $apPaterno, $apMaterno, $estado, $id));
	} else {
		//Actualizacion del estado Activo -> Eliminado
		$id = $data['tra_ide'];
		$query = "UPDATE prueba.trabajador
				SET est_ado = $1
				WHERE tra_ide = $2";
		$valorEliminado = 1;
		
		pg_prepare($dbconn, "delete_trabajador", $query);

		$result = pg_execute($dbconn, "delete_trabajador", array($valorEliminado, $id));
	}
	// Comprobar si la consulta fue exitosa
	if ($result) {
		// La actualizacion fue exitosa
		echo json_encode([
			'success' => true,
			'message' => 'Registro actualizado correctamente.'
		]);
	} else {
		// Error al ejecutar la actualización
		echo json_encode([
			'success' => false,
			'message' => 'Error al actualizar el registro.'
		]);
	}

} else {
    echo json_encode([
        'success' => false,
        'message' => 'Los datos nos son correctos.'
    ]);
}
?>