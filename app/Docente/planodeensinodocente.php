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
<p>Planos de Ensino Docente</p>  
</h2>';


if (isset($_POST['acao'])) 
{
	if ($_POST['acao'] == 'editar') 
	{
		$stmt = sqlsrv_query($conn, "UPDATE PlanoEnsinoDocente
			SET 
			semestre           		= ".$_POST['semestre']."         , 
			ano           			= ".$_POST['ano']."         	   , 
			siglaTurma           	= '".$_POST['siglaTurma']."'       , 
			siglaDisciplina      	= '".$_POST['siglaDisciplina']."'  , 
			siape           		= '".$_POST['siape']."'            , 
			ementa           		= '".$_POST['ementa']."'           , 
			estrategia           	= '".$_POST['estrategia']."'       , 
			objetivosGerais         = '".$_POST['objetivosGerais']."'  , 
			objetivosEspecificos    = '".$_POST['objetivosEspecificos']."',
			sobreNome         		= '".$_POST['sobreNome']."'        , 
			preNome           		= '".$_POST['preNome']."'               
			WHERE semestre = ".$_POST['semestre']." 
			AND ano = ".$_POST['ano']." 
			AND siglaTurma = '".$_POST['siglaTurma']."'
			AND siglaDisciplina = '".$_POST['siglaDisciplina']."'
			");
		if (!$stmt) {
			echo 'Ocorreu um erro ao atualizar plano de ensino.';
			echo "UPDATE PlanoEnsinoDocente
			SET 
			semestre           		= ".$_POST['semestre']."         , 
			ano           			= ".$_POST['ano']."         	   , 
			siglaTurma           	= '".$_POST['siglaTurma']."'       , 
			siglaDisciplina      	= '".$_POST['siglaDisciplina']."'  , 
			siape           		= '".$_POST['siape']."'            , 
			ementa           		= '".$_POST['ementa']."'           , 
			estrategia           	= '".$_POST['estrategia']."'       , 
			objetivosGerais         = '".$_POST['objetivosGerais']."'  , 
			objetivosEspecificos    = '".$_POST['objetivosEspecificos']."',
			sobreNome         		= '".$_POST['sobreNome']."'        , 
			preNome           		= '".$_POST['preNome']."'               
			WHERE semestre = ".$_POST['semestre']." 
			AND ano = ".$_POST['ano']." 
			AND siglaTurma = '".$_POST['siglaTurma']."'
			AND siglaDisciplina = '".$_POST['siglaDisciplina']."'
			";
			echo '<pre>' ;
			print_r(sqlsrv_errors());
			echo '</pre>';
		} else
		echo 'Plano de ensino atualizado com sucesso.';
	}  
}
?>


<?php
$siape = $_SESSION['siape'];
$stmt = sqlsrv_query($conn, "SELECT * FROM PlanoEnsinoDocente WHERE siape = '$siape'");
while ($a = sqlsrv_fetch_array($stmt)) 
{
	echo '<form class="pure-form pure-form-stacked" method="post" action="planodeensinodocente.php">
	<fieldset>
		<div class="pure-g">
			<h5>
				<div class="pure-u-23-24">
					<input name="siape" class="pure-u-1-2" type="text" value="siape '.$a['siape'].'" readonly>
				</div>
			</h5>                      
		</div>
		<div class="pure-g"> 

			<div class="pure-u-1-24"><p>Nome</p></div>
			<div class="pure-u-23-24">
				<input name="preNome" class="pure-u-23-24" type="text" value="'.$a['preNome'].'" readonly>
			</div>

			<div class="pure-u-1-24"><p>Sobrenome</p></div>
			<div class="pure-u-23-24">
				<input name="sobreNome" class="pure-u-23-24" type="text" value="'.$a['sobreNome'].'" readonly>
			</div>

			<div class="pure-u-1-24"><p>Semestre</p></div>
			<div class="pure-u-23-24">
				<input name="semestre" class="pure-u-23-24" type="number" value="'.$a['semestre'].'" readonly>
			</div>

			<div class="pure-u-1-24"><p>Ano</p></div>
			<div class="pure-u-23-24">
				<input name="ano" class="pure-u-23-24" type="number" value="'.$a['ano'].'" readonly>
			</div>

			<div class="pure-u-1-24"><p>Turma</p></div>
			<div class="pure-u-23-24">
				<input name="siglaTurma" class="pure-u-23-24" type="text" value="'.$a['siglaTurma'].'" readonly>
			</div>

			<div class="pure-u-1-24"><p>Disciplina</p></div>
			<div class="pure-u-23-24">
				<input name="siglaDisciplina" class="pure-u-23-24" type="text" value="'.$a['siglaDisciplina'].'" readonly>
			</div>

			<div class="pure-u-1-24"><p>Ementa</p></div>
			<div class="pure-u-23-24">
				<input name="ementa" class="pure-u-23-24" type="text" value="'.$a['ementa'].'">
			</div>

			<div class="pure-u-1-24"><p>Estrategia</p></div>
			<div class="pure-u-23-24">
				<input name="estrategia" class="pure-u-23-24" type="text" value="'.$a['estrategia'].'">
			</div>

			<div class="pure-u-1-24"><p>Objetivos Gerais</p></div>
			<div class="pure-u-23-24">
				<input name="objetivosGerais" class="pure-u-23-24" type="text" value="'.$a['objetivosGerais'].'">
			</div>

			<div class="pure-u-1-24"><p>Objetivos Especificos</p></div>
			<div class="pure-u-23-24">
				<input name="objetivosEspecificos" class="pure-u-23-24" type="text" value="'.$a['objetivosEspecificos'].'">
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