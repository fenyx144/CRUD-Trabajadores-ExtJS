<?php
//Script para obtener los registros de la tabla trabajadores

header('Content-Type: application/json');
include 'conectar.php';

if (!$dbconn) {
    echo json_encode(['success' => false, 'message' => 'No se pudo conectar a la base de datos.']);
    exit;
}
//Consulta para obtener los registros de la tabla
$queryString = "
    SELECT *, COUNT(*) OVER() as total_count
    FROM prueba.trabajador
    ORDER BY tra_ide ASC
";
$result = pg_query($dbconn, $queryString);//pg_query_params , [$limit, $start]);

if (!$result) {
    echo json_encode(['success' => false, 'message' => 'Error en la consulta de trabajadores.']);
    exit;
}

// Recopilar datos
$data = [];
$total = 0;

while ($row = pg_fetch_assoc($result)) {
    if ($total === 0) {
        $total = $row['total_count']; 
    }
    unset($row['total_count']); 
    $data[] = $row;
}

// Enviamos la respuesta
echo json_encode([
    "success" => true,
    "total" => (int) $total,
    "data" => $data
]);

pg_close($dbconn);
?>
