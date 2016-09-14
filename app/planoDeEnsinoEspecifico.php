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
        <?php require 'menu.php';?>
    </div>

    <div id="main">
<?php

require_once 'config.php';


echo '<h1>
        <p>Plano de ensino</p><hr>  
      </h1>';
  $stmt = sqlsrv_query($conn, "SELECT TOP 1 * FROM PlanoDeEnsinoView WHERE siglaDisciplina = '".$_GET['disc']."' AND siglaTurma = '".$_GET['turma']."' AND semestre = ".$_GET['sem']." AND ano = ".$_GET['ano']);
  while ($a = sqlsrv_fetch_array($stmt)) 
  {
    echo'<ul class="b">
            <li>Disciplina: '.$a['siglaDisciplina'].'</li>
            <p>Turma '.$_GET['turma'].', Semestre '.$_GET['sem'].' de '.$_GET['ano'].'</p>
          </ul>';
    echo '<form class="pure-form pure-form-stacked" method="post" action="inscricoesEmTurma.php">
                    <fieldset class="pure-group">
                        <input type="text" class="pure-input-2-2" placeholder="Ementa" style="margin: 0px 608px 0px 0px; height: 40px; width: 1200px;" readonly>
                        <textarea class="pure-input-2-2" placeholder="'.$a['ementa'].'" style="margin: 0px 608px 0px 0px; height: 240px; width: 1200px;"></textarea>
                    </fieldset>
                    <fieldset class="pure-group">
                        <input type="text" class="pure-input-2-2" placeholder="Estratégia" style="margin: 0px 608px 0px 0px; height: 40px; width: 1200px;" readonly>
                        <textarea class="pure-input-2-2" placeholder="'.$a['estrategia'].'" style="margin: 0px 608px 0px 0px; height: 240px; width: 1200px;"></textarea>
                    </fieldset>
                    <fieldset class="pure-group">
                        <input type="text" class="pure-input-2-2" placeholder="Objetivos específicos" style="margin: 0px 608px 0px 0px; height: 40px; width: 1200px;" readonly>
                        <textarea class="pure-input-2-2" placeholder="'.$a['objetivosEspecificos'].'" style="margin: 0px 608px 0px 0px; height: 240px; width: 1200px;"></textarea>
                    </fieldset>
                    <fieldset class="pure-group">
                        <input type="text" class="pure-input-2-2" placeholder="Objetivos gerais" style="margin: 0px 608px 0px 0px; height: 40px; width: 1200px;" readonly>
                        <textarea class="pure-input-2-2" placeholder="'.$a['objetivosGerais'].'" style="margin: 0px 608px 0px 0px; height: 240px; width: 1200px;"></textarea>
                    </fieldset>
          </form>';
  }
?>
  </div>
</div>
</body>
</html>