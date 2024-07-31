<?php
include '../conn.php'; // Incluye la conexión a la base de datos

$product_id = isset($_GET['product_id']) ? intval($_GET['product_id']) : 0;
$user_id = $_SESSION['user_id']; // Asegúrate de que el ID del usuario esté almacenado en la sesión

if ($product_id > 0 && $user_id > 0) {
    $stmt = $conn->prepare("INSERT INTO product_views (product_id, user_id, view_count) VALUES (:product_id, :user_id, 1) ON DUPLICATE KEY UPDATE view_count = view_count + 1");
    $stmt->execute(['product_id' => $product_id, 'user_id' => $user_id]);
}
?>
