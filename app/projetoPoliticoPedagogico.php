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
      $stmt = sqlsrv_query($conn, "UPDATE vProjetoPoliticoPedagogico_CoordCurso SET siglaCurso = '".$_POST['siglaCurso']."', inicioVigencia = '".$_POST['inicioVigencia']."', projeto = '".$_POST['projeto']."' WHERE inicioVigencia = '".$_POST['inicioVigencia']."'");
      if (!$stmt) {
          echo 'Ocorreu um erro ao atualizar.';
      } else
          echo 'Atualizado com sucesso.';
    } elseif ($_POST['acao'] == 'apagar') {
      $stmt = sqlsrv_query($conn, "DELETE FROM vProjetoPoliticoPedagogico_CoordCurso WHERE inicioVigencia = '".$_POST['inicioVigencia']."'");
      if (!$stmt)
          echo 'Ocorreu um erro ao apagar.';
      else
          echo 'Apagado com sucesso.';
      print_r(sqlsrv_errors());
    } elseif ($_POST['acao'] == 'adicionar') {
      $stmt = sqlsrv_query($conn, "INSERT INTO vProjetoPoliticoPedagogico_CoordCurso VALUES ('".$_POST['siglaCurso']."', '".$_POST['inicioVigencia']."', '".$_POST['projeto']."')");
      if (!$stmt) {
          echo 'Ocorreu um erro ao adicionar.';
      } else
          echo 'Adicionado com sucesso.';
    }
  }
?>
<div class="pure-g">
    <div class="pure-u-4-24"><p>Sigla do Curso</p></div>
    <div class="pure-u-6-24"><p>Início Vigencia do Projeto Político Pedagógico</p></div>
    <div class="pure-u-10-24"><p>Link para o projeto</p></div>
</div>

<?php
  $stmt = sqlsrv_query($conn, "SELECT * FROM vProjetoPoliticoPedagogico_CoordCurso");
  while ($a = sqlsrv_fetch_array($stmt)) {
    echo '<form class="pure-form pure-form-stacked" method="post" action="projetoPoliticoPedagogico.php">
              <fieldset>
                  <div class="pure-g">
                      <div class="pure-u-4-24">
                          <input name="siglaCurso" class="pure-u-23-24" type="text" value="'.$a['siglaCurso'].'" disabled>
                      </div>
                      <div class="pure-u-6-24">
                          <input name="inicioVigencia" class="pure-u-23-24" type="text" value="'.$a['inicioVigencia']->format('Ymd').'" disabled>
                      </div>
                      <div class="pure-u-10-24">
                          <input name="projeto" class="pure-u-23-24" type="text" value="'.$a['projeto'].'">
                      </div>
                      <div class="pure-u-1-12">
                           <button type="submit" class="pure-button pure-button-primary" name="acao" value="editar">Editar</button>
                      </div>
              </fieldset>
          </form>';
  }
?>
  <!--form class="pure-form pure-form-stacked"  method="post" action="projetoPoliticoPedagogico.php">
      <fieldset>
          <div class="pure-g">
              <div class="pure-u-4-24">
                  <input name="siglaCurso" class="pure-u-23-24" type="text">
              </div>
                <div class="pure-u-6-24">
                  <input name="inicioVigencia" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-10-24">
                  <input name="projeto" class="pure-u-23-24" type="text">
              </div>

              <div class="pure-u-4-24">
                <button type="submit" class="pure-button pure-button-primary" name="acao" value="adicionar">Adicionar</button>
              </div>
        </div>
      </fieldset>
  </form-->
  </div>
</div>
</body>
</html>