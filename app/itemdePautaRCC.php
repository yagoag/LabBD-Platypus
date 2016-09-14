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
      $stmt = sqlsrv_query($conn, "UPDATE vItemDePautaConselhoCurso_CoordCurso SET idIP = '".$_POST['idIP']."', cpf = '".$_POST['cpf']."', preNome = '".$_POST['preNome']."', sobreNome = '".$_POST['sobreNome']."', siglaCurso = '".$_POST['siglaCurso']."', dataHora = '".$_POST['dataHora']."', dataCriacao = '".$_POST['dataCriacao']."', descricao = '".$_POST['descricao']."' WHERE idIP = '".$_POST['idIP']."' AND cpf = '".$_POST['cpf']."' AND siglaCurso = '".$_POST['siglaCurso']."' AND dataHora = '".$_POST['dataHora']."' AND dataCriacao = '".$_POST['dataCriacao']."'");
      if (!$stmt) {
          echo 'Ocorreu um erro ao atualizar.';
      } else
          echo 'Atualizado com sucesso.';
    } elseif ($_POST['acao'] == 'apagar') {
      $stmt = sqlsrv_query($conn, "DELETE FROM vItemDePautaConselhoCurso_CoordCurso WHERE idIP = '".$_POST['idIP']."', cpf = '".$_POST['cpf']."', siglaCurso = '".$_POST['siglaCurso']."', dataHora = '".$_POST['dataHora']."', dataCriacao = '".$_POST['dataCriacao']."'");
      if (!$stmt)
          echo 'Ocorreu um erro ao apagar.';
      else
          echo 'Apagado com sucesso.';
    } elseif ($_POST['acao'] == 'adicionar') {
      $stmt = sqlsrv_query($conn, "INSERT INTO vProjetoPoliticoPedagogico_CoordCurso VALUES ('".$_POST['idIP']."', '".$_POST['cpf']."',
      '".$_POST['preNome']."',
      '".$_POST['sobreNome']."',
      '".$_POST['siglaCurso']."',
      '".$_POST['dataHora']."',
      '".$_POST['dataCriacao']."', '".$_POST['descricao']."')");
      if (!$stmt) {
          echo 'Ocorreu um erro ao adicionar.';
      } else
          echo 'Adicionado com sucesso.';
    }
  }
?>
<div class="pure-g">
    <div class="pure-u-1-24"><p>idIP</p></div>
    <div class="pure-u-2-24"><p>CPF</p></div>
    <div class="pure-u-2-24"><p>Nome</p></div>
    <div class="pure-u-2-24"><p>Sobrenome</p></div>
    <div class="pure-u-2-24"><p>Sigla do Curso</p></div>
    <div class="pure-u-3-24"><p>Data e Hora</p></div>
    <div class="pure-u-2-24"><p>Data Criacao Conselho</p></div>
    <div class="pure-u-8-24"><p>Descricao</p></div>
</div>

<?php
  $stmt = sqlsrv_query($conn, "SELECT * FROM vItemDePautaConselhoCurso_CoordCurso");
  while ($a = sqlsrv_fetch_array($stmt)) {
    echo '<form class="pure-form pure-form-stacked" method="post" action="itemDePautaRCC.php">
              <fieldset>
                  <div class="pure-g">
                      <div class="pure-u-1-24">
                          <input name="idIP" class="pure-u-23-24" type="text" value="'.$a['idIP'].'">
                      </div>
                      <div class="pure-u-2-24">
                          <input name="cpf" class="pure-u-23-24" type="text" value="'.$a['cpf'].'">
                      </div>
                      <div class="pure-u-2-24">
                          <input name="preNome" class="pure-u-23-24" type="text" value="'.$a['preNome'].'">
                      </div>
                      <div class="pure-u-2-24">
                          <input name="sobreNome" class="pure-u-23-24" type="text" value="'.$a['sobreNome'].'">
                      </div>
                      <div class="pure-u-2-24">
                          <input name="siglaCurso" class="pure-u-23-24" type="text" value="'.$a['siglaCurso'].'">
                      </div>
                      <div class="pure-u-3-24">
                          <input name="dataHora" class="pure-u-23-24" type="text" value="'.$a['dataHora']->format('Ymd G:i:s A').'">
                      </div>
                      <div class="pure-u-2-24">
                          <input name="dataCriacao" class="pure-u-23-24" type="text" value="'.$a['dataCriacao']->format('Ymd').'">
                      </div>
                      <div class="pure-u-8-24">
                          <input name="descricao" class="pure-u-23-24" type="text" value="'.$a['descricao'].'">
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
  <form class="pure-form pure-form-stacked"  method="post" action="itemDePautaRCC.php">
      <fieldset>
          <div class="pure-g">
            <div class="pure-u-1-24">
                <input name="idIP" class="pure-u-23-24" type="text">
            </div>
              <div class="pure-u-2-24">
                  <input name="cpf" class="pure-u-23-24" type="text">
              </div>
                <div class="pure-u-2-24">
                  <input name="preNome" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-2-24">
                  <input name="sobreNome" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-2-24">
                  <input name="siglaCurso" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-3-24">
                  <input name="dataHora" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-2-24">
                  <input name="dataCriacao" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-8-24">
                  <input name="descricao" class="pure-u-23-24" type="text">
              </div>

              <div class="pure-u-2-24">
                <button type="submit" class="pure-button pure-button-primary" name="acao" value="adicionar">Adicionar</button>
              </div>
        </div>
      </fieldset>
  </form>
  </div>
</div>
</body>
</html>