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
					siape <input name="siape" class="pure-u-1-2" type="text" value="'.$a['siape'].'" readonly>
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
	echo '<h4>
<p>Atividades</p>  
</h4>';
$stmt2 = sqlsrv_query($conn, "SELECT * FROM PlanoDeEnsino_Atividades WHERE semestre = ".$a['semestre']." AND ano = ".$a['ano']." AND siglaTurma = '".$a['siglaTurma']."' AND siglaDisciplina = '".$a['siglaDisciplina']."'");
while ($a2 = sqlsrv_fetch_array($stmt2)) 
{

	echo '<form class="pure-form pure-form-stacked" method="post" action="planodeensinodocente.php">
	<fieldset>
		<input name="semestre" type="hidden" value="'.$a2['semestre'].'" readonly>
		<input name="ano" type="hidden" value="'.$a2['ano'].'" readonly>
		<input name="siglaTurma" type="hidden" value="'.$a2['siglaTurma'].'" readonly>
		<input name="siglaDisciplina" type="hidden" value="'.$a2['siglaDisciplina'].'" readonly>
		<input name="id" type="hidden" value="'.$a2['id'].'" readonly>
	
		<div class="pure-g"> 
			<div class="pure-u-1-24"><p>Horas</p></div>
			<div class="pure-u-23-24">
				<input name="horas" class="pure-u-23-24" type="number" value="'.$a2['horas'].'">
			</div>

			<div class="pure-u-1-24"><p>Atividade</p></div>
			<div class="pure-u-23-24">
				<input name="atividade" class="pure-u-23-24" type="text" value="'.$a2['atividade'].'">
			</div>

			<div class="pure-u-1-5">  
				<button type="submit" class="pure-button pure-button-primary" name="acao" value="editarAtividades">Editar</button>
			</div>
	</div>
</fieldset>
</form>';
}
	echo '<h4>
<p>Recursos</p>  
</h4>';
$stmt3 = sqlsrv_query($conn, "SELECT * FROM PlanoDeEnsino_Recurso WHERE semestre = ".$a['semestre']." AND ano = ".$a['ano']." AND siglaTurma = '".$a['siglaTurma']."' AND siglaDisciplina = '".$a['siglaDisciplina']."'");
while ($a3 = sqlsrv_fetch_array($stmt3)) 
{
	echo '<form class="pure-form pure-form-stacked" method="post" action="planodeensinodocente.php">
	<fieldset>
		<input name="semestre" type="hidden" value="'.$a3['semestre'].'" readonly>
		<input name="ano" type="hidden" value="'.$a3['ano'].'" readonly>
		<input name="siglaTurma" type="hidden" value="'.$a3['siglaTurma'].'" readonly>
		<input name="siglaDisciplina" type="hidden" value="'.$a3['siglaDisciplina'].'" readonly>
	
		<div class="pure-g"> 
			<div class="pure-u-1-24"><p>Recurso</p></div>
			<div class="pure-u-23-24">
				<input name="recurso" class="pure-u-23-24" type="text" value="'.$a3['recurso'].'">
			</div>

			<div class="pure-u-1-5">  
				<button type="submit" class="pure-button pure-button-primary" name="acao" value="editarAtividades">Editar</button>
			</div>
	</div>
</fieldset>
</form>';
}
	echo '<h4>
<p>EAD</p>  
</h4>';
$stmt4 = sqlsrv_query($conn, "SELECT * FROM PlanoDeEnsino_EAD WHERE semestre = ".$a['semestre']." AND ano = ".$a['ano']." AND siglaTurma = '".$a['siglaTurma']."' AND siglaDisciplina = '".$a['siglaDisciplina']."'");
while ($a4 = sqlsrv_fetch_array($stmt4)) 
{
	echo '<form class="pure-form pure-form-stacked" method="post" action="planodeensinodocente.php">
	<fieldset>
		<input name="semestre" type="hidden" value="'.$a4['semestre'].'" readonly>
		<input name="ano" type="hidden" value="'.$a4['ano'].'" readonly>
		<input name="siglaTurma" type="hidden" value="'.$a4['siglaTurma'].'" readonly>
		<input name="siglaDisciplina" type="hidden" value="'.$a4['siglaDisciplina'].'" readonly>
	
		<div class="pure-g"> 
			<div class="pure-u-1-24"><p>Horas</p></div>
			<div class="pure-u-23-24">
				<input name="horas" class="pure-u-23-24" type="number" value="'.$a4['horas'].'">
			</div>

			<div class="pure-u-1-24"><p>Atividade</p></div>
			<div class="pure-u-23-24">
				<input name="atividade" class="pure-u-23-24" type="text" value="'.$a4['atividade'].'">
			</div>
			<div class="pure-u-1-5">  
				<button type="submit" class="pure-button pure-button-primary" name="acao" value="editarAtividades">Editar</button>
			</div>
	</div>
</fieldset>
</form>';
}
	echo '<h4>
