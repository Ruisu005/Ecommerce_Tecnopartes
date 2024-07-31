<?php
session_start();
if (!isset($_SESSION['user']['id'])) {
    header("Location: loginss.php");
    exit();
}

include 'includes/conn.php'; // Incluir el archivo de conexión

$user_id = $_POST['user_id'];
$payment_method = $_POST['payment_method'];
$sales_date = date('Y-m-d');

$pdo = new Database();
$conn = $pdo->open();

$sql = "INSERT INTO sales (user_id, pay_id, sales_date) VALUES (:user_id, :pay_id, :sales_date)";
$stmt = $conn->prepare($sql);

if ($stmt->execute(['user_id' => $user_id, 'pay_id' => $payment_method, 'sales_date' => $sales_date])) {
    echo "Venta registrada con éxito";
} else {
    echo "Error: No se pudo registrar la venta";
}

$pdo->close();
?>
