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
            $stmt = sqlsrv_query($conn, "UPDATE licencas_ChefeDepto SET dataInicio = '".$_POST['dataInicio']."', dataTermino = '".$_POST['dataTermino']."', siape = '".$_POST['siape']."', documento = '".$_POST['documento']."', indicacao = '".$_POST['indicacao']."', motivo = '".$_POST['motivo']."' WHERE dataInicio = '".$_POST['dataInicio']."' AND dataTermino = '".$_POST['dataTermino']."' AND siape = '".$_POST['siape']."'");
            if (!$stmt) {
                echo 'Ocorreu um erro ao atualizar.';
            } else
                echo 'Atualizado com sucesso.';
          } elseif ($_POST['acao'] == 'apagar') {
            $stmt = sqlsrv_query($conn, "DELETE FROM licencas_ChefeDepto WHERE dataInicio = '".$_POST['dataInicio']."' AND dataTermino = '".$_POST['dataTermino']."' AND siape = '".$_POST['siape']."'");
            if (!$stmt)
                echo 'Ocorreu um erro ao apagar.';
            else
                echo 'Apagado com sucesso.';
          } elseif ($_POST['acao'] == 'adicionar') {
            $stmt = sqlsrv_query($conn, "INSERT INTO licencas_ChefeDepto VALUES ('".$_POST['dataInicio']."', '".$_POST['dataTermino']."', '".$_POST['siape']."', '".$_POST['documento']."', '".$_POST['indicacao']."', '".$_POST['motivo']."')");
            if (!$stmt) {
                echo 'Ocorreu um erro ao adicionar.';
            } else
                echo 'Adicionado com sucesso.';
          }
        }
      ?>
      <div class="pure-g">
          <div class="pure-u-1-12"><p>Data Início</p></div>
          <div class="pure-u-1-12"><p>Data Término</p></div>
          <div class="pure-u-1-12"><p>SIAPE</p></div>
          <div class="pure-u-4-24"><p>Documento</p></div>
          <div class="pure-u-4-24"><p>Indicação</p></div>
          <div class="pure-u-4-24"><p>Motivo</p></div>
      </div>

      <?php
        $stmt = sqlsrv_query($conn, "SELECT * FROM licencas_ChefeDepto");
        while ($a = sqlsrv_fetch_array($stmt)) {
          echo '<form class="pure-form pure-form-stacked" method="post" action="licencas.php">
                    <fieldset>
                        <div class="pure-g">
                            <div class="pure-u-1-12">
                                <input name="dataInicio" class="pure-u-23-24" type="text" value="'.$a['dataInicio']->format('Ymd').'">
                            </div>
                            <div class="pure-u-1-12">
                                <input name="dataTermino" class="pure-u-23-24" type="text" value="'.$a['dataTermino']->format('Ymd').'">
                            </div>
                            <div class="pure-u-1-12">
                                <input name="siape" class="pure-u-23-24" type="text" value="'.$a['siape'].'">
                            </div>
                            <div class="pure-u-4-24">
                                <input name="documento" class="pure-u-23-24" type="text" value="'.$a['documento'].'">
                            </div>
                            <div class="pure-u-4-24">
                                <input name="indicacao" class="pure-u-23-24" type="text" value="'.$a['indicacao'].'">
                            </div>
                            <div class="pure-u-4-24">
                                <input name="motivo" class="pure-u-23-24" type="text" value="'.$a['motivo'].'">
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
        <form class="pure-form pure-form-stacked"  method="post" action="licencas.php">
            <fieldset>
                <div class="pure-g">
                    <div class="pure-u-1-12">
                        <input name="dataInicio" class="pure-u-23-24" type="text">
                    </div>
                    <div class="pure-u-1-12">
                        <input name="dataTermino" class="pure-u-23-24" type="text">
                    </div>
                    <div class="pure-u-1-12">
                        <input name="siape" class="pure-u-23-24" type="text">
                    </div>
                    <div class="pure-u-4-24">
                        <input name="documento" class="pure-u-23-24" type="text">
                    </div>
                    <div class="pure-u-4-24">
                        <input name="indicacao" class="pure-u-23-24" type="text">
                    </div>
                    <div class="pure-u-4-24">
                        <input name="motivo" class="pure-u-23-24" type="text">
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