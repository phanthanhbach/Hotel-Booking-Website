<?php
    include './connectdb.php';
    
    
    $room_name = $_POST['room-name-update'];
    $room_type = $_POST['room-type-update'];
    $room_status = $_POST['radio-status']; 
    $room_note = $_POST['room-note-update'];
    
    if (isset($_POST['btn-save-update'])) {
        mysqli_query($conn, "UPDATE `room` SET `RoomTypeName`='$room_type',`Status`='$room_status',`RoomNote`='$room_note'
                                         WHERE '".$room_name."' = `RoomName`");

        $data = mysqli_query($conn, "SELECT RoomTypeName,COUNT(RoomTypeName) SL FROM room GROUP BY RoomTypeName");
        while($row = $data->fetch_assoc()) {
            mysqli_query($conn, "UPDATE roomtype SET RoomQuantity = '".$row['SL']."' WHERE RoomTypeName = '".$row['RoomTypeName']."'");
        }
    }
    Header("Location: ../../admin-room.html");

?>