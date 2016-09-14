<?php
	// session_start inicia a sessão
	session_start();
	require_once 'config.php';

	$sql = "SELECT * FROM Pessoa WHERE cpf = ".$_POST['cpf']." AND senha = ".$_POST['senha'];
	$params = array();
	$options =  array( "Scrollable" => SQLSRV_CURSOR_KEYSET );
	$stmt = sqlsrv_query( $conn, $sql , $params, $options );
	if (sqlsrv_has_rows($stmt))	{
		$_SESSION['cpf'] = $_POST['cpf'];
		header('location:papel.php');
	}
	else
	{
		unset ($_SESSION['login']);
		unset ($_SESSION['senha']);
		header('location:index.php?falha=1');
	}
?>