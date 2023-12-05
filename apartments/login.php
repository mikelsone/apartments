<?php
session_start();

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "apartment_booking";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $enteredPassword = $_POST['password'];

    $sql = "SELECT * FROM users WHERE username = ?";
    $stmt = $conn->prepare($sql);

    if ($stmt) {
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $result = $stmt->get_result();
        $user = $result->fetch_assoc();

        if ($user && password_verify($enteredPassword, $user['password'])) {

            $_SESSION['user_id'] = $user['id'];
            header("Location: dashboard.php");
            exit();
        } else {
            echo "Invalid login credentials";
        }

        $stmt->close();
    } else {
        echo "Error in preparing the statement: " . $conn->error;
    }

    $conn->close();
}
?>
