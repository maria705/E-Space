<?php
session_start();
include "db.php";
if (isset($_SESSION["uid"])) {

	$f_name = $_POST["firstname"];
	$email = $_POST['email'];
	$address = $_POST['address'];
    $city = $_POST['city'];
    $state = $_POST['state'];
    $zip= $_POST['zip'];
    $cardname= $_POST['cardname'];
    $cardnumber= $_POST['cardNumber'];
    $expdate= $_POST['expdate'];
    $cvv= $_POST['cvv'];
    $user_id=$_SESSION["uid"];
    $cardnumberstr=(string)$cardnumber;
    $hashed_cardnumber = password_hash($cardnumberstr, PASSWORD_DEFAULT);
    $hashed_cvv = password_hash($cvv, PASSWORD_DEFAULT);
    $total_count=$_POST['total_count'];
    $prod_total = $_POST['total_price'];
    
    
    $sql0="SELECT order_id from `orders_info`";
    $runquery=mysqli_query($con,$sql0);
    if (mysqli_num_rows($runquery) == 0) {
        echo( mysqli_error($con));
        $order_id=1;
    }else if (mysqli_num_rows($runquery) > 0) {
        $sql2="SELECT MAX(order_id) AS max_val from `orders_info`";
        $runquery1=mysqli_query($con,$sql2);
        $row = mysqli_fetch_array($runquery1);
        $order_id= $row["max_val"];
        $order_id=$order_id+1;
        echo( mysqli_error($con));
    }

	$sql = "INSERT INTO `orders_info` 
	(`order_id`,`user_id`,`f_name`, `email`,`address`, 
	`city`, `state`, `zip`, `cardname`,`cardnumber`,`expdate`,`prod_count`,`total_amt`,`cvv`) 
	VALUES ($order_id, '$user_id','$f_name','$email', 
    '$address', '$city', '$state', '$zip','$cardname','$hashed_cardnumber','$expdate','$total_count','$prod_total','$hashed_cvv')";


    if(mysqli_query($con,$sql)){
        $i=1;
        $prod_id_=0;
        $prod_price_=0;
        $prod_qty_=0;
        while($i<=$total_count){
            $str=(string)$i;
            $prod_id_+$str = $_POST['prod_id_'.$i];
            $prod_id=$prod_id_+$str;		
            $prod_price_+$str = $_POST['prod_price_'.$i];
            $prod_price=$prod_price_+$str;
            $prod_qty_+$str = $_POST['prod_qty_'.$i];
            $prod_qty=$prod_qty_+$str;
            $sub_total=(int)$prod_price*(int)$prod_qty;
            $transaction_id = uniqid();
            $p_status = "Completed";
            $sql1="INSERT INTO `order_products` 
            (`order_pro_id`,`order_id`,`product_id`,`qty`,`amt`) 
            VALUES (NULL, '$order_id','$prod_id','$prod_qty','$sub_total')";
            if(mysqli_query($con,$sql1)){
                $update_sql = "UPDATE products SET product_quantity = product_quantity - $prod_qty WHERE product_id = $prod_id";
                if(mysqli_query($con,$update_sql)){
                        $del_sql="DELETE from cart where user_id=$user_id";
                    // echo"<script>window.location.href='store.php'</script>";
                    // exit();
                }else{
                    echo(mysqli_error($con));
                }
                // $ordersql="INSERT INTO `orders` 
                // (`order_id`,`user_id`,`product_id`,`qty`,`trx_id`,`p_status`) 
                // VALUES ('$order_id','$user_id','$prod_id','$prod_qty','$transaction_id','$p_status')";
                
                // if(mysqli_query($con,$ordersql)){
                // $del_sql="DELETE from cart where user_id=$user_id";
                // if(mysqli_query($con,$del_sql)){
                //         $del_sql="DELETE from cart where user_id=$user_id";
                //     // echo"<script>window.location.href='store.php'</script>";
                //     // exit();
                // }else{
                //     echo(mysqli_error($con));
                // }
                //   }
            }else{
                echo(mysqli_error($con));
            }
            $i++;


        }
        // Get the current date in YYYY-MM-DD format
        $current_date = date('Y-m-d');
        // $ordersql="INSERT INTO `orders` 
        // (`order_id`,`user_id`,`trx_id`,`p_status`) 
        // VALUES ('$order_id','$user_id','$transaction_id','$p_status')";
        $ordersql = "INSERT INTO `orders` 
            (`order_id`, `user_id`, `trx_id`, `p_status`, `order_date`) 
            VALUES ('$order_id', '$user_id', '$transaction_id', '$p_status', '$current_date')";
        if(mysqli_query($con,$ordersql)){
            $del_sql="DELETE from cart where user_id=$user_id";
            if(mysqli_query($con,$del_sql)){
                     header("Location: success.php?success=true");
                 // $del_sql="DELETE from cart where user_id=$user_id";
                // echo"<script>window.location.href='store.php'</script>";
                // exit();
            }else{
                echo(mysqli_error($con));
            }
        }
    }else{

        echo(mysqli_error($con));
        
    }
    
}else{
    echo"<script>window.location.href='index.php'</script>";
}
	




?>