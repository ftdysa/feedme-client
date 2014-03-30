<?php

$i = 1;
foreach(file('measurements') as $line) {
    list($name, $abbr) = explode(":", trim($line));
    echo "echo \"INSERT INTO measurement values ($i, '$name', '$abbr');\"|psql feedme\n";
    $i++;
}
