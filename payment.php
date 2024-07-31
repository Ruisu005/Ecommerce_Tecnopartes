<?php
session_start();
if (!isset($_SESSION['user']['id'])) {
    header("Location: loginss.php");
    exit();
}

include 'includes/header.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pantalla de Pago</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 p-6">
<div class="container mx-auto">
    <h1 class="text-2xl font-bold mb-4">Pantalla de Pago</h1>
    <form action="processPayment.php" method="POST" class="bg-white p-6 rounded shadow-md">
        <input type="hidden" name="user_id" value="<?php echo $_SESSION['user']['id']; ?>">
        <div class="mb-4">
            <label for="payment_method" class="block text-sm font-medium text-gray-700">Método de Pago</label>
            <select id="payment_method" name="payment_method" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm" required>
                <option value="paypal">PayPal</option>
                <option value="credit_card">Tarjeta de Crédito</option>
                <option value="debit_card">Tarjeta de Débito</option>
            </select>
        </div>
        <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded">Continuar</button>
    </form>
</div>
</body>
</html>
