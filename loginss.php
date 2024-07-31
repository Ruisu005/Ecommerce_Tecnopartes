<?php
session_start();
include 'includes/conn.php'; // Incluir el archivo de conexión

$email = $_POST['email'];
$password = $_POST['password'];

$pdo = new Database();
$conn = $pdo->open();

// Consulta segura con preparación para evitar inyección SQL
$stmt = $conn->prepare("SELECT id, password FROM users WHERE email = :email");
$stmt->execute(['email' => $email]);
$user = $stmt->fetch();

if ($user) {
    // Verificar la contraseña
    if (password_verify($password, $user['password'])) {
        $_SESSION['user']['id'] = $user['id'];
        header("Location: index.php");
        exit();
    } else {
        echo "Contraseña incorrecta";
    }
} else {
    echo "Correo electrónico no encontrado";
}

$pdo->close();
?>