<p>Distribuicao de Horas</p>  
</h4>';
$stmt5 = sqlsrv_query($conn, "SELECT * FROM PlanoDeEnsino_DistribHoras WHERE semestre = ".$a['semestre']." AND ano = ".$a['ano']." AND siglaTurma = '".$a['siglaTurma']."' AND siglaDisciplina = '".$a['siglaDisciplina']."'");
while ($a5 = sqlsrv_fetch_array($stmt5)) 
{
	echo '<form class="pure-form pure-form-stacked" method="post" action="planodeensinodocente.php">
	<fieldset>
		<input name="semestre" type="hidden" value="'.$a5['semestre'].'" readonly>
		<input name="ano" type="hidden" value="'.$a5['ano'].'" readonly>
		<input name="siglaTurma" type="hidden" value="'.$a5['siglaTurma'].'" readonly>
		<input name="siglaDisciplina" type="hidden" value="'.$a5['siglaDisciplina'].'" readonly>
	
		<div class="pure-g"> 
			<div class="pure-u-1-24"><p>Horas</p></div>
			<div class="pure-u-23-24">
				<input name="horas" class="pure-u-23-24" type="number" value="'.$a5['horas'].'">
			</div>

			<div class="pure-u-1-24"><p>Atividade</p></div>
			<div class="pure-u-23-24">
				<input name="atividade" class="pure-u-23-24" type="text" value="'.$a5['atividade'].'">
			</div>
			<div class="pure-u-1-5">  
				<button type="submit" class="pure-button pure-button-primary" name="acao" value="editarAtividades">Editar</button>
			</div>
	</div>
</fieldset>
</form>';
}
	echo '<h4>
<p>Bibliografia Basica</p>  
</h4>';
$stmt6 = sqlsrv_query($conn, "SELECT * FROM PlanoDeEnsino_BibliografiaBasica WHERE semestre = ".$a['semestre']." AND ano = ".$a['ano']." AND siglaTurma = '".$a['siglaTurma']."' AND siglaDisciplina = '".$a['siglaDisciplina']."'");
while ($a6 = sqlsrv_fetch_array($stmt6)) 
{
	echo '<form class="pure-form pure-form-stacked" method="post" action="planodeensinodocente.php">
	<fieldset>
		<input name="semestre" type="hidden" value="'.$a6['semestre'].'" readonly>
		<input name="ano" type="hidden" value="'.$a6['ano'].'" readonly>
		<input name="siglaTurma" type="hidden" value="'.$a6['siglaTurma'].'" readonly>
		<input name="siglaDisciplina" type="hidden" value="'.$a6['siglaDisciplina'].'" readonly>
	
		<div class="pure-g"> 
			<div class="pure-u-1-24"><p>Titulo</p></div>
			<div class="pure-u-23-24">
				<input name="titulo" class="pure-u-23-24" type="text" value="'.$a6['titulo'].'">
			</div>

			<div class="pure-u-1-24"><p>Editor</p></div>
			<div class="pure-u-23-24">
				<input name="editor" class="pure-u-23-24" type="text" value="'.$a6['editor'].'">
			</div>

			<div class="pure-u-1-24"><p>Ano</p></div>
			<div class="pure-u-23-24">
				<input name="bibAno" class="pure-u-23-24" type="number" value="'.$a6['bibAno'].'">
			</div>

			<div class="pure-u-1-24"><p>Autor</p></div>
			<div class="pure-u-23-24">
				<input name="autor" class="pure-u-23-24" type="text" value="'.$a6['autor'].'">
			</div>

			<div class="pure-u-1-5">  
				<button type="submit" class="pure-button pure-button-primary" name="acao" value="editarAtividades">Editar</button>
			</div>
	</div>
</fieldset>
</form>';
}

	echo '<h4>
