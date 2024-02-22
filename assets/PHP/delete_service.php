<?php
    include './connectdb.php';
    if(isset($_POST['btn-del']) && isset($_COOKIE['ServiceName'])) {
        $url_img = mysqli_query($conn, "SELECT * FROM `service` WHERE ServiceName = '".$_COOKIE['ServiceName']."'")->fetch_assoc()["ServiceImage"]; 
        unlink('../../assets/img/service/'. $url_img);
        // echo $url_img;
        mysqli_query($conn, "DELETE FROM `service` WHERE ServiceName = '".$_COOKIE['ServiceName']."'"); 
        Header("Location: ../../admin-service.html"); 
    }
?>