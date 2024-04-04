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

$sql = "SELECT * FROM `team builder`";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
      echo 
      $row["id"]. "," . 
      $row["blue"]. "," . 
      $row["red"]. "," .
      $row["yellow"]. "," . 
      $row["leader"]. "," .
      $row["score"]. "," .
      $row["element"]. "\n";
    }
} 
else {
    echo "0 results";
}

$conn->close();

?>