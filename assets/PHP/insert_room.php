<?php
    include './connectdb.php';

    $name = $_POST['room-name'];
    $type = $_POST['room-type'];
    $status = $_POST['radio-status-add'];
    $note = $_POST['room-note'];
    $status1 = (int)$status;
    // echo $status;
    mysqli_query($conn,"INSERT INTO `room`(`RoomName`, `RoomTypeName`, `Status`, `RoomNote`) 
                                    VALUES ('$name','$type','$status1','$note')");
    mysqli_query($conn, "UPDATE `roomtype` SET RoomQuantity = RoomQuantity + 1 WHERE '".$type."' = `RoomTypeName`");
   
    header("Location: ../../admin-room.html");    
?>