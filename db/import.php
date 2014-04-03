<?php

$i = 1;
foreach(file('measurements') as $line) {
    list($name, $abbr) = explode(":", trim($line));
    echo "echo \"INSERT INTO feedme.measurement values ($i, '$name', '$abbr');\"|psql\n";
    $i++;
}
