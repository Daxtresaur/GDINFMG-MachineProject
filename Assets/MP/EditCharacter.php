<?php
// NOTE: Due to password discrepancy between two devices, check if your SQL password is the same as the $password value.
// For example, I have mine as "root" while another (boss Nathan probably) has none ("")
error_reporting(E_ALL);
ini_set('display_errors', 1);

$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "mp";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

print_r($_POST);

$frame = $_POST['frame'];
$frameName = $_POST['frameName'];
$teamID = $_POST['teamID'];

$sql = "";
switch ($frame) {
    case "blue":
        $sql = "UPDATE `team builder` SET `blue` = '$frameName' WHERE id = $teamID";
        break;
    case "red":
        $sql = "UPDATE `team builder` SET `red` = '$frameName' WHERE id = $teamID";
        break;
    case "yellow":
        $sql = "UPDATE `team builder` SET `yellow` = '$frameName' WHERE id = $teamID";
        break;
    default:
        echo "Invalid frame value.";
        break;
}
$result = $conn->query($sql);

echo "SQL Query: " . $sql . "<br>";

if ($result === TRUE) {
    echo "Record updated successfully";
} else {
    echo "Error updating record: " . $conn->error;
}

$conn->close();
?>