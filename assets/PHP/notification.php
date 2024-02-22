<?php
    
    $get_news = mysqli_query($conn, "SELECT * FROM notification ORDER BY Id DESC LIMIT 20");
    $get_news_read = mysqli_query($conn, "SELECT * FROM notification WHERE Status = 0");
    $get_names = mysqli_query($conn, "SELECT * FROM customer c, notification n
                                WHERE  c.IdCustomer = n.IdCustomer ORDER BY n.Id DESC");
    $count_news = $get_news_read->num_rows;
    $count_names = $get_names->num_rows;
?>