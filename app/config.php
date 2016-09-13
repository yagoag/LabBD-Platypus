<?php
$connectionInfo = array("Database" => "LabBD", "CharacterSet" => "UTF-8");
$server = 'YAGO-XPS\SQLEXPRESS';

// Connect to MSSQL
$conn = sqlsrv_connect($server, $connectionInfo);

if (!$conn) {
    die('Something went wrong while connecting to SQLSrv');
}
?>