<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "mp";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$frame = $_POST["frame"];

$sql = "SELECT notes FROM `character notes` WHERE frame = '" . $frame . "'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo $row["notes"];
  }
} else {
  echo "0 results";
}
$conn->close();
?>