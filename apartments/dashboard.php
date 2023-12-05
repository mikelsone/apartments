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

$sql = "SELECT * FROM apartments WHERE is_available = true";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apartment Booking</title>
    <link rel="stylesheet" href="styles.css">

</head>
<body>
    <div class="container">
        <h1>Available Apartments</h1>
        <br>

        <?php

        if ($result->num_rows > 0) {
            $apartments = $result->fetch_all(MYSQLI_ASSOC);
            foreach ($apartments as $apartment) {
                echo "<div class='available-apartment' onclick='openPopup(\"{$apartment['name']}\", \"{$apartment['description']}\", \"{$apartment['price']}\")'>";
                echo "<h3>{$apartment['name']}</h3>";
                echo "<p>{$apartment['description']}</p>";
                echo "<p>Price: {$apartment['price']} USD</p>";
                echo "<p>Status: Available</p>";

                echo "</div>";
            }
        } else {
            echo "<p>No apartments available at the moment.</p>";
        }

        $conn->close();
        ?>

        <div class="logout-link">
            <a href="logout.php">Logout</a>
        </div>
    </div>


    <div id="popup" class="popup">
        <div class="popup-content">
            <span class="close-btn" onclick="closePopup()">&times;</span>
            <h2 id="popup-name"></h2>
            <p id="popup-description"></p>
            <p id="popup-price"></p>

            <form id="reservation-form" onsubmit="submitReservation(event)">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="phone">Phone Number:</label>
                <input type="tel" id="phone" name="phone" required>

                <label for="checkin">Check-in Date:</label>
                <input type="date" id="checkin" name="checkin" required>

                <label for="checkout">Check-out Date:</label>
                <input type="date" id="checkout" name="checkout" required>

                <button type="submit">Submit Reservation</button>
            </form>

        </div>
    </div>

    <script>
        var currentApartmentIndex = 0;
        var apartments = <?php echo json_encode($apartments); ?>;

        function openPopup(name, description, price) {
            currentApartmentIndex = apartments.findIndex(apartment => apartment.name === name);
            updatePopupContent();
            document.getElementById("popup").style.display = "flex";
        }

        function closePopup() {
            document.getElementById("popup").style.display = "none";
        }

        function updatePopupContent() {
            var apartment = apartments[currentApartmentIndex];
            document.getElementById("popup-name").innerText = apartment.name;
            document.getElementById("popup-description").innerText = apartment.description;
            document.getElementById("popup-price").innerText = "Price: " + apartment.price + " USD";
        }

        function submitReservation(event) {
            event.preventDefault();

            var formData = new FormData(document.getElementById("reservation-form"));


            var apartment = apartments[currentApartmentIndex];


            if ('id' in apartment) {
                formData.append("apartment_id", apartment.id);
            } else {
                console.error("Apartment ID not found.");
                return;
            }


            fetch("process_reservation.php", {
                method: "POST",
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                alert(data.message);
                closePopup();
            })
            .catch(error => console.error("Error:", error));
        }
    </script>
</body>
</html>
