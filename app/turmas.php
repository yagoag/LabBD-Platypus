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
      $stmt = sqlsrv_query($conn, "UPDATE turmas_ChefeDepto SET valida = '".$_POST['valida']."', vagas = '".$_POST['vagas']."', inscricaoMin = '".$_POST['inscricaoMin']."', inscricaoMax = '".$_POST['inscricaoMax']."' WHERE sigla = '".$_POST['sigla']."' AND semestre = '".$_POST['semestre']."' AND ano = '".$_POST['ano']."' AND siglaTurma = '".$_POST['siglaTurma']."'");
      if (!$stmt) {
          echo 'Ocorreu um erro ao atualizar.';
      } else
          echo 'Atualizado com sucesso.';
    } elseif ($_POST['acao'] == 'apagar') {
      $stmt = sqlsrv_query($conn, "DELETE FROM turmas_ChefeDepto WHERE sigla = '".$_POST['sigla']."' AND semestre = '".$_POST['semestre']."' AND ano = '".$_POST['ano']."' AND siglaTurma = '".$_POST['siglaTurma']."'");
      if (!$stmt)
          echo 'Ocorreu um erro ao apagar.';
      else
          echo 'Apagado com sucesso.';
    } elseif ($_POST['acao'] == 'adicionar') {
      $stmt = sqlsrv_query($conn, "INSERT INTO turmas_ChefeDepto VALUES ('".$_POST['sigla']."', '', 0, 0, '".$_POST['semestre']."', '".$_POST['ano']."', '".$_POST['siglaTurma']."', '".$_POST['valida']."', '".$_POST['vagas']."', '".$_POST['inscricaoMin']."', '".$_POST['inscricaoMax']."')");
      if (!$stmt) {
          echo 'Ocorreu um erro ao adicionar.';
      } else
          echo 'Adicionado com sucesso.';
    }
  }
?>
<div class="pure-g">
    <div class="pure-u-1-12"><p>Sigla</p></div>
    <div class="pure-u-1-12"><p>Nome</p></div>
    <div class="pure-u-1-12"><p>Cred. Prat.</p></div>
    <div class="pure-u-1-12"><p>Cred. Teor.</p></div>
    <div class="pure-u-1-12"><p>Semestre</p></div>
    <div class="pure-u-1-12"><p>Ano</p></div>
    <div class="pure-u-1-12"><p>Turma</p></div>
    <div class="pure-u-1-12"><p>Válida</p></div>
    <div class="pure-u-1-12"><p>Vagas</p></div>
    <div class="pure-u-1-12"><p>Min. Inscr.</p></div>
    <div class="pure-u-1-12"><p>Máx. Inscr.</p></div>
</div>

<?php
  $stmt = sqlsrv_query($conn, "SELECT * FROM turmas_ChefeDepto");
  while ($a = sqlsrv_fetch_array($stmt)) {
    echo '<form class="pure-form pure-form-stacked" method="post" action="turmas.php">
              <fieldset>
                  <div class="pure-g">
                      <div class="pure-u-1-12">
                          <input name="sigla" class="pure-u-23-24" type="text" value="'.$a['sigla'].'">
                      </div>
                      <div class="pure-u-1-12">
                          <input name="nome" class="pure-u-23-24" type="text" value="'.$a['nome'].'" disabled>
                      </div>
                      <div class="pure-u-1-12">
                          <input name="numCreditosPraticos" class="pure-u-23-24" type="text" value="'.$a['numCreditosPraticos'].'" disabled>
                      </div>
                      <div class="pure-u-1-12">
                          <input name="numCreditosTeoricos" class="pure-u-23-24" type="text" value="'.$a['numCreditosTeoricos'].'" disabled>
                      </div>
                      <div class="pure-u-1-12">
                          <input name="semestre" class="pure-u-23-24" type="text" value="'.$a['semestre'].'">
                      </div>
                      <div class="pure-u-1-12">
                          <input name="ano" class="pure-u-23-24" type="text" value="'.$a['ano'].'">
                      </div>
                      <div class="pure-u-1-12">
                          <input name="siglaTurma" class="pure-u-23-24" type="text" value="'.$a['siglaTurma'].'">
                      </div>
                      <div class="pure-u-1-12">
                          <input name="valida" class="pure-u-23-24" type="text" value="'.$a['valida'].'">
                      </div>
                      <div class="pure-u-1-12">
                          <input name="vagas" class="pure-u-23-24" type="text" value="'.$a['vagas'].'">
                      </div>
                      <div class="pure-u-1-12">
                          <input name="inscricaoMin" class="pure-u-23-24" type="text" value="'.$a['inscricaoMin'].'">
                      </div>
                      <div class="pure-u-1-12">
                          <input name="inscricaoMax" class="pure-u-23-24" type="text" value="'.$a['inscricaoMax'].'">
                      </div>

                      <div class="pure-u-1-24">  
                        <button type="submit" class="pure-button pure-button-primary" name="acao" value="editar">Editar</button>
                      </div>
                      <div class="pure-u-1-24">  
                        <button type="submit" class="pure-button pure-button-primary" name="acao" value="apagar">Apagar</button>
                      </div>
              </fieldset>
          </form>';
  }
?>
  <form class="pure-form pure-form-stacked"  method="post" action="turmas.php">
      <fieldset>
          <div class="pure-g">
              <div class="pure-u-1-12">
                  <input name="sigla" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-1-12">
                  <input name="nome" class="pure-u-23-24" type="text" disabled>
              </div>
              <div class="pure-u-1-12">
                  <input name="numCreditosPraticos" class="pure-u-23-24" type="text" disabled>
              </div>
              <div class="pure-u-1-12">
                  <input name="numCreditosTeoricos" class="pure-u-23-24" type="text" disabled>
              </div>
              <div class="pure-u-1-12">
                  <input name="semestre" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-1-12">
                  <input name="ano" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-1-12">
                  <input name="siglaTurma" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-1-12">
                  <input name="valida" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-1-12">
                  <input name="vagas" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-1-12">
                  <input name="inscricaoMin" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-1-12">
                  <input name="inscricaoMax" class="pure-u-23-24" type="text">
              </div>

              <div class="pure-u-1-12">  
                <button type="submit" class="pure-button pure-button-primary" name="acao" value="adicionar">Adicionar</button>
            </div>
      </fieldset>
  </form>
</html>