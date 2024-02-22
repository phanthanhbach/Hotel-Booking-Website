<?php
    include './connectdb.php';
    $name = $_POST['roomtype-name'];
    $size = $_POST['roomtype-size'];
    $des = $_POST['roomtype-des'];
    $price = $_POST['roomtype-price'];
    $imgs = $_FILES['roomtype-file'];

    $fileCount = count($imgs["name"]);
    $arr = array();

    for ($i = 0; $i < $fileCount; $i++) {
        array_push($arr, $imgs["name"][$i]);
        $img_upload_path = '../../assets/img/room/'. $imgs["name"][$i];
        move_uploaded_file($imgs['tmp_name'][$i], $img_upload_path);
    }
    $listImgs = implode(",", $arr);
    mysqli_query($conn, "INSERT INTO `roomtype`(`RoomTypeName`, `RoomQuantity`, `RoomTypeSize`, `RoomDescription`, `RoomTypePrice`, `RoomTypeImages`) 
                        VALUES ('$name',0,'$size','$des','$price','$listImgs')");
    header("Location: ../../admin-roomtype.html");

?>