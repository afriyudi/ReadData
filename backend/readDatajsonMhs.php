<?php
$mysqli = new mysqli("localhost","user","password","namaDB");
///   user, password dan namaDB di sesuaikan dengan buatan anda sendiri
if ($mysqli -> connect_errno) {
  echo "Failed to connect to MySQL: " . $mysqli -> connect_error;
  exit();
}


$myArray = array();
if ($result = $mysqli->query("SELECT * FROM mhs")) {
    $tempArray = array();
    while ($row = $result->fetch_object()) {
        $tempArray = $row;
        array_push($myArray, $tempArray);
    }
    echo json_encode($myArray);
}

$result->close();
$mysqli->close();

?>
