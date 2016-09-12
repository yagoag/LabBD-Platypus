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
        <p>Deferimento</p><hr>  
      </h1>';
$aux  = '';
$aux1 = '_';
  $stmt = sqlsrv_query($conn, "SELECT * FROM vDeferimento");
  while ($a = sqlsrv_fetch_array($stmt)) 
  {
    $aux = $a['ra'];
    if ($aux != $aux1) 
    {
      echo'<h2>
            <ul class="b">
              <li>RA: '.$a['ra'].'</li>
            </ul>
          </h2>';
      $aux1 = $aux;
    }
    echo '<form class="pure-form pure-form-stacked" method="post" action="inscricoesEmTurma.php">
            <fieldset>
                <div class="pure-g">
                    <div class="pure-u-3-24"><p>Disciplina</p></div>
                    <div class="pure-u-2-24"><p>Sigla Disciplina</p></div>
                    <div class="pure-u-2-24"><p>Sigla Turma</p></div>
                    <div class="pure-u-2-24"><p>semestre</p></div>
                    <div class="pure-u-2-24"><p>ano</p></div>
                    <div class="pure-u-2-24"><p>Situação</p></div>
                    <div class="pure-u-3-24"><p>Motivo</p></div>
                    <div class="pure-u-2-24"><p>Mínimo Inscrição</p></div>
                    <div class="pure-u-2-24"><p>Máximo Inscrição</p></div>


                </div>                
                  <div class="pure-g">
                      <div class="pure-u-3-24">
                          <input name="nome" class="pure-u-23-24" type="text" value="'.$a['nome'].'" readonly>
                      </div>
                      <div class="pure-u-2-24">
                          <input name="sigla" class="pure-u-23-24" type="text" value="'.$a['sigla'].'" readonly>
                      </div>
                      <div class="pure-u-2-24">
                          <input name="siglaTurma" class="pure-u-23-24" type="text" value="'.$a['siglaTurma'].'" readonly>
                      </div>
                      <div class="pure-u-2-24">
                          <input name="semestre" class="pure-u-23-24" type="text" value="'.$a['semestre'].'" readonly>
                      </div>
                      <div class="pure-u-2-24">
                          <input name="ano" class="pure-u-23-24" type="text" value="'.$a['ano'].'" readonly>
                      </div>
                      <div class="pure-u-2-24">
                          <input name="situacao" class="pure-u-23-24" type="text" value="'.$a['situacao'].'" readonly>
                      </div>
                      <div class="pure-u-3-24">
                          <input name="motivo" class="pure-u-23-24" type="text" value="'.$a['motivo'].'" readonly>
                      </div>
                      <div class="pure-u-2-24">
                          <input name="inscricaoMin" class="pure-u-23-24" type="text" value="'.$a['inscricaoMin'].'" readonly>
                      </div>
                      <div class="pure-u-2-24">
                          <input name="inscricaoMax" class="pure-u-23-24" type="text" value="'.$a['inscricaoMax'].'" readonly>
                      </div>
                  </div>
            </fieldset>
          </form>';
  }
?>