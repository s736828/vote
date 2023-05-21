<?php
include_once "../db.php";
echo "<pre>";
print_r($_POST);
echo "</pre>";

$sql_chk_subject = "select count(*) from `topics` where subject='{$_POST['subject']}'";
// ↑用數量去查找subject主題名稱是否有相同名稱，↓fetchColumn()查有幾列
$chk = $pdo->query($sql_chk_subject)->fetchColumn();
if ($chk > 0) {
    echo "此主題已被使用過，請修改主題內容";
    echo "<a href='../back/add_vote.php'>返回新增主題</a>";
} else {
    $sql = "INSERT INTO `topics`(`subject`, `open_time`, `close_time`, `type`)
    VALUES ('{$_POST['subject']}','{$_POST['open_time']}','{$_POST['close_time']}','{$_POST['type']}')";
    $pdo->exec($sql);
}


$sql_subject_id = "select `id` from `topics` where `subject`='{$_POST['subject']}'";
// ↑寫一個SQL查詢語句，找topics資料表的id，範圍是新增的subject
// ↓執行查詢這個語句
$subject_id = $pdo->query($sql_subject_id)->fetchColumn();

echo $sql_subject_id;
echo "<br>";
echo $subject_id;
//若description不是空的就寫入description及subject_id
foreach ($_POST['description'] as $desc) {
    if ($desc != '') {
        $sql_option = "INSERT INTO `options`(`description`,`subject_id`)
                        VALUES('$desc','$subject_id')";
        $pdo->exec($sql_option);
    }
}
// header("location:../backend.php");
