<?php
    include './connectdb.php';
    $code = $_POST['code-voucher-upd'];
    $percent = $_POST['percent-upd'];
    $note = $_POST['voucher-note-upd'];
    $minprice = $_POST['minprice-upd'];
    $quan = $_POST['quantity-upd'];
    
    mysqli_query($conn, "UPDATE voucher SET Percent = '".$percent."', VoucherNote = '".$note."', MinPrice = '".$minprice."', Quantity = '".$quan."' WHERE VoucherCode = '".$code."'");
    header("Location: ../../admin-voucher.html");
?>