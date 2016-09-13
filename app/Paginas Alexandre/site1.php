<!DOCTYPE html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>PROGRAD</title>
  <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
</head>
  <?php  
    /* esse bloco de código em php verifica se existe a sessão, pois o usuário pode simplesmente não fazer o 
    login e digitar na barra de endereço do seu navegador o caminho para a página principal do site (sistema), 
    burlando assim a obrigação de fazer um login, com isso se ele não estiver feito o login não será criado 
    a session, então ao verificar que a session não existe a página redireciona o mesmo para a index.php.*/
    session_start(); // Iniciar as variaveis de sessao
    require_once 'config.php';
    if((!isset ($_SESSION['login']) == true) and (!isset ($_SESSION['senha']) == true))
    {
    	unset($_SESSION['login']);
    	unset($_SESSION['senha']);
    	header('location:index.php');
    }
    $login = $_SESSION['login'];
    $senha = $_SESSION['senha'];
    $sql = " SELECT * FROM Pessoa WHERE cpf = '$login' AND senha = '$senha' ";
    $stmt = sqlsrv_query( $conn, $sql);
    
    $a = sqlsrv_fetch_array($stmt);
    $logado = $a['preNome'] . ' ' . $a['sobreNome'];


    $sql  = " SELECT * FROM Aluno WHERE cpf = '$login'";
    $stmt = sqlsrv_query( $conn, $sql);
    $a = sqlsrv_fetch_array($stmt);
    $_SESSION['ra'] = $a['ra'];
    if (is_null($_SESSION['ra'])) {
      unset($_SESSION['login']);
      unset($_SESSION['senha']);
      header('location:site.php');
    }
  ?>
<body>
  <table width="800" height="748" border="1">
    <tr>
      <td height="90" colspan="2" bgcolor="#CCCCCC"><h3>Painel do Aluno</h3>

        <?php 
  	     echo" Bem vindo $logado";
  	    ?>
        <div class="pure-menu pure-menu-horizontal">
            <a href="#" class="pure-menu-heading pure-menu-link">Cabeçalho</a>
            <ul class="pure-menu-list">
                <li class="pure-menu-item"><a href="informacaoPessoalAluno.php" class="pure-menu-link">Infomações pessoais</a></li>
                <li class="pure-menu-item"><a href="historicoAluno.php" class="pure-menu-link">Histórico</a></li>
                <li class="pure-menu-item"><a href="deferimento.php" class="pure-menu-link">Deferimento</a></li>
                <li class="pure-menu-item"><a href="inscricoesEmTurma.php" class="pure-menu-link">Inscrições em turma</a></li>
                <li class="pure-menu-item"><a href="planoDeEnsino.php" class="pure-menu-link">Planos de Ensino</a></li>
                <li class="pure-menu-item"><a href="historicoDeDisciplinas.php" class="pure-menu-link">Histórico de disciplinas</a></li>
            </ul>
        </div>
      </td>
    </tr>
    <tr>
      <td width="103" height="410" bgcolor="#CCCCCC">MENU AQUI</td>
      <td width="546">CONTEUDO E ICONES AQUI</td>
    </tr>
    <tr>
      <td colspan="2" bgcolor="#000000"> </td>
    </tr>
  </table>
</body>
</html>