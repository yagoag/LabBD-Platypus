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
        <p>Histórico de disciplinas ofertadas</p><hr>  
      </h1>';


  $stmt = sqlsrv_query($conn, "SELECT * FROM vlistaDeDisciplinas");
  while ($a = sqlsrv_fetch_array($stmt)) 
  {
    echo '<form class="pure-form pure-form-stacked" method="post" action="inscricoesEmTurma.php">
            <fieldset>
                <h2>
                  <ul class="b">
                    <li>'.$a['nome'].'</li>
                  </ul>
                </h2>
                <div class="pure-g">
                    <div class="pure-u-2-24"><p>sigla Disciplina</p></div>
                    <div class="pure-u-2-24"><p>Professor</p></div>
                    <div class="pure-u-2-24"><p>sobrenome</p></div>
                    <div class="pure-u-2-24"><p>Local gabinete</p></div>
                    <div class="pure-u-2-24"><p>semestre</p></div>
                    <div class="pure-u-1-24"><p>ano</p></div>
                    <div class="pure-u-2-24"><p>Créditos Práticos</p></div>
                    <div class="pure-u-2-24"><p>Créditos Teóricos</p></div>
                </div>                
                  <div class="pure-g">
                      <div class="pure-u-2-24">
                          <input name="sigla" class="pure-u-23-24" type="text" value="'.$a['sigla'].'" readonly>
                      </div>
                      <div class="pure-u-2-24">
                          <input name="preNome" class="pure-u-23-24" type="text" value="'.$a['preNome'].'" readonly>
                      </div>
                      <div class="pure-u-2-24">
                          <input name="sobreNome" class="pure-u-23-24" type="text" value="'.$a['sobreNome'].'" readonly>
                      </div>
                      <div class="pure-u-2-24">
                          <input name="gabineteLocal" class="pure-u-23-24" type="text" value="'.$a['gabineteLocal'].'" readonly>
                      </div>
                      <div class="pure-u-2-24">
                          <input name="semestre" class="pure-u-23-24" type="text" value="'.$a['semestre'].'" readonly>
                      </div>
                      <div class="pure-u-1-24">
                          <input name="ano" class="pure-u-23-24" type="text" value="'.$a['ano'].'" readonly>
                      </div>
                      <div class="pure-u-2-24">
                          <input name="numCreditosPraticos" class="pure-u-23-24" type="text" value="'.$a['numCreditosPraticos'].'" readonly>
                      </div>
                      <div class="pure-u-2-24">
                          <input name="numCreditosTeoricos" class="pure-u-23-24" type="text" value="'.$a['numCreditosTeoricos'].'" readonly>
                      </div>

                      <div class="pure-u-9-24"><p></p></div>
                      
                      <div class="pure-u-24-24"><p></p></div>
                  </div>

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
            </fieldset>
          </form>';
  }
?>