<?php include_once "../db.php";
$row = $pdo->query("select * from `topics` where id='{$_GET['id']}'")->fetch(PDO::FETCH_ASSOC);
?>

<h3>您確定要刪除以下這個投票主題及相關的資料嗎?</h3>
<div><?= $row['subject'];?></div>

<div>
    <button onclick="location.href='../api/del_vote.php?id=<?= $_GET['id']; ?>'">確定刪除</button>
    <!--導到api並傳送id值↑，回後台首頁↓ -->
    <button onclick="location.href='../backend.php'">取消</button>
</div>