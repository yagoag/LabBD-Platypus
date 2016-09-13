<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
</head>
<?php
session_start();
require_once 'config.php';
echo '<h2>
        <p>Informações pessoais do Aluno</p>  
      </h2>';

  if (isset($_POST['acao'])) 
  {
    if ($_POST['acao'] == 'editar') 
    {
      $stmt = sqlsrv_query($conn, "UPDATE vInfoPessoalAluno 
                                   SET cpf               = '".$_POST['cpf']."'              , 
                                       senha             = '".$_POST['senha']."'            , 
                                       sobreNome         = '".$_POST['sobreNome']."'        , 
                                       preNome           = '".$_POST['preNome']."'          , 
                                       rgCod             = '".$_POST['rgCod']."'            ,
                                       rgOrg             = '".$_POST['rgOrg']."'            ,
                                       endLog            = '".$_POST['endLog']."'           ,
                                       endNum            = '".$_POST['endNum']."'           ,
                                       endCid            = '".$_POST['endCid']."'           ,
                                       endBai            = '".$_POST['endBai']."'           ,
                                       endCEP            = '".$_POST['endCEP']."'           ,
                                       sexoDoc           = '".$_POST['sexoDoc']."'          ,
                                       sexoDesc          = '".$_POST['sexoDesc']."'         ,
                                       sexoNome          = '".$_POST['sexoNome']."'         ,
                                       maePrenome        = '".$_POST['maePrenome']."'       ,
                                       maeSobrenome      = '".$_POST['maeSobrenome']."'     ,
                                       paiPrenome        = '".$_POST['paiPrenome']."'       ,
                                       paiSobrenome      = '".$_POST['paiSobrenome']."'     ,
                                       nascData          = '".$_POST['nascData']."'         ,
                                       nascLocal         = '".$_POST['nascLocal']."'        ,
                                       nascUF            = '".$_POST['nascUF']."'           ,
                                       emailProvedor     = '".$_POST['emailProvedor']."'    ,
                                       emailEndereco     = '".$_POST['emailEndereco']."'    ,
                                       ensMedAnoTermino  = '".$_POST['ensMedAnoTermino']."' ,
                                       ensMedInstituicao = '".$_POST['ensMedInstituicao']."' 
                                   WHERE cpf = '".$_POST['cpf']."'");
      if (!$stmt) {
          echo 'Ocorreu um erro ao atualizar suas informações pessoais.';
      } else
          echo 'Suas informações pessoais foram atualizadas com sucesso.';
    }  
  }
?>
 
<?php
  $ra = $_SESSION['ra'];
  $stmt = sqlsrv_query($conn, "SELECT * FROM vInfoPessoalAluno WHERE ra = '$ra' ");
  while ($a = sqlsrv_fetch_array($stmt)) 
  {
    echo '<form class="pure-form pure-form-stacked" method="post" action="informacaoPessoalAluno.php">
              <fieldset>
                <div class="pure-g">
                      <h5>
                        <div class="pure-u-23-24">
                          <input name="RA" class="pure-u-1-2" type="text" value="RA '.$a['ra'].'" readonly>
                        </div>
                      </h5>                      
                </div>
                <div class="pure-g"> 

                      <div class="pure-u-1-12"><p>CPF</p></div>
                      <div class="pure-u-1-12"><p>senha</p></div>
                      <div class="pure-u-1-12"><p>sobre Nome</p></div>
                      <div class="pure-u-1-12"><p>pré-Nome</p></div>
                      <div class="pure-u-1-12"><p>Códido RG</p></div>
                      <div class="pure-u-1-12"><p>Orgão RG</p></div>
                      <div class="pure-u-3-24"><p>Logradouro</p></div>
                      <div class="pure-u-1-12"><p>Número</p></div>
                      <div class="pure-u-1-12"><p>Cidade</p></div>
                      <div class="pure-u-1-12"><p>Bairro</p></div>
                      <div class="pure-u-1-12"><p>CEP</p></div>
                      
                      <div class="pure-u-1-12">
                          <input name="cpf" class="pure-u-23-24" type="text" value="'.$a['cpf'].'">
                      </div>
                      <div class="pure-u-1-12">
                          <input name="senha" class="pure-u-23-24" type="text" value="'.$a['senha'].'">
                      </div>
                      <div class="pure-u-1-12">
                          <input name="sobreNome" class="pure-u-23-24" type="text" value="'.$a['sobreNome'].'">
                      </div>
                      <div class="pure-u-1-12">
                          <input name="preNome" class="pure-u-23-24" type="text" value="'.$a['preNome'].'">
                      </div>
                      <div class="pure-u-1-12">
                          <input name="rgCod" class="pure-u-23-24" type="text" value="'.$a['rgCod'].'">
                      </div>
                      <div class="pure-u-1-12">
                          <input name="rgOrg" class="pure-u-23-24" type="text" value="'.$a['rgOrg'].'">
                      </div>
                      <div class="pure-u-3-24">
                          <input name="endLog" class="pure-u-23-24" type="text" value="'.$a['endLog'].'">
                      </div>
                      <div class="pure-u-1-12">
                          <input name="endNum" class="pure-u-23-24" type="text" value="'.$a['endNum'].'">
                      </div>
                      <div class="pure-u-1-12">
                          <input name="endCid" class="pure-u-7-8" type="text" value="'.$a['endCid'].'">
                      </div>
                      <div class="pure-u-1-12">
                          <input name="endBai" class="pure-u-23-24" type="text" value="'.$a['endBai'].'">
                      </div>
                      <div class="pure-u-1-12">
                          <input name="endCEP" class="pure-u-23-24" type="text" value="'.$a['endCEP'].'">
                      </div>

                      <div class="pure-u-1-12"><p>Docs-sexo</p></div>
                      <div class="pure-u-1-12"><p>sexo Desc</p></div>
                      <div class="pure-u-1-12"><p>sexo Nome</p></div>
                      <div class="pure-u-1-12"><p>Pré-nome mãe</p></div>
                      <div class="pure-u-1-12"><p>Sobre-nome mãe</p></div>
                      <div class="pure-u-1-12"><p>Pré-nome pai</p></div>
                      <div class="pure-u-1-12"><p>Sobrenome pai</p></div>
                      <div class="pure-u-1-12"><p>Data de nascimento</p></div>    
                      <div class="pure-u-1-12"><p>Local de nascimento</p></div>
                      <div class="pure-u-1-12"><p>UF</p></div>
                      <div class="pure-u-4-24"><p>email Provedor</p></div>
                        
                      <div class="pure-u-1-12">
                          <input name="sexoDoc" class="pure-u-23-24" type="text" value="'.$a['sexoDoc'].'">
                      </div>
                      <div class="pure-u-1-12">
                          <input name="sexoDesc" class="pure-u-23-24" type="text" value="'.$a['sexoDesc'].'">
                      </div>
                      <div class="pure-u-1-12">
                          <input name="sexoNome" class="pure-u-23-24" type="text" value="'.$a['sexoNome'].'">
                      </div>
                      <div class="pure-u-1-12">
                          <input name="maePrenome" class="pure-u-23-24" type="text" value="'.$a['maePrenome'].'">
                      </div>
                      <div class="pure-u-1-12">
                          <input name="maeSobrenome" class="pure-u-23-24" type="text" value="'.$a['maeSobrenome'].'">
                      </div>
                      <div class="pure-u-1-12">
                          <input name="paiPrenome" class="pure-u-23-24" type="text" value="'.$a['paiPrenome'].'">
                      </div>
                      <div class="pure-u-1-12">
                          <input name="paiSobrenome" class="pure-u-23-24" type="text" value="'.$a['paiSobrenome'].'">
                      </div>
                      <div class="pure-u-1-12">
                          <input name="nascData" class="pure-u-23-24" type="text" value="'.$a['nascData']->format('d/m/Y').'">
                      </div>

                      <div class="pure-u-1-12">
                          <input name="nascLocal" class="pure-u-23-24" type="text" value="'.$a['nascLocal'].'">
                      </div>
                      <div class="pure-u-1-12">
                          <input name="nascUF" class="pure-u-23-24" type="text" value="'.$a['nascUF'].'">
                      </div>
                      <div class="pure-u-1-12">
                          <input name="emailProvedor" class="pure-u-23-24" type="text" value="'.$a['emailProvedor'].'">
                      </div>
                      
                      <div class="pure-u-12-12"><div> <! Da uma especie de quebra de linha -->

                      <div class="pure-u-3-24"><p>email Endereco</p></div>
                      <div class="pure-u-2-24"><p>Ensino Médio - Ano Término</p></div>

                      <!-- Tem q espaçar mais ensMedAnoTermino e ensMedInstituicao-->

                      <div class="pure-u-3-24"><p>Ensino Médio - Instituição</p></div>
                      
                      <div class="pure-u-17-24"><div> <! Da uma especie de quebra de linha -->
                      
                      <div class="pure-u-4-24">
                          <input name="emailEndereco" class="pure-u-23-24" type="text" value="'.$a['emailEndereco'].'">
                      </div>
                      <div class="pure-u-3-24">
                          <input name="ensMedAnoTermino" class="pure-u-23-24" type="text" value="'.$a['ensMedAnoTermino'].'">
                      </div>

                      <div class="pure-u-3-24">
                          <input name="ensMedInstituicao" class="pure-u-23-24" type="text" value="'.$a['ensMedInstituicao'].'">
                      </div>
                      <div class="pure-u-1-12">  
                        <button type="submit" class="pure-button pure-button-primary" name="acao" value="editar">Editar</button>
                      </div>
                      <!--<div class="pure-u-1-12">  
                        <button type="submit" class="pure-button pure-button-primary" name="acao" value="apagar">Apagar</button>
                      </div>-->
                  </div>
              </fieldset>
          </form>';
  }
?> 
 <!-- <form class="pure-form pure-form-stacked"  method="post" action="informacaoPessoalAlunoAntigo.php">
      <fieldset>
          <div class="pure-g">
              <div class="pure-u-1-12">
                  <input name="cpf" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-1-12">
                  <input name="senha" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-1-12">
                  <input name="sobreNome" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-4-24">
                  <input name="preNome" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-4-24">
                  <input name="rgCod" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-1-12">
                  <input name="rgOrg" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-4-24">
                  <input name="endLog" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-4-24">
                  <input name="endNum" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-4-24">
                  <input name="endCid" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-1-12">
                  <input name="endBai" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-4-24">
                  <input name="endCEP" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-4-24">
                  <input name="ra" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-4-24">
                  <input name="sexoDoc" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-4-24">
                  <input name="sexoDesc" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-4-24">
                  <input name="sexoNome" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-1-12">
                  <input name="maePrenome" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-4-24">
                  <input name="maeSobrenome" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-4-24">
                  <input name="paiPrenome" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-4-24">
                  <input name="paiSobrenome" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-4-24">
                  <input name="nascData" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-4-24">
                  <input name="nascLocal" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-1-12">
                  <input name="nascUF" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-4-24">
                  <input name="emailProvedor" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-4-24">
                  <input name="emailEndereco" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-4-24">
                  <input name="ensMedAnoTermino" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-4-24">
                  <input name="ensMedInstituicao" class="pure-u-23-24" type="text">
              </div>
              <div class="pure-u-4-24">  
                  <button type="submit" class="pure-button pure-button-primary" name="acao" value="adicionar">Adicionar</button>
              </div>
          </div>
      </fieldset>
  </form>
</html> -->