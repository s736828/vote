<?php
$subjects = $pdo->query("select * from `topics`");

$logs = $pdo
        ->query("select * from `logs`")
        ->fetchAll(PDO::FETCH_ASSOC);


foreach ($subjects as $sub) {
    echo "<div>";
    echo "<a href='?do=vote_items&sub_id={$sub['id']}'>";
    echo $sub['subject'];
    echo "</a>";
    echo "</div>";
}
