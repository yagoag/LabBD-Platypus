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
      <h1>Equipes de Apoio</h1>
      <div class="pure-g">
          <div class="pure-u-4-24"><p>Descricao</p></div>
          <div class="pure-u-4-24"><p>Disciplina</p></div>
          <div class="pure-u-4-24"><p>Turma</p></div>
          <div class="pure-u-4-24"><p>Semestre</p></div>
          <div class="pure-u-4-24"><p>Ano</p></div>
          <div class="pure-u-4-24"><p>Plano de Ensino</p></div>
      </div>

      <?php
        $stmt = sqlsrv_query($conn, "SELECT * FROM TecnicoEquipesApoioView WHERE siape = '".$_SESSION['siape']."'");
        while ($a = sqlsrv_fetch_array($stmt)) {
          echo '<form class="pure-form pure-form-stacked" method="post" action="licencas.php">
                    <fieldset>
                        <div class="pure-g">
                            <div class="pure-u-4-24">
                                <input name="dataTermino" class="pure-u-23-24" type="text" value="'.$a['descricao'].'" disabled>
                            </div>
                            <div class="pure-u-4-24">
                                <input name="siape" class="pure-u-23-24" type="text" value="'.$a['siglaDisciplina'].'" disabled>
                            </div>
                            <div class="pure-u-4-24">
                                <input name="documento" class="pure-u-23-24" type="text" value="'.$a['siglaTurma'].'" disabled>
                            </div>
                            <div class="pure-u-4-24">
                                <input name="indicacao" class="pure-u-23-24" type="text" value="'.$a['semestre'].'" disabled>
                            </div>
                            <div class="pure-u-4-24">
                                <input name="indicacao" class="pure-u-23-24" type="text" value="'.$a['ano'].'" disabled>
                            </div>
                            <div class="pure-u-4-24">
                                <a href="planoDeEnsinoEspecifico.php?disc='.$a['siglaDisciplina'].'&turma='.$a['siglaTurma'].'&sem='.$a['semestre'].'&ano='.$a['ano'].'" class="pure-button">Visitar</a>
                            </div>
                    </fieldset>
                </form>';
        }
      ?>
  </div>
</div>
</body>
</html>