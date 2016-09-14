<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
  <link rel="stylesheet" href="platypus.css">
</head>
<body>
<div id="layout">
    <div id="menu">
        <?php require 'menu.php'; ?>
    </div>

    <div id="main">
<?php
require_once 'config.php';
?>
<div class="pure-g">
    <div class="pure-u-3-24"><p>Nome</p></div>
    <div class="pure-u-3-24"><p>Sobrenome</p></div>
    <div class="pure-u-3-24"><p>Data de Inicio</p></div>
    <div class="pure-u-3-24"><p>Data de Término</p></div>
    <div class="pure-u-6-24"><p>Indicação</p></div>
    <div class="pure-u-6-24"><p>Motivo</p></div>
</div>

<?php
  $stmt = sqlsrv_query($conn, "SELECT * FROM vlicencasFuncionarios WHERE siape = '".$_SESSION['siape']."'");
  while ($a = sqlsrv_fetch_array($stmt)) {
    echo '<form class="pure-form pure-form-stacked" method="post" action="licencasFuncionarios.php">
              <fieldset>
                  <div class="pure-g">
                      <div class="pure-u-3-24">
                          <input name="preNome" class="pure-u-23-24" readonly type="text"  value="'.($a['preNome']).'">
                      </div>
                      <div class="pure-u-3-24">
                          <input name="sobreNome" class="pure-u-23-24" readonly type="text" value="'.($a['sobreNome']).'">
                      </div>
                      <div class="pure-u-3-24">
                          <input name="dataInicio" class="pure-u-23-24" readonly type="text"  value="'.($a['dataInicio']->format('Y-m-d')).'">
                      </div>
                      <div class="pure-u-3-24">
                          <input name="dataTermino" class="pure-u-23-24" readonly type="text"  value="'.($a['dataTermino']->format('Y-m-d')).'">
                      </div>
                      <div class="pure-u-6-24">
                          <input name="indicacao" class="pure-u-23-24" readonly type="text" value="'.($a['indicacao']).'">
                      </div>
                      <div class="pure-u-6-24">
                          <input name="motivo" class="pure-u-23-24" readonly type="text"  value="'.($a['motivo']).'">
                      </div>
					                       
              </fieldset>
          </form>';
  }	
?>
  </div>
</div>
</body>
</html>