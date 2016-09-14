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
  if (isset($_POST['acao'])) {
    if ($_POST['acao'] == 'editar') {
      $stmt = sqlsrv_query($conn, 
	  "UPDATE vComunicadoDocente SET comunicado = '".$_POST['comunicado']."' WHERE siapeDocente = '".$_POST['siapeDocente']."' AND siglaCurso = '".$_POST['siglaCurso']."' AND idIP  = '".$_POST['idIP']."' AND dataHora  = '".$_POST['dataHora']."' AND idCNDE  = '".$_POST['idCNDE']."'");
      if (!$stmt) {
          echo 'Ocorreu um erro ao atualizar.';
      } else
          echo 'Atualizado com sucesso.';
    } elseif ($_POST['acao'] == 'apagar') {
      $stmt = sqlsrv_query($conn, "DELETE FROM vComunicadoDocente WHERE siapeDocente = '".$_POST['siapeDocente']."' AND siglaCurso = '".$_POST['siglaCurso']."' AND idIP  = '".$_POST['idIP']."' AND dataHora  = '".$_POST['dataHora']."' AND idCNDE  = '".$_POST['idCNDE']."'");
      if (!$stmt)
          echo 'Ocorreu um erro ao apagar.';
      else
          echo 'Apagado com sucesso.';
    } elseif ($_POST['acao'] == 'adicionar') {
      $stmt = sqlsrv_query($conn, "INSERT INTO vComunicadoDocente VALUES ('".$_POST['siapeDocente']."', '', '', '".$_POST['siglaCurso']."', '".$_POST['idIP']."', '".$_POST['dataHora']."', '".$_POST['idCNDE']."', '".$_POST['comunicado']."')");
      if (!$stmt) {
          echo 'Ocorreu um erro ao adicionar.';
      } else
          echo 'Adicionado com sucesso.';
    }
  }
?>
<div class="pure-g">
    <div class="pure-u-2-24"><p>Siape Docente</p></div>
    <div class="pure-u-2-24"><p>PreNome</p></div>
    <div class="pure-u-2-24"><p>Sobrenome</p></div>
    <div class="pure-u-2-24"><p>Sigla do Curso</p></div>
    <div class="pure-u-1-24"><p>Id IP</p></div>
    <div class="pure-u-4-24"><p>Data e Hora</p></div>
	<div class="pure-u-2-24"><p>ID CNDE</p></div>
	<div class="pure-u-5-24"><p>Comunicado</p></div>
</div>

<?php
  $stmt = sqlsrv_query($conn, "SELECT * FROM vComunicadoDocente ");
  while ($a = sqlsrv_fetch_array($stmt)) {
    echo '<form class="pure-form pure-form-stacked" method="post" action="comunicadoDocente.php">
              <fieldset>
                  <div class="pure-g">
                      <div class="pure-u-1-12">
                          <input name="siapeDocente" class="pure-u-23-24" type="text"  value="'.($a['siapeDocente']).'">
                      </div>
                      <div class="pure-u-1-12">
                          <input name="preNome" class="pure-u-23-24" type="text" value="'.($a['preNome']).'">
                      </div>
                      <div class="pure-u-1-12">
                          <input name="sobreNome" class="pure-u-23-24" type="text"  value="'.($a['sobreNome']).'">
                      </div>
                      <div class="pure-u-2-24">
                          <input name="siglaCurso" class="pure-u-23-24" type="text"  value="'.($a['siglaCurso']).'">
                      </div>
                      <div class="pure-u-1-24">
                          <input name="idIP" class="pure-u-23-24" type="text" value="'.($a['idIP']).'">
                      </div>
                      <div class="pure-u-4-24">
                          <input name="dataHora" class="pure-u-23-24" type="text"  value="'.($a['dataHora']->format('Ymd G:i:s A')).'">
                      </div>
					  <div class="pure-u-2-24">
                          <input name="idCNDE" class="pure-u-23-24" type="text"  value="'.($a['idCNDE']).'">
                      </div>
					  <div class="pure-u-5-24">
                          <input name="comunicado" class="pure-u-23-24" type="text" value="'.($a['comunicado']).'">
                      </div>
                      <div class="pure-u-1-12">  
                        <button type="submit" class="pure-button pure-button-primary" name="acao" value="editar">Editar</button>
                      </div>
                      <div class="pure-u-1-12">  
                        <button type="submit" class="pure-button pure-button-primary" name="acao" value="apagar">Apagar</button>
                      </div>
              </fieldset>
          </form>';
  }
	
?>
<div class="pure-g">
    <div class="pure-u-10-24"><p>Novo Comunicado</p></div>
	</div>
  <form class="pure-form pure-form-stacked"  method="post" action="comunicadoDocente.php">
      <fieldset>
          <div class="pure-g">
              <div class="pure-u-1-12">
                  <input name="siapeDocente" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-1-12">
                  <input name="preNome" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-1-12">
                  <input name="sobreNome " class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-2-24">
                  <input name="siglaCurso" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-1-24">
                  <input name="idIP" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-4-24">
                  <input name="dataHora" class="pure-u-23-24" type="text">
              </div>
			  <div class="pure-u-2-24">
                  <input name="idCNDE" class="pure-u-23-24" type="text">
              </div>
			  <div class="pure-u-5-24">
                  <input name="comunicado" class="pure-u-23-24" type="text">
              </div>

              <div class="pure-u-4-24">  
                <button type="submit" class="pure-button pure-button-primary" name="acao" value="adicionar">Adicionar</button>
            </div>
        </div>
    </fieldset>
  </form>
  </div>
</div>
</body>
</html>