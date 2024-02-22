<?php
    include './connectdb.php';
    if(isset($_POST['btn-del']) && isset($_COOKIE['Type'])) {
        $url_img = mysqli_query($conn, "SELECT * FROM `roomtype` WHERE RoomTypeName = '".$_COOKIE['Type']."'")->fetch_assoc()["RoomTypeImages"]; 
         
        $listImgs = explode(',',$url_img);
        for ($i = 0; $i < 3; $i++) {
            unlink('../../assets/img/room/'. $listImgs[$i]);
        }
        mysqli_query($conn, "DELETE FROM `roomtype` WHERE RoomTypeName = '".$_COOKIE['Type']."'"); 
        Header("Location: ../../admin-roomtype.html"); 
    }
?>