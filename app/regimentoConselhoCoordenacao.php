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
      $stmt = sqlsrv_query($conn, "UPDATE vRegimentoConselhoCoordenacao SET siglaCurso = '".$_POST['siglaCurso']."', dataCriacao = '".$_POST['dataCriacao']."', regimento = '".$_POST['regimento']."' WHERE siglaCurso = '".$_POST['siglaCurso']."'");
      if (!$stmt) {
          echo 'Ocorreu um erro ao atualizar.';
      } else
          echo 'Atualizado com sucesso.';
    } elseif ($_POST['acao'] == 'apagar') {
      $stmt = sqlsrv_query($conn, "DELETE FROM vRegimentoConselhoCoordenacao WHERE siglaCurso = '".$_POST['siglaCurso']."'");
      if (!$stmt)
          echo 'Ocorreu um erro ao apagar.';
      else
          echo 'Apagado com sucesso.';
    } elseif ($_POST['acao'] == 'adicionar') {
      $stmt = sqlsrv_query($conn, "INSERT INTO vRegimentoConselhoCoordenacao VALUES ('".$_POST['siglaCurso']."', '".$_POST['regimento']."', '".$_POST['dataCriacao']."')");
      if (!$stmt) {
          echo 'Ocorreu um erro ao adicionar.';
      } else
          echo 'Adicionado com sucesso.';
    }
  }
?>
<div class="pure-g">
    <div class="pure-u-4-24"><p>Sigla do Curso</p></div>
    <div class="pure-u-6-24"><p>Data de Criação do Conselho</p></div>
    <div class="pure-u-10-24"><p>Regimento</p></div>
</div>

<?php
  $stmt = sqlsrv_query($conn, "SELECT * FROM vRegimentoConselhoCoordenacao");
  while ($a = sqlsrv_fetch_array($stmt)) {
    echo '<form class="pure-form pure-form-stacked" method="post" action="regimentoConselhoCoordenacao.php">
              <fieldset>
                  <div class="pure-g">
                      <div class="pure-u-4-24">
                          <input name="siglaCurso" class="pure-u-23-24" type="text" value="'.$a['siglaCurso'].'" disabled>
                      </div>
                      <div class="pure-u-6-24">
                          <input name="dataCriacao" class="pure-u-23-24" type="text" value="'.$a['dataCriacao']->format('Ymd').'" disabled>
                      </div>
                      <div class="pure-u-10-24">
                          <input name="regimento" class="pure-u-23-24" type="text" value="'.$a['regimento'].'">
                      </div>
                      <div class="pure-u-1-12">
                           <button type="submit" class="pure-button pure-button-primary" name="acao" value="editar">Editar</button>
                      </div>
              </fieldset>
          </form>';
  }
?>
  <!--form class="pure-form pure-form-stacked"  method="post" action="regimentoConselhoCoordenacao.php">
      <fieldset>
          <div class="pure-g">
              <div class="pure-u-4-24">
                  <input name="siglaCurso" class="pure-u-23-24" type="text">
              </div>
                <div class="pure-u-6-24">
                  <input name="dataCriacao" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-10-24">
                  <input name="regimento" class="pure-u-23-24" type="text">
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
