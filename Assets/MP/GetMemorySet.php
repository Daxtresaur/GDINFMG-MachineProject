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

$frame = $_POST["frame"];

$sql = "SELECT * FROM `memory set` WHERE frame = '" . $frame . "'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo  
    $row["id"]. "~" . 
    $row["memory1"]. "~" . 
    $row["memory2"]. "~",
    $row["memory3"]. "~" . 
    $row["top"]. "~" . 
    $row["bottom"]. "~" . 
    $row["mUsage"]. "~" . 
    $row["notes"]. "\\";
  }
} else {
  echo "0 results";
}
$conn->close();
?>