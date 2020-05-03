<?php
    session_start();
    if(!isset($_SESSION['connected'])){
        header('Location:streaming.html');
    }
?>
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


$episode = $_GET['nom'];

if($episode<=4){
    echo"<video controls src='" . $episode . ".mp4'>Ici la description alternative</video><br/>";
    echo'<a class="gros"href="4.php">Retour</a><br/>';
}

if($episode>4){
    echo"<video controls src='" . $episode . ".mp4'>Ici la description alternative</video><br/>";
    echo'<a class="gros"href="4.php">Retour aux épisodes</a><br/>';
    }
if($episode>8){
    header('Location:4.php');
}
?>
