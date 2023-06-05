<h1>投票</h1>
<?php

// topics資料表查找範圍是id=接傳送的id↓
// $topic = find('topics', $_GET['id']);
// $topic=$Topic->find($_GET['id']);
$Subject=new Subject;
$topic=$Subject->find($_GET['id']);

if ($topic->login == 1) {
    if (!isset($_SESSION['login'])) {
        $_SESSION['position'] = "/index.php?do=vote&id={$_GET['id']}";
        to("index.php?do=login&msg=1");
    }
}

// $options = all('options', ['subject_id' => $_GET['id']]);
// $options=$Option->all(['subject_id' => $_GET['id']]);
?>
<h2><?= $topic->subject ?></h2>

<?php
if (!empty($topic->image)) {
    echo "<img src='./upload/{$topic->image}' style='width: 450px; height:300px'>";
}
?>
<form action="./api/vote.php" method="post">
    <ul>
        <?php
        foreach ($options as $idx => $opt) {
            echo "<li>";
            switch ($topic['type']) {
                case 1:
                    echo "<input type='radio' name='desc' value='{$opt['id']}'>";
                    break;
                case 2:
                    echo "<input type='checkbox' name='desc[]' value='{$opt['id']}'>";
                    break;
            }
            echo "<span>" . ($idx + 1) . ".</span>";
            echo "<span>{$opt['description']}</span>";
            echo "</li>";
        }
        ?>
    </ul>
    <div>
        <input type="hidden" name="subject_id" value="<?= $_GET['id']; ?>">
        <input type="submit" value="投票">
        <input type="button" value="取消">
    </div>
</form>