<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
  <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
</head>
<?php

require_once 'config.php';

function soNumero($str) {
    return preg_replace("/[^0-9]/", "", $str);
}

echo '<h2>
        <p>Lista de disciplinas inscritas</p><hr>  
      </h2>';

  if (isset($_POST['acao'])) 
  {
    if ($_POST['acao'] == 'apagar') 
    {
      $filtro = soNumero($_POST['ra']);
      $stmt = sqlsrv_query($conn, "DELETE FROM vInscriçõesEmTurma 
                                   WHERE ra                  = $filtro                         and 
                                         siglaDisciplina     = '".$_POST['siglaDisciplina']."' and
                                         siglaTurma          = '".$_POST['siglaTurma']."'      and
                                         ano                 = '".$_POST['ano']."'             and
                                         semestre            = '".$_POST['semestre']."'"); 
                                  
      if (!$stmt) {
          echo 'Ocorreu um erro ao apagar. ';
      } else
          echo 'Apagado com sucesso.';
    }
    elseif ($_POST['acao'] == 'inserir') 
    {
        // Dados da tabela
        $tabela = "Turma";    #Nome da tabela
        $campo0 = "semestre"; #Nome do campo da tabela
        $campo1 = "ano";         
        $campo2 = "siglaTurma";
        $campo3 = "siglaDisciplina";

        $instrucaoSQL = "SELECT *   
                         FROM $tabela 
                         WHERE siglaDisciplina     = '".$_POST['siglaDisciplina']."' and
                               siglaTurma          = '".$_POST['siglaTurma']."'      and
                               ano                 = '".$_POST['ano']."'             and
                               semestre            = '".$_POST['semestre']."'";         
        $params = array();
        $options =array("Scrollable" => SQLSRV_CURSOR_KEYSET);
        $consulta = sqlsrv_query($conn, $instrucaoSQL, $params, $options);
        $numRegistros = sqlsrv_num_rows($consulta);
        if ($numRegistros!= 0) 
        {
          while ($cadaLinha = sqlsrv_fetch_array($consulta, SQLSRV_FETCH_ASSOC)) 
          {
            $stmt = sqlsrv_query($conn, "INSERT INTO  AlunoInscreveTurma
                                         VALUES ('".$_POST['ra1']."', '".$cadaLinha[ $campo0 ]."',
                                                 '".$cadaLinha[ $campo1 ]."', '".$cadaLinha[ $campo2 ]."',
                                                 '".$cadaLinha[ $campo3 ]."', 'Aguardando', 'Em análise')");
            if ($stmt) {
              echo "A sua incrição foi feita com sucesso.";
            }
          }
        }  
    }  
  }

  $stmt = sqlsrv_query($conn, "SELECT * FROM vInscriçõesEmTurma");
  while ($a = sqlsrv_fetch_array($stmt)) 
  {
    echo '<form class="pure-form pure-form-stacked" method="post" action="inscricoesEmTurma.php">
              <fieldset>
                <div class="pure-g">
                      <h5>
                        <div class="pure-u-23-24">
                          <input name="ra" class="pure-u-1-2" type="text" value="RA '.$a['ra'].'" readonly>
                        </div>
                      </h5>                      
                </div>
                <div class="pure-g">
                    <div class="pure-u-3-24"><p>Disciplina</p></div>
                    <div class="pure-u-2-24"><p>sigla Disciplina</p></div>
                    <div class="pure-u-2-24"><p>Creditos Praticos</p></div>
                    <div class="pure-u-2-24"><p>Creditos Teoricos</p></div>
                    <div class="pure-u-2-24"><p>sigla Turma</p></div>
                    <div class="pure-u-1-24"><p>ano</p></div>
                    <div class="pure-u-2-24"><p>semestre</p></div><!-- gambiarra -->
                    <div class="pure-u-1-24"><p>vagas</p></div>
                    <div class="pure-u-2-24"><p>inscricao Min</p></div>
                    <div class="pure-u-2-24"><p>inscricao Max</p></div>
                    <div class="pure-u-2-24"><p>situacao</p></div>
                    <div class="pure-u-2-24"><p>motivo</p></div>    
                </div>                
                  <div class="pure-g">
                      <div class="pure-u-3-24">
                          <input name="Disciplina" class="pure-u-23-24" type="text" value="'.$a['Disciplina'].'" readonly>
                      </div>
                      <div class="pure-u-1-12">
                          <input name="siglaDisciplina" class="pure-u-23-24" type="text" value="'.$a['siglaDisciplina'].'" readonly>
                      </div>
                      <div class="pure-u-1-12">
                          <input name="numCreditosPraticos" class="pure-u-23-24" type="text" value="'.$a['numCreditosPraticos'].'" readonly>
                      </div>
                      <div class="pure-u-1-12">
                          <input name="numCreditosTeoricos" class="pure-u-23-24" type="text" value="'.$a['numCreditosTeoricos'].'" readonly>
                      </div>
                      <div class="pure-u-2-24">
                          <input name="siglaTurma" class="pure-u-23-24" type="text" value="'.$a['siglaTurma'].'" readonly>
                      </div>
                      <div class="pure-u-1-24">
                          <input name="ano" class="pure-u-23-24" type="text" value="'.$a['ano'].'" readonly>
                      </div>
                      <div class="pure-u-2-24">
                          <input name="semestre" class="pure-u-23-24" type="text" value="'.$a['semestre'].'" readonly>
                      </div>
                      <div class="pure-u-1-24">
                          <input name="vagas" class="pure-u-23-24" type="text" value="'.$a['vagas'].'" readonly>
                      </div>
                      <div class="pure-u-1-12">
                          <input name="inscricaoMin" class="pure-u-23-24" type="text" value="'.$a['inscricaoMin'].'" readonly>
                      </div>
                      <div class="pure-u-1-12">
                          <input name="inscricaoMax" class="pure-u-23-24" type="text" value="'.$a['inscricaoMax'].'" readonly>
                      </div>
                      <div class="pure-u-1-12">
                          <input name="situacao" class="pure-u-23-24" type="text" value="'.$a['situacao'].'" readonly>
                      </div>
                      <div class="pure-u-1-12">
                          <input name="motivo" class="pure-u-23-24" type="text" value="'.$a['motivo'].'" readonly>
                      </div>
                      <div class="pure-u-1-12">  
                        <button type="submit" class="pure-button pure-button-primary" name="acao" value="apagar">Remover Inscrição</button>
                      </div>                      
              </fieldset>
          </form>';
  }


echo"<h2>
  <p>Lista de turmas diponíveis disponíveis para inscrição</p><hr>  
</h2>";

  $stmt = sqlsrv_query($conn, "SELECT * FROM Turma");
  while ($a = sqlsrv_fetch_array($stmt)) 
  {
    $GLOBALS['ra1']= '';
    echo '<form class="pure-form pure-form-stacked" method="post" action="inscricoesEmTurma.php">
              <fieldset>
                <div class="pure-g">
                    <div class="pure-u-1-24"><p>RA</p></div> <!-- Qdo tiver o login n vai precisar -->
                    <div class="pure-u-2-24"><p>semestre</p></div>
                    <div class="pure-u-2-24"><p>ano</p></div>
                    <div class="pure-u-2-24"><p>sigla da turma</p></div>
                    <div class="pure-u-2-24"><p>sigla Disciplina</p></div>
                    <div class="pure-u-2-24"><p>valida</p></div>
                    <div class="pure-u-1-24"><p>vagas</p></div>
                    <div class="pure-u">   
                        <div class="pure-u-24-24"><p>inscricao Min</p></div>
                    </div>
                    <div class="pure-u">   
                      <div class="pure-u-24-24"><p><pre>  </pre></p></div>
                    </div>
                    <div class="pure-u-2-24"><p> inscricao Max</p></div>
                </div>               

                  <div class="pure-g">
                      <div class="pure-u-1-24">
                        <input name="ra1" class="pure-u-23-24" type="text" value="'.$GLOBALS['ra1'].'">
                      </div>
                      <div class="pure-u-2-24">
                          <input name="semestre" class="pure-u-22-24" type="text" value="'.$a['semestre'].'" readonly>
                      </div>
                     <div class="pure-u-1-12">
                          <input name="ano" class="pure-u-23-24" type="text" value="'.$a['ano'].'" readonly>
                      </div>
                      <div class="pure-u-1-12">
                          <input name="siglaTurma" class="pure-u-23-24" type="text" value="'.$a['siglaTurma'].'" readonly>
                      </div>
                      <div class="pure-u-1-12">
                          <input name="siglaDisciplina" class="pure-u-23-24" type="text" value="'.$a['siglaDisciplina'].'" readonly>
                      </div>
                      <div class="pure-u-2-24">
                          <input name="valida" class="pure-u-23-24" type="text" value="'.$a['valida'].'" readonly>
                      </div>
                      <div class="pure-u-1-24">
                          <input name="vagas" class="pure-u-21-24" type="text" value="'.$a['vagas'].'" readonly>
                      </div>
                      <div class="pure-u">
                        <div class="pure-u-4-24">
                            <input name="inscricaoMin" class="pure-u-21-24" type="text" value="'.$a['inscricaoMin'].'" readonly>
                        </div>
                        <div class="pure-u-4-24">
                            <input name="inscricaoMax" class="pure-u-22-24" type="text" value="'.$a['inscricaoMax'].'" readonly>
                        </div>

                      <div class="pure-u-2-24">  
                        <button type="submit" class="pure-button pure-button-primary" name="acao" value="inserir">Me inscrever</button>
                      </div>
                  </div>                          
              </fieldset>
          </form>';
  }
?><!-- 
<form class="pure-form pure-form-stacked"  method="post" action="inscricoesEmTurma.php">
    <fieldset>
        <div class="pure-g">
            <div class="pure-u-1-24"><p>RA</p></div>
            <div class="pure-u-2-24"><p>sigla Disciplina</p></div>
            <div class="pure-u-2-24"><p>sigla Turma</p></div>
            <div class="pure-u-1-24"><p>ano</p></div>
            <div class="pure-u-2-24"><p>semestre</p></div>
            <div class="pure-u-16-24"><p></p></div>   

            <!-- Qdo tiver login nao vai precisar de RA-->
            <!--<div class="pure-u-1-24">
              <input name="ra" class="pure-u-23-24" type="text">
            </div>

            <div class="pure-u-1-12">
                <input name="siglaDisciplina" class="pure-u-23-24" type="text">
            </div>
            <div class="pure-u-2-24">
                <input name="siglaTurma" class="pure-u-23-24" type="text">
            </div>
            <div class="pure-u-1-24">
                <input name="ano" class="pure-u-23-24" type="text">
            </div>
            <div class="pure-u-1-24">
                <input name="semestre" class="pure-u-23-24" type="text">
            </div>
            <div class="pure-u-1-12">  
              <button type="submit" class="pure-button pure-button-primary" name="acao" value="inserir">Adicionar Inscrição</button>
            </div>  
        </div>
    </fieldset>
</form>
</html> -->