<?php
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "mp";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql_max_id = "SELECT MAX(id) AS max_id FROM `team builder`";
$result_max_id = $conn->query($sql_max_id);

if ($result_max_id->num_rows > 0) {
    $row_max_id = $result_max_id->fetch_assoc();
    $new_id = $row_max_id["max_id"] + 1;
} else {
    $new_id = 1; // If the table is empty, start from 1
}

$sql_insert_team = "INSERT INTO `team builder` (id, blue, red, yellow, leader, score, element) VALUES ($new_id, 'Character 1', 'Character 2', 'Character 3', '', 0, 'Physical')";

if ($conn->query($sql_insert_team) === TRUE) {
    echo $new_id;
} else {
    echo "Error: " . $sql_insert_team . "<br>" . $conn->error;
}

$conn->close();
?>