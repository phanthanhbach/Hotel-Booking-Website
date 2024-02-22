<?php
    include './connectdb.php';
    if (isset($_POST['btn-del'])) {
        if (isset($_COOKIE['roomname']) && isset($_COOKIE['roomtype'])) {
            mysqli_query($conn, "DELETE FROM `room` WHERE RoomName = '".$_COOKIE['roomname']."'");
            mysqli_query($conn, "UPDATE `roomtype` SET RoomQuantity = RoomQuantity - 1 WHERE RoomTypeName = '".$_COOKIE['roomtype']."'");
        }
    }
    Header("Location: ../../admin-room.html");
    
?>