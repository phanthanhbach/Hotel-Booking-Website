<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "aloha";
    
    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    mysqli_set_charset($conn,'utf8'); // Truy xuất tiếng việt
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
?>