<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
  <meta http-equiv="Content-type" content="text/html; charset=utf-8" />

<style>
  ul.a {
      list-style-type: circle;
  }

  ul.b {
      list-style-type: square;
  }

  ol.c {
      list-style-type: upper-roman;
  }

  ol.d {
      list-style-type: lower-alpha;
  }
</style>

</head>
<?php

require_once 'config.php';


echo '<h1>
        <p>Planos de ensino</p><hr>  
      </h1>';
  $stmt = sqlsrv_query($conn, "SELECT * FROM vPlanoDeEnsino ");
  while ($a = sqlsrv_fetch_array($stmt)) 
  {
    echo'<h2>
          <ul class="b">
            <li>Disciplina: '.$a['nome'].'</li>
          </ul>
        </h2>';
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