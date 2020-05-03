<?php
    session_start();
    if(!isset($_SESSION['connected'])){
        header('Location:index.htm');
    }
?>
<html>
    <head>

    </head>
    <body>
    <a href="6.php">Deconnexion</a>
    <h3>Saison 1</h3>
    <?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "serie";
    $lien="lien";
    // Create connection
    $conn = mysqli_connect($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    $sql = "SELECT $lien, episode, id FROM saison1";
    $result = mysqli_query($conn, $sql);
    $row=mysqli_fetch_assoc($result);

    $sql2 = "SELECT $lien, episode, id FROM saison2";
    $result2 = mysqli_query($conn, $sql2);
    $row2=mysqli_fetch_assoc($result2);
    $i=0;
    if ($result->num_rows >0) {
        // output data of each row
        while($row = $result->fetch_assoc()) {
            $i=$i+1;
            echo"<a href='5.php?nom=$i'>". $row['episode']."</a><br/>";
        }
    }
    ?>
    <h3>Saison 2<h3>
    <?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "serie";
    $lien="lien";
    // Create connection
    $conn = mysqli_connect($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    $sql = "SELECT $lien, episode, id FROM saison1";
    $result = mysqli_query($conn, $sql);
    $row=mysqli_fetch_assoc($result);

    $sql2 = "SELECT $lien, episode, id FROM saison2";
    $result2 = mysqli_query($conn, $sql2);
    $row2=mysqli_fetch_assoc($result2);
    $a=4;
    $b=0;
    if ($result2->num_rows >0) {
        // output data of each row
        while($row2 = $result2->fetch_assoc()) {
            $a=$a+1;
            $b=$b+1;
            echo"<a href='5.php?nom=$a&amp;bat=$b'>". $row2['episode']."</a><br/>";
        }
    }
    ?>
    </body>
</html>
