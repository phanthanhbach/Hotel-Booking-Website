<?php
    include './connectdb.php';
 
    if (isset($_COOKIE['old_name']) && isset($_COOKIE['old_url'])) {
        $name = $_POST['service-name-update'];
        $price = $_POST['service-price-update']; 
        $unit = $_POST['service-unit-update'];
        $note = $_POST['service-note-update'];
        $img_name = $_FILES['service-file-update']['name'];
        $tmp_name = $_FILES['service-file-update']['tmp_name'];

        if ($img_name !== $_COOKIE['old_url']) {
            $img_upload_path = '../../assets/img/service/'. $img_name;
            move_uploaded_file($tmp_name, $img_upload_path);
            unlink('../../assets/img/service/'. $_COOKIE['old_url']);
        }
        // echo $img;
        mysqli_query($conn, "UPDATE `service` SET `ServiceName`='$name',`Unit`='$unit',`ServicePrice`='$price',`ServiceNote`='$note',`ServiceImage`='$img_name'
                     WHERE `ServiceName` = '".$_COOKIE['old_name']."'");
        
    }
    Header("Location: ../../admin-service.html");
?>