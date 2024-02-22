<?php
    include './connectdb.php';
    $name = $_POST['guest-name'];
    $phone = $_POST['guest-phone'];
    $email = $_POST['guest-mail'];
    $time = $_POST['guest-time'];
    $type = 0;
    if ($time >= 5) {
        $type = 1;
    }
    mysqli_query($conn, "INSERT INTO `customer`(`IdCustomer`, `CustomerName`, `CustomerPhone`, `CustomerEmail`, `AmountOfBooking`, `CustomerType`) 
    VALUES ('0','$name','$phone','$email', '$time' , '$type')");
    header("Location: ../../admin-customer.html"); 
?>