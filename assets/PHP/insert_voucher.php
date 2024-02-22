<?php
    include './connectdb.php';

    $code = $_POST['code-voucher'];
    $percent = $_POST['percent'];
    $status = $_POST['radio-active'];
    $note = $_POST['voucher-note'];
    $minprice = $_POST['minprice'];
    $quan = $_POST['quantity'];

    if($status === "1") {
        $date = date("Y/m/d");
        mysqli_query($conn, "INSERT INTO `voucher`(`VoucherCode`, `Status`, `Percent`,`MinPrice`, `ActiveDate`, `Quantity`, `QuantityUsed`,`VoucherNote`) 
                        VALUES ('$code',1,'$percent','$minprice','$date', '$quan',0,'$note')");
    }
    else {
        mysqli_query($conn, "INSERT INTO `voucher`(`VoucherCode`, `Status`, `Percent`,`MinPrice`, `ActiveDate`, `Quantity`, `QuantityUsed`,`VoucherNote`) 
                        VALUES ('$code',0,'$percent','$minprice',null, '$quan',0,'$note')");
    }
    
   header("Location: ../../admin-voucher.html");    
?>