<?php 
    $mode = 'dark';
    $greeting = 'Hello';
    $name = 'Dave';

    //Data TYoes
    $num = 42; #integer
    $dub = 42.02; #double
    $boo = true; #boolean
    $arr = array('a', 'b', 'c'); #array

    /* Variable cannot start with numbers, 
double underscores, can; tuse special words such as let */

    //OBJECTS
    define ('DAYS_IN_YEAR','365');
    $counter = 1;

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QuicK Intro to PHP</title>
    <link rel="stylesheet" href="main.css">
</head>
<body
<? if($mode === "dark") :?> class="dark"<? endif?>
    >
    <h1>
        <? "Hello {echo}! $name" ?>
</h1>
<p>
    <? echo $arr[2] ?>
</p>
<p>
    <? echo DAYS_IN_YEAR ?><br>
    <? echo DAYS_IN_YEAR + 1 ?><br>
    <? echo DAYS_IN_YEAR * 20 ?><br>
    <? echo DAYS_IN_YEAR % 2?><br>
    <? $counter++ ;
        echo $counter;
    ?>
</p>

//CONCATENATION
<p>
    <? 
    $greeting .= ", how are you?";
    echo $greeting. ',' .$name. '!' 
    ?>
</p>
</body>
</html>