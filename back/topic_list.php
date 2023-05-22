<ul class="topic-list">
    <li class="list-row">
        <div class="list-item-title">主題</div>
        <div class="list-item-title">狀態</div>
        <div class="list-item-title">期間</div>
        <div class="list-item-title">投票數</div>
        <div class="list-item-title">操作</div>
    </li>
    <?php
    $sql = "SELECT `topics`.*,sum(`options`.`total`) as 總計 
FROM `topics`,`options` 
WHERE `topics`.`id`=`options`.`subject_id` 
GROUP BY `topics`.`id`;";

    $rows = $pdo->query($sql)->fetchAll(PDO::FETCH_ASSOC);
    foreach ($rows as $row) {
    ?>
        <li class="list-row">
            <div class="list-item"><?= $row['subject']; ?></div>
            <div class="list-item">
                <?php
                $now = strtotime('now');
                $open = strtotime($row['open_time']);
                $close = strtotime($row['close_time']);
                if ($now < $open) {
                    echo "<div class='await'>未開始</div>";
                } else if ($now >= $open && $now <= $close) {
                    echo "<div class='in-process'>投票中</div>";
                } else {
                    echo "<div class='finish'>已截止</div>";
                }

                ?>
            </div>
            <div class="list-item">
                <?= $row['open_time'] . "~" . $row['close_time']; ?>
            </div>
            <div class="list-item">
                <?= $row['總計'] ?>
            </div>
            <div class="list-item">
                <!-- 以下兩個onclick給id傳出去↓ -->
                <button onclick="location.href='./backend.php?do=edit_vote&id=<?= $row['id']; ?>'">編輯</button>
                <!-- 不需用a連結也能導入↑， -->
                <button onclick="location.href='./back/del_vote.php?id=<?= $row['id']; ?>'">刪除</button>
                <button onclick="location.href='./back/open.php?id=<?= $row['id']; ?>'">立即上線</button>
                <button onclick="location.href='./back/close.php?id=<?= $row['id']; ?>'">立即結束</button>
                <button onclick="location.href='./backend.php?do=result&id=<?= $row['id']; ?>'">投票結果</button>
            </div>
        </li>
    <?php
    }
    ?>
</ul>