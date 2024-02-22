<?php
    include './connectdb.php';
    $name = $_POST['service-name'];
    $price = $_POST['service-price'];
    $unit = $_POST['service-unit'];
    $note = $_POST['service-note'];

    if(isset($_FILES['service-file'])) {

        $img_name = $_FILES['service-file']['name'];
        $img_size = $_FILES['service-file']['size'];
        $tmp_name = $_FILES['service-file']['tmp_name'];
        $error = $_FILES['service-file']['error'];

        if ($error === 0) {
            $img_ex = pathinfo($img_name, PATHINFO_EXTENSION);
            $img_ex_lc = strtolower($img_ex);

            $allowed_exs = array("jpg", "jpeg", "png");
            if (in_array($img_ex_lc, $allowed_exs)) {
                $new_img_name = uniqid("IMG-", true).'.'.$img_ex_lc;
                $img_upload_path = '../../assets/img/service/'. $img_name;
                move_uploaded_file($tmp_name, $img_upload_path);
                mysqli_query($conn, "INSERT INTO `service`(`ServiceName`, `Unit`, `ServicePrice`, `ServiceNote`, `ServiceImage`) VALUES ('$name','$unit','$price','$note','$img_name')");
                header("Location: ../../admin-service.html");
            } else {
                $msg = "error";
                header("Location: ../../admin-service.html?error=$msg");
            }
        } else {
            echo "error!";
        } 
    }
?>
