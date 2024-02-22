<?php
    include './connectdb.php';
    $score = $_POST['rate'];
    $text = $_POST['text-review'];
    if (isset($_COOKIE['nameLogin']) && isset($_COOKIE['emailLogin'])) {
        $name = $_COOKIE['nameLogin'];
        $email = $_COOKIE['emailLogin'];
        $cus_email = mysqli_query($conn, "SELECT COUNT(CustomerEmail) as SL_Email FROM `customer` WHERE CustomerEmail = '".$email."'");
        if ((int)$cus_email->fetch_assoc()['SL_Email'] === 0) {
            header("Location: ../../home.html?error=0");    
        }
        else {
            $com_email = mysqli_query($conn, "SELECT COUNT(Email) as SL FROM `comment` WHERE Email = '".$email."'");
            if ((int)$com_email->fetch_assoc()['SL'] === 3) {
                header("Location: ../../home.html?error=1");    
            } else {
                mysqli_query($conn, "INSERT INTO `comment`(`Id`, `UserName`, `Email`, `Score`, `Text`) VALUES ('0','$name','$email','$score','$text')");
                header("Location: ../../home.html#review");    
            }
        }
    }
?>