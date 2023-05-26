<?php include_once "db.php"; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>驚奇投票所</title>
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
<header>
    <a href="index.php">首頁</a>
    <a href="index.php?do=result_list">結果</a>
    <?php
    // ↓用!none,如果沒有抓到login, 就顯示登入,註冊，有抓到就顯示登出
    if (!isset($_SESSION['login'])) {
    ?>
        <a href="index.php?do=login">登入</a>
        <a href="index.php?do=reg">註冊</a>
    <?php
    } else {
    ?>
        <a href="./api/logout.php">登出</a>
    <?php
        switch ($_SESSION['pr']) {
            case "super":
                echo "<a href='backend.php?do=super'>系統管理</a>";
                break;
            case "member":
                echo "<a href='backend.php?do=member'>會員中心</a>";
                break;
            case "admin":
                echo "<a href='backend.php?do=admin'>管理</a>";
                break;
        }
    }
    ?>
</header>
    <main>
        <ul>
            <?php
            if (isset($_SESSION['login']) && $_SESSION['pr']) {
                echo $_SESSION['login'];
                echo "-";
                echo $_SESSION['pr'];
            }

            // $do = (isset($_GET['do'])) ? $_GET['do'] : 'list';
            $do = ($_GET['do']) ?? 'list';
            $file = "./front/" . $do . ".php";

            if (file_exists($file)) {
                include $file;
            } else {
                include "./front/list.php";
            }
            ?>
        </ul>
    </main>
    <footer></footer>
</body>

</html>