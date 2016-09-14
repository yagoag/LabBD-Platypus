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
      <h1>Prioridades em Matérias</h1>
      <div class="pure-g">
          <div class="pure-u-1-5"><p>Prenome</p></div>
          <div class="pure-u-1-5"><p>Sobrenome</p></div>
          <div class="pure-u-1-5"><p>SIAPE</p></div>
          <div class="pure-u-1-5"><p>Disciplina</p></div>
          <div class="pure-u-1-5"><p>Grau</p></div>
      </div>

      <?php
        $stmt = sqlsrv_query($conn, "SELECT * FROM PrioridadeDocente");
        while ($a = sqlsrv_fetch_array($stmt)) {
          echo '<form class="pure-form pure-form-stacked" method="post" action="licencas.php">
                    <fieldset>
                        <div class="pure-g">
                            <div class="pure-u-1-5">
                                <input name="dataInicio" class="pure-u-23-24" type="text" value="'.$a['preNome'].'" readonly>
                            </div>
                            <div class="pure-u-1-5">
                                <input name="dataTermino" class="pure-u-23-24" type="text" value="'.$a['sobreNome'].'" readonly>
                            </div>
                            <div class="pure-u-1-5">
                                <input name="siape" class="pure-u-23-24" type="text" value="'.$a['siape'].'" readonly>
                            </div>
                            <div class="pure-u-1-5">
                                <input name="documento" class="pure-u-23-24" type="text" value="'.$a['siglaDisciplina'].'" readonly>
                            </div>
                            <div class="pure-u-1-5">
                                <input name="indicacao" class="pure-u-23-24" type="text" value="'.$a['grau'].'" readonly>
                            </div>
                    </fieldset>
                </form>';
        }
      ?>
  </div>
</div>
</body>
</html>