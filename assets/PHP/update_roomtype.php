<?php
    include './connectdb.php';
    if (isset($_COOKIE['old_name']) && isset($_COOKIE['old_url'])) {
        $name = $_POST['roomtype-upd-name'];
        $size = $_POST['roomtype-upd-size'];
        $price = $_POST['roomtype-upd-price'];
        $des = $_POST['roomtype-upd-des'];
        $imgs = $_FILES['roomtype-upd-file'];
      
        $fileCount = count($imgs["name"]);
        if ($fileCount === 3) {
            $arr = array();
            for ($i = 0; $i < $fileCount; $i++) {
                array_push($arr, $imgs["name"][$i]);
                $img_upload_path = '../../assets/img/room/'. $imgs["name"][$i];
                move_uploaded_file($imgs['tmp_name'][$i], $img_upload_path);
            }
            $listImgs = implode(",", $arr);
            mysqli_query($conn,"UPDATE `roomtype` SET `RoomTypeName`='$name',`RoomTypeSize`='$size',`RoomDescription`='$des',`RoomTypePrice`='$price',`RoomTypeImages`='$listImgs' 
                                WHERE RoomTypeName = '".$_COOKIE['old_name']."'");
        } else {
            mysqli_query($conn,"UPDATE `roomtype` SET `RoomTypeName`='$name',`RoomTypeSize`='$size',`RoomDescription`='$des',`RoomTypePrice`='$price'
                                WHERE RoomTypeName = '".$_COOKIE['old_name']."'");
        }
        
    }
    Header("Location: ../../admin-roomtype.html");
?>