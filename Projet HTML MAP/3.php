<?php
    $login= $_POST['login'];
    $mdp= $_POST['mdp'];

    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "fdf";


    // Create connection
    $conn = mysqli_connect($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    $sql = "SELECT * FROM compte WHERE USER like '".$login."' AND MDP like '".$mdp."'";
    $result = mysqli_query($conn, $sql);
    $row=mysqli_fetch_assoc($result);

    if (mysqli_num_rows($result) == 1) {
        session_start();

        $_SESSION['connected'] =true ;
        header('Location:Accueil-etreco.htm');
    } else {
        session_start();

        $_SESSION['connected'] =true ;
        header('Location:connexion-error.htm');
    }

    mysqli_close($conn);
?>

