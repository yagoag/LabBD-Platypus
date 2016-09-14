<!-- na primeira linha usaremos o “action=ope.php” para que o 
formulário repasse as informações para a pagina ope.php -->
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
  <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
  <link rel="stylesheet" href="platypus.css">
</head>
<body>
  <div id="login-form">
    <?php if (array_key_exists('falha', $_GET)) { ?> <p>Houve uma falha no login. Tente novamente.</p> <?php } ?>
    <form class="pure-form" method="post" action="ope.php">
      <h1>Login</h1>
      <fieldset class="pure-group">
          <input type="text" class="pure-input-1-2" placeholder="CPF" name="cpf">
          <input type="password" class="pure-input-1-2" placeholder="Senha" name="senha">
      </fieldset>
      <button type="submit" class="pure-button pure-input-1-2 pure-button-primary">Entrar</button>
	</form>
  </div>
</body>
</html>