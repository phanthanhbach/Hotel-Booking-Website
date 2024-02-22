<?php
    include './connectdb.php';

    $name = $_POST['fullname'];
    $phone = $_POST['phone'];
    $email = $_POST['email'];
    date_default_timezone_set('Asia/Ho_Chi_Minh');
    $date = date('y-m-d h:i:s');
    $quantity_room = $_POST['number-room'];
    $room_type = $_POST['type-room-register'];
    $checkin_date = $_POST['checkin'];
    $checkout_date = $_POST['checkout'];
    $number = $_POST['number-room'];
    
    $customer_rows = mysqli_query($conn, "SELECT AmountOfBooking FROM CUSTOMER WHERE CustomerPhone = '".$phone."'");  
    $count_phone = mysqli_query($conn, "SELECT COUNT(CustomerPhone) as SL_Phone FROM `customer` WHERE CustomerPhone = '".$phone."'");
    $count_email = mysqli_query($conn, "SELECT COUNT(CustomerPhone) as SL_Email FROM `customer` WHERE CustomerEmail = '".$email."'");
    
    $user_email = ''; 
    if (isset($_POST['submit_room']) && isset($_COOKIE['total'])){
        // lưu người dùng mới xuống database table account
        if (isset($_COOKIE['flagLogin']) && isset($_COOKIE['emailLogin']) && isset($_COOKIE['nameLogin'])) {
            //nếu đã đăng nhập
            if ($_COOKIE['flagLogin'] === '1') {
                $user_email = $_COOKIE['emailLogin'];
                $user_name = $_COOKIE['nameLogin'];
                $data = mysqli_query($conn, "SELECT COUNT(Email) SL FROM account WHERE Email = '".$user_email."'");
                if ($data->fetch_assoc()['SL'] === '0') {
                    // thêm thông tin tài khoản mới
                    mysqli_query($conn, "INSERT INTO `account`(`Email`, `Name`) VALUES ('$user_email','$user_name')");
                }
            }           
        }
        // set ràng buộc còn mã giảm giá ko? + lưu thông tin tài khoản đã sử dụng voucher
        if (isset($_COOKIE['isChecked'])) {
            $isChecked = $_COOKIE['isChecked'];
            if ($isChecked === '1') {
                $voucher_code = $_POST['radio-voucher'];
                // thêm dữ liệu người xài voucher
                mysqli_query($conn, "INSERT INTO `using_voucher`(`VoucherCode`, `Email`, `UsingDate`) VALUES ('$voucher_code','$user_email','$date')");

                // update số lượng voucher đã xài
                $data_quan_used = mysqli_query($conn, "SELECT QuantityUsed FROM voucher WHERE VoucherCode = '".$voucher_code."'");
                $data_quan = mysqli_query($conn, "SELECT Quantity FROM voucher WHERE VoucherCode = '".$voucher_code."'");
                $q1 = (int)$data_quan->fetch_assoc()["Quantity"];
                $q2 = (int)$data_quan_used->fetch_assoc()["QuantityUsed"];
                if ($q2 < $q1) {
                    mysqli_query($conn, "UPDATE voucher SET QuantityUsed = QuantityUsed + 1 WHERE VoucherCode = '".$voucher_code."'");
                }
            }
        }
        // lưu dữ liệu xuống table Customer           
        // chưa có trong database
        if ((int)$count_phone->fetch_assoc()['SL_Phone']  < 1 || (int)$count_email->fetch_assoc()['SL_Email'] < 1) {
            mysqli_query($conn, "INSERT INTO `customer`(`IdCustomer`, `CustomerName`, `CustomerPhone`, `CustomerEmail`, `AmountOfBooking`, `CustomerType`) 
            VALUES ('0','$name','$phone','$email', 1 , 0)");
        }
        // đã tồn tại
        else {
            $row = $customer_rows->fetch_assoc(); 
            if($row["AmountOfBooking"] >= 4) {
                mysqli_query($conn, "UPDATE customer SET CustomerType = 1 WHERE CustomerPhone = '".$phone."'");
            }
            mysqli_query($conn, "UPDATE customer SET AmountOfBooking = AmountOfBooking + 1 WHERE CustomerPhone = '".$phone."' AND CustomerEmail = '".$email."'");
        }

        // Lưu dữ liệu xuống table notification
        $id_customer_row = mysqli_query($conn,"SELECT IdCustomer FROM customer WHERE CustomerPhone = '".$phone."'");
        $row1 = $id_customer_row->fetch_assoc()["IdCustomer"]; // lấy ra IdCustomer để insert khóa ngoại cho dữ liệu của bảng noti

        // Lưu dữ liệu xuống table invoice_room
        $roomtype_rows = mysqli_query($conn, "SELECT * FROM roomtype WHERE RoomTypeName = '".$room_type."'"); 
        $roomtype_price = $roomtype_rows->fetch_assoc()["RoomTypePrice"];
        
        $total = $_COOKIE['total'];
        mysqli_query($conn, "INSERT INTO `invoice_room`(`IdInvoiceRoom`, `IdCustomer`, `InvoiceRoomDate`, `InvoiceRoomTotal`) 
                                            VALUES (0,'$row1',null,'$total')");

        // Lưu dữ liệu xuống table invoice_room_detail
        $last_idinvoiceroom = mysqli_insert_id($conn); 
        $temp = -999;

        for ($i = 0; $i < $quantity_room; $i++) {
            $temp_name = (string)$temp;
            mysqli_query($conn,"INSERT INTO `invoice_room_detail`(`IdInvoiceRoomDetail`,`IdInvoiceRoom`, `RoomName`, `RoomTypeName`, `RoomPrice`, `ReservationDate`, `CheckinDate`, `CheckoutDate`) 
                                                    VALUES ('0','$last_idinvoiceroom','$temp_name','$room_type','$roomtype_price','$date', '$checkin_date','$checkout_date')");
            $temp = $temp + 1;
        }

        // Lưu dữ liệu xuống table notification
        mysqli_query($conn,"INSERT INTO `notification`(`Id`, `IdCustomer`, `IdInvoiceRoom`, `QuantityRoom`, `RoomType`, `Date`, `Status`) VALUES ('0','$row1', ' $last_idinvoiceroom', '$quantity_room','$room_type','$date',0)"); 
        
    };

   header("Location: ../../home.html"); 
?>



