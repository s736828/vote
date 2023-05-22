<?php include_once "../db.php";
unset($_SESSION['login']); //把session清掉

header("location:../index.php");
?>