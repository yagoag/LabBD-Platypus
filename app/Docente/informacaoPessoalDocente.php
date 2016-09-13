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
        <p>Informações pessoais do Docente</p>  
      </h2>';

  if (isset($_POST['acao'])) 
  {
    if ($_POST['acao'] == 'editar') 
    {
      $stmt = sqlsrv_query($conn, "UPDATE vInfoPessoalDocente
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
                                        siape            = '".$_POST['siape']."'           ,
                                        gabineteLocal            = '".$_POST['gabineteLocal']."'           ,
                                        gabineteTelDDD            = '".$_POST['gabineteTelDDD']."'           ,
                                        gabineteTelSufixo            = '".$_POST['gabineteTelSufixo']."'           ,
                                        gabineteTelPrefixo            = '".$_POST['gabineteTelPrefixo']."'           
                                        
                                   WHERE cpf = '".$_POST['cpf']."'");
      if (!$stmt) {
          echo 'Ocorreu um erro ao atualizar suas informações pessoais.';
      } else
          echo 'Suas informações pessoais foram atualizadas com sucesso.';
    }  
  }
?>
 
<?php
  $siape = $_SESSION['siape'];
  $stmt = sqlsrv_query($conn, "SELECT * FROM vInfoPessoalDocente WHERE siape = '$siape'");
  while ($a = sqlsrv_fetch_array($stmt)) 
  {
    echo '<form class="pure-form pure-form-stacked" method="post" action="informacaoPessoalDocente.php">
              <fieldset>
                <div class="pure-g">
                      <h5>
                        <div class="pure-u-23-24">
                          <input name="Siape" class="pure-u-1-2" type="text" value="Siape '.$a['siape'].'" readonly>
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

                      <div class="pure-u-1-5"><p>Siape</p></div>
                      <div class="pure-u-1-5"><p>Gabinete Local</p></div>
                      <div class="pure-u-1-5"><p>Gabinete Tel DDD</p></div>
                      <div class="pure-u-1-5"><p>Gabinete Tel Prefixo</p></div>
                      <div class="pure-u-1-5"><p>Gabinete Tel Sufixo</p></div>

                        
                      <div class="pure-u-1-5">
                          <input name="siape" class="pure-u-23-24" type="text" value="'.$a['siape'].'">
                      </div>
                      <div class="pure-u-1-5">
                          <input name="gabineteLocal" class="pure-u-23-24" type="text" value="'.$a['gabineteLocal'].'">
                      </div>
                      <div class="pure-u-1-5">
                          <input name="gabineteTelDDD" class="pure-u-23-24" type="text" value="'.$a['gabineteTelDDD'].'">
                      </div>
                      <div class="pure-u-1-5">
                          <input name="gabineteTelPrefixo" class="pure-u-23-24" type="text" value="'.$a['gabineteTelPrefixo'].'">
                      </div>
                      <div class="pure-u-1-5">
                          <input name="gabineteTelSufixo" class="pure-u-23-24" type="text" value="'.$a['gabineteTelSufixo'].'">
                      </div>
                     
                      <div class="pure-u-1-5">  
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
