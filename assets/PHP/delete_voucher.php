<?php
    include './connectdb.php';
    if (isset($_POST['btn-del'])) {
        if (isset($_COOKIE['code'])) {
            mysqli_query($conn, "DELETE FROM `voucher` WHERE VoucherCode = '".$_COOKIE['code']."'");
        }
    }
    Header("Location: ../../admin-voucher.html");
    
?>