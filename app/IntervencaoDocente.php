<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
</head>
<?php
require_once 'config.php';
  if (isset($_POST['acao'])) {
    if ($_POST['acao'] == 'editar') {
      $stmt = sqlsrv_query($conn, 
	  "UPDATE vIntervencaoDocente SET propostaIntervencao  = '".$_POST['propostaIntervencao']."' WHERE siape = '".$_POST['siape']."' AND siglaCurso = '".$_POST['siglaCurso']."' AND idIP  = '".$_POST['idIP']."' AND dataHora  = '".$_POST['dataHora']."' AND idPINDE   = '".$_POST['idPINDE']."'");
      if (!$stmt) {
          echo 'Ocorreu um erro ao atualizar.';
      } else
          echo 'Atualizado com sucesso.';
    } elseif ($_POST['acao'] == 'apagar') {
      $stmt = sqlsrv_query($conn, "DELETE FROM vIntervencaoDocente WHERE siape = '".$_POST['siape']."' AND siglaCurso = '".$_POST['siglaCurso']."' AND idIP  = '".$_POST['idIP']."' AND dataHora  = '".$_POST['dataHora']."' AND idPINDE   = '".$_POST['idPINDE']."'");
      if (!$stmt)
          echo 'Ocorreu um erro ao apagar.';
      else
          echo 'Apagado com sucesso.';
    } elseif ($_POST['acao'] == 'adicionar') {
      $stmt = sqlsrv_query($conn, "INSERT INTO vIntervencaoDocente VALUES ('".$_POST['siape']."', '', '', '".$_POST['siglaCurso']."', '".$_POST['idIP']."', '".$_POST['dataHora']."', '".$_POST['idPINDE']."', '".$_POST['propostaIntervencao']."')");
      if (!$stmt) {
          echo 'Ocorreu um erro ao adicionar.';
      } else
          echo 'Adicionado com sucesso.';
    }
  }
?>
<div class="pure-g">
    <div class="pure-u-2-24"><p>Siape Docente</p></div>
    <div class="pure-u-2-24"><p>PréNome</p></div>
    <div class="pure-u-2-24"><p>Sobrenome</p></div>
    <div class="pure-u-2-24"><p>Sigla do Curso</p></div>
    <div class="pure-u-1-24"><p>COD Item de Pauta</p></div>
    <div class="pure-u-4-24"><p>Data e Hora</p></div>
	<div class="pure-u-2-24"><p>COD Intervenção</p></div>
	<div class="pure-u-5-24"><p>Proposta Intervenção </p></div>
</div>

<?php
  $stmt = sqlsrv_query($conn, "SELECT * FROM vIntervencaoDocente ");
  while ($a = sqlsrv_fetch_array($stmt)) {
    echo '<form class="pure-form pure-form-stacked" method="post" action="IntervencaoDocente.php">
              <fieldset>
                  <div class="pure-g">
                      <div class="pure-u-1-12">
                          <input name="siape" class="pure-u-23-24" type="text"  value="'.($a['siape']).'">
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
                          <input name="idPINDE" class="pure-u-23-24" type="text"  value="'.($a['idPINDE']).'">
                      </div>
					  <div class="pure-u-5-24">
                          <input name="propostaIntervencao" class="pure-u-23-24" type="text" value="'.($a['propostaIntervencao']).'">
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
    <div class="pure-u-10-24"><p>Nova Proposta de Intervenção</p></div>
	</div>
  <form class="pure-form pure-form-stacked"  method="post" action="IntervencaoDocente.php">
      <fieldset>
          <div class="pure-g">
              <div class="pure-u-1-12">
                  <input name="siape" class="pure-u-23-24" type="text">
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
                  <input name="idPINDE" class="pure-u-23-24" type="text">
              </div>
			  <div class="pure-u-5-24">
                  <input name="propostaIntervencao" class="pure-u-23-24" type="text">
              </div>

              <div class="pure-u-4-24">  
                <button type="submit" class="pure-button pure-button-primary" name="acao" value="adicionar">Adicionar</button>
            </div>
      </fieldset>
  </form>
</html>