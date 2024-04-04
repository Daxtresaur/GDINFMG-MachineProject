<?php
// NOTE: Due to password discrepancy between two devices, check if your SQL password is the same as the $password value.
// For example, I have mine as "root" while another (boss Nathan probably) has none ("")

$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "mp";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get data sent from Unity
$teamID = $_POST['teamID'];
$characterFrames = $_POST['characterFrames'];
$leader = $_POST['leader'];
$element = $_POST['element'];

// Prepare and execute SQL query to update team data in table
$sql = "UPDATE `team builder` SET blue=' $characterFrames', red='$characterFrames', yellow='$characterFrames', leader='$leader', element='$element' WHERE id=$teamID";

if ($conn->query($sql) === TRUE) {
    echo "Team updated successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>