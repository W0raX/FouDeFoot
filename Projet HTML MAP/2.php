<?php

    $log= $_POST['log'];
    $mot=$_POST['mot'];

    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "fdf";


    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    $sql2 = "SELECT * FROM compte WHERE user like '".$log."'";
    $result = mysqli_query($conn, $sql2);
    $row=mysqli_fetch_assoc($result);
    if(!empty($log) && !empty($mot) && isset($log) && isset($mot) && mysqli_num_rows($result) == 0){
            $sql = "INSERT INTO compte (user, mdp) VALUES ('$log', '$mot')";

    if ($conn->query($sql) === TRUE) {
		session_start();

        $_SESSION['connected'] =true ;
        header('Location:bien-joue.htm');
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
    }
    else{
		session_start();

        $_SESSION['connected'] =true ;
        header('Location:inscription-error.htm');
    }
    $conn->close();
?>