<p>Bibliografia Complementar</p>  
</h4>';
$stmt7 = sqlsrv_query($conn, "SELECT * FROM PlanoDeEnsino_BibliografiaComplementar WHERE semestre = ".$a['semestre']." AND ano = ".$a['ano']." AND siglaTurma = '".$a['siglaTurma']."' AND siglaDisciplina = '".$a['siglaDisciplina']."'");
while ($a7 = sqlsrv_fetch_array($stmt7)) 
{
	echo '<form class="pure-form pure-form-stacked" method="post" action="planodeensinodocente.php">
	<fieldset>
		<input name="semestre" type="hidden" value="'.$a7['semestre'].'" readonly>
		<input name="ano" type="hidden" value="'.$a7['ano'].'" readonly>
		<input name="siglaTurma" type="hidden" value="'.$a7['siglaTurma'].'" readonly>
		<input name="siglaDisciplina" type="hidden" value="'.$a7['siglaDisciplina'].'" readonly>
	
		<div class="pure-g"> 
			<div class="pure-u-1-24"><p>Titulo</p></div>
			<div class="pure-u-23-24">
				<input name="titulo" class="pure-u-23-24" type="text" value="'.$a7['titulo'].'">
			</div>

			<div class="pure-u-1-24"><p>Editor</p></div>
			<div class="pure-u-23-24">
				<input name="editor" class="pure-u-23-24" type="text" value="'.$a7['editor'].'">
			</div>

			<div class="pure-u-1-24"><p>Ano</p></div>
			<div class="pure-u-23-24">
				<input name="bibAno" class="pure-u-23-24" type="number" value="'.$a7['bibAno'].'">
			</div>

			<div class="pure-u-1-24"><p>Autor</p></div>
			<div class="pure-u-23-24">
				<input name="autor" class="pure-u-23-24" type="text" value="'.$a7['autor'].'">
			</div>

			<div class="pure-u-1-5">  
				<button type="submit" class="pure-button pure-button-primary" name="acao" value="editarAtividades">Editar</button>
			</div>
	</div>
</fieldset>
</form>';
}

	echo '<h4>
<p>Tópico</p>  
</h4>';
$stmt5 = sqlsrv_query($conn, "SELECT * FROM PlanoDeEnsino_Topico WHERE semestre = ".$a['semestre']." AND ano = ".$a['ano']." AND siglaTurma = '".$a['siglaTurma']."' AND siglaDisciplina = '".$a['siglaDisciplina']."'");
while ($a5 = sqlsrv_fetch_array($stmt5)) 
{
	echo '<form class="pure-form pure-form-stacked" method="post" action="planodeensinodocente.php">
	<fieldset>
		<input name="semestre" type="hidden" value="'.$a5['semestre'].'" readonly>
		<input name="ano" type="hidden" value="'.$a5['ano'].'" readonly>
		<input name="siglaTurma" type="hidden" value="'.$a5['siglaTurma'].'" readonly>
		<input name="siglaDisciplina" type="hidden" value="'.$a5['siglaDisciplina'].'" readonly>
		<input name="id" type="hidden" value="'.$a5['id'].'" readonly>
	
		<div class="pure-g"> 
			<div class="pure-u-1-24"><p>Horas</p></div>
			<div class="pure-u-23-24">
				<input name="horas" class="pure-u-23-24" type="number" value="'.$a5['horas'].'">
			</div>

			<div class="pure-u-1-24"><p>Topico</p></div>
			<div class="pure-u-23-24">
				<input name="topico" class="pure-u-23-24" type="text" value="'.$a5['topico'].'">
			</div>
			<div class="pure-u-1-5">  
				<button type="submit" class="pure-button pure-button-primary" name="acao" value="editarAtividades">Editar</button>
			</div>
	</div>
</fieldset>
</form>';
}

echo'<hr><br><br><br>';

}
?> 