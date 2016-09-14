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
      <h1>Situação Enade</h1>
      <div class="pure-g">
          <div class="pure-u-4-24"><p>RA</p></div>
          <div class="pure-u-4-24"><p>CPF</p></div>
          <div class="pure-u-4-24"><p>Status</p></div>
          <div class="pure-u-4-24"><p>Prenome</p></div>
          <div class="pure-u-4-24"><p>Sobrenome</p></div>
      </div>

      <?php
        $stmt = sqlsrv_query($conn, "SELECT * FROM vAlunosEnade");
        while ($a = sqlsrv_fetch_array($stmt)) {
          echo '<form class="pure-form pure-form-stacked" method="post" action="licencas.php">
                    <fieldset>
                        <div class="pure-g">
                            <div class="pure-u-4-24">
                                <input name="dataInicio" class="pure-u-23-24" type="text" value="'.$a['ra'].'" disabled>
                            </div>
                            <div class="pure-u-4-24">
                                <input name="dataTermino" class="pure-u-23-24" type="text" value="'.$a['cpf'].'" disabled>
                            </div>
                            <div class="pure-u-4-24">
                                <input name="siape" class="pure-u-23-24" type="text" value="'.$a['status'].'" disabled>
                            </div>
                            <div class="pure-u-4-24">
                                <input name="documento" class="pure-u-23-24" type="text" value="'.$a['preNome'].'" disabled>
                            </div>
                            <div class="pure-u-4-24">
                                <input name="indicacao" class="pure-u-23-24" type="text" value="'.$a['sobreNome'].'" disabled>
                            </div>
                    </fieldset>
                </form>';
        }
      ?>
  </div>
</div>
</body>
</html>