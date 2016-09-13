<?php
$server = 'DESKTOP-0ITTBBB\SQLEXPRESS';
$connectionInfo = array("Database" => "LabBD", "CharacterSet" => "UTF-8");
// Connect to MSSQL
$conn = sqlsrv_connect($server, $connectionInfo);
if (!$conn) {
    die('A conexao com SQL_SERVER nao funcionou corretamente.');
}
?>