<?php include_once "../db.php";
// $chk=_count('members',['acc'=>$_POST['acc'],'pw'=>$_POST['pw']]);
$chk=$Member->count(['acc'=>$_POST['acc'],'pw'=>$_POST['pw']]);

if ($chk) {
    // $pr=find('members',['acc'=>$_POST['acc'],'pw'=>$_POST['pw']])['pr'];
    $pr=$Member->find(['acc'=>$_POST['acc'],'pw'=>$_POST['pw']])['pr'];

    $_SESSION['login'] = $_POST['acc'];
    $_SESSION['pr'] = $pr;

    if (isset($_SESSION['position'])) {
        to($_SESSION['position']);
        unset($_SESSION['position']);
        exit();
    }
    to("../index.php");
} else {
    to("../index.php?do=login&error=1");
}

echo $sql . "<br>";
echo $chk . "<br>";
echo $_SESSION['login'];
