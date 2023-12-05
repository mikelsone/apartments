<?php
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
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT); 
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $full_name = mysqli_real_escape_string($conn, $_POST['full_name']);

    $sql = "INSERT INTO users (username, password, email, full_name) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);


    if ($stmt) {
        $stmt->bind_param("ssss", $username, $password, $email, $full_name);

        if ($stmt->execute()) {

            echo '<script>window.location.href = "dashboard.php";</script>';
            exit(); 
        } else {
        }

        $stmt->close();
    } else {
    }


    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <link rel="stylesheet" href="styles.css">

</head>
<body>
    <div class="container">
        <h2>User Registration Form</h2>
        <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
            <label for="username">Username:</label>
            <input type="text" name="username" required>

            <label for="password">Password:</label>
            <input type="password" name="password" required>

            <label for="email">Email:</label>
            <input type="email" name="email" required>

            <label for="full_name">Full Name:</label>
            <input type="text" name="full_name" required>

            <button type="submit">Register</button>
        </form>
        <p>Already have an account? <a href="login.html">Login here</a>.</p>
    </div>
</body>
</html>
