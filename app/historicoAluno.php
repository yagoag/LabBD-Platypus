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

echo '<h1>
        <p>Histórico de disciplinas cursadas</p><hr>  
      </h1>';

  $ra = $_SESSION['ra'];
  $stmt = sqlsrv_query($conn, "SELECT * FROM vHistorico WHERE ra = $ra ");
  while ($a = sqlsrv_fetch_array($stmt)) 
  {
    echo '<form class="pure-form pure-form-stacked" method="post" action="inscricoesEmTurma.php">
            <fieldset>
                <!--<h2>
                  <ul class="b">
                    <li>RA: '.$a['ra'].'</li>
                  </ul>
                </h2>-->
                <div class="pure-g">
                    <div class="pure-u-3-24"><p>Disciplina</p></div>
                    <div class="pure-u-2-24"><p>Créditos Práticos</p></div>
                    <div class="pure-u-2-24"><p>Créditos Teóricos</p></div>
                    <div class="pure-u-1-24"><p>ano</p></div>
                    <div class="pure-u-2-24"><p>semestre</p></div>
                    <div class="pure-u-2-24"><p>Frequência</p></div>
                    <div class="pure-u-2-24"><p>Média Final</p></div>
                    <div class="pure-u-2-24"><p>Aprovação</p></div>
                    <div class="pure-u-2-24"><p>IRA</p></div>


                </div>                
                  <div class="pure-g">
                      <div class="pure-u-3-24">
                          <input name="nome" class="pure-u-23-24" type="text" value="'.$a['nome'].'" readonly>
                      </div>
                      <div class="pure-u-2-24">
                          <input name="numCreditosPraticos" class="pure-u-23-24" type="text" value="'.$a['numCreditosPraticos'].'" readonly>
                      </div>
                      <div class="pure-u-2-24">
                          <input name="numCreditosTeoricos" class="pure-u-23-24" type="text" value="'.$a['numCreditosTeoricos'].'" readonly>
                      </div>
                      <div class="pure-u-1-24">
                          <input name="ano" class="pure-u-23-24" type="text" value="'.$a['ano'].'" readonly>
                      </div>
                      <div class="pure-u-2-24">
                          <input name="semestre" class="pure-u-23-24" type="text" value="'.$a['semestre'].'" readonly>
                      </div>
                      <div class="pure-u-2-24">
                          <input name="frequencia" class="pure-u-23-24" type="text" value="'.$a['frequencia'].'" readonly>
                      </div>
                      <div class="pure-u-2-24">
                          <input name="mediaFinal" class="pure-u-23-24" type="text" value="'.$a['mediaFinal'].'" readonly>
                      </div>
                      <div class="pure-u-2-24">
                          <input name="aprovado" class="pure-u-23-24" type="text" value="'.$a['aprovado'].'" readonly>
                      </div>
                      <div class="pure-u-2-24">
                          <input name="ira" class="pure-u-23-24" type="text" value="'.$a['ira'].'" readonly>
                      </div>
                  </div>
            </fieldset>
          </form>';
  }
?>
    </div>
</div>
</body>
</html>