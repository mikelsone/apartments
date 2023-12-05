<?php

session_start();

if (!isset($_SESSION['user_id'])) {
    header("Location: login.html");
    exit();
}

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "apartment_booking";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}


$user_id = $_SESSION['user_id'];

if (isset($_POST['apartment_id']) && is_numeric($_POST['apartment_id'])) {
    $apartment_id = $_POST['apartment_id'];
} else {
    $response = ["success" => false, "message" => "Invalid apartment ID."];
    echo json_encode($response);
    exit();
}

$name = $_POST['name'] ?? '';
$email = $_POST['email'] ?? '';
$phone = $_POST['phone'] ?? '';
$checkin = $_POST['checkin'] ?? '';
$checkout = $_POST['checkout'] ?? '';

$sql = "INSERT INTO reservations (user_id, apartment_id, name, email, phone, checkin_date, checkout_date)
        VALUES (?, ?, ?, ?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("iisssss", $user_id, $apartment_id, $name, $email, $phone, $checkin, $checkout);

if ($stmt->execute()) {
    $response = ["success" => true, "message" => "Reservation successful!"];
} else {
    $response = ["success" => false, "message" => "Error during reservation."];
}

$stmt->close();
$conn->close();

echo json_encode($response);
?>
