<?php
error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING);

   $host        = "host = " . $argv[1];
   $port        = "port = " .  $argv[2];
   $dbname      = "dbname = " . $argv[3];
   $credentials = "user=" . $argv[4] . " password=" . $argv[5];

   $db = pg_connect( "$host $port $dbname $credentials"  );
   if(!$db) {
      echo "0";
   }

   $sql =<<<EOF
      select count(*) from pg_stat_activity_monitoring where state <> 'idle';
EOF;

   $ret = pg_query($db, $sql);
   if(!$ret) {
      echo pg_last_error($db);
      exit;
   } 
   while($row = pg_fetch_row($ret)) {
      echo "$row[0]";
   }
   pg_close($db);
?>
