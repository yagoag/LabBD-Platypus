<?php
	// session_start inicia a sessão
	session_start();
	// as variáveis login e senha recebem os dados digitados na página anterior
	$login = $_POST['login'];
	$senha = $_POST['senha'];

	require_once 'config.php';

	$sql = "SELECT * FROM Pessoa WHERE cpf = $login AND senha = $senha";
	$params = array();
	$options =  array( "Scrollable" => SQLSRV_CURSOR_KEYSET );
	$stmt = sqlsrv_query( $conn, $sql , $params, $options );
	$row_count = sqlsrv_num_rows( $stmt );
	if($row_count > 0 )
	{
		$_SESSION['login'] = $login;
		$_SESSION['senha'] = $senha;
		header('location:site1.php');
	}
	else
	{
		unset ($_SESSION['login']);
		unset ($_SESSION['senha']);
		echo "<h1>Falha no login</h1>";
		header('location:index.php');
	}
?>