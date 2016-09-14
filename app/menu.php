<?php
  @session_start();
  require_once 'config.php';

  // Verifica se é aluno
  $stmt = sqlsrv_query($conn, 'SELECT ra FROM Aluno WHERE cpf = '.$_SESSION['cpf']);
  $_SESSION['papeis']['aluno'] = sqlsrv_has_rows($stmt);
  if ($_SESSION['papeis']['aluno']) {
    $_SESSION['ra'] = sqlsrv_fetch_array($stmt)['ra'];
  }

  // Verifica se é funcionário
  $stmt = sqlsrv_query($conn, 'SELECT siape FROM Funcionario WHERE cpf = '.$_SESSION['cpf']);
  if (sqlsrv_has_rows($stmt)) {
    $_SESSION['siape'] = sqlsrv_fetch_array($stmt)['siape'];
    
    // Verifica se é técnico
    $stmt = sqlsrv_query($conn, 'SELECT siape FROM Tecnico WHERE siape = '.$_SESSION['siape']);
    $_SESSION['papeis']['tecnico']  = sqlsrv_has_rows($stmt);
    
    // Verifica se é docente
    $stmt = sqlsrv_query($conn, 'SELECT siape FROM Docente WHERE siape = '.$_SESSION['siape']);
    $_SESSION['papeis']['docente']  = sqlsrv_has_rows($stmt);
    
    // Verifica se é Chefe de Departamento
    $stmt = sqlsrv_query($conn, "SELECT siape FROM DocenteTemCargoAdministrativo WHERE siape = ".$_SESSION['siape']." AND nomeCargo = 'Chefe de Departamento'");
    $_SESSION['papeis']['chefedepto']  = sqlsrv_has_rows($stmt);
    
    $stmt = sqlsrv_query($conn, "SELECT siape FROM DocenteTemCargoAdministrativo WHERE siape = ".$_SESSION['siape']." AND nomeCargo = 'Coordenador de Curso'");
    $_SESSION['papeis']['coordcurso']  = sqlsrv_has_rows($stmt);
  } else {
      $_SESSION['papeis']['tecnico']  = false;
      $_SESSION['papeis']['docente']  = false;
      $_SESSION['papeis']['chefedepto']  = false;
      $_SESSION['papeis']['coordcurso']  = false;
  }
?>
<div class="pure-menu">
    <ul class="pure-menu-list">
      <?php
        if ($_SESSION['papeis']['aluno']) {
      ?>
        <div class="pure-menu-heading">Aluno</div>

        <ul class="pure-menu-list">
            <li class="pure-menu-item"><a href="informacaoPessoalAluno.php" class="pure-menu-link">Informações Pessoais</a></li>
            <li class="pure-menu-item"><a href="inscricoesEmTurma.php" class="pure-menu-link">Inscrições</a></li>
            <li class="pure-menu-item"><a href="historicoDeDisciplinas.php" class="pure-menu-link">Histórico de Disciplinas</a></li>
            <li class="pure-menu-item"><a href="historicoAluno.php" class="pure-menu-link">Histórico Escolar</a></li>
            <li class="pure-menu-item"><a href="deferimento.php" class="pure-menu-link">Deferimentos</a></li>
        </ul>
      <?php
        }
        if ($_SESSION['papeis']['tecnico']) {
      ?>
        <div class="pure-menu-heading">Tecnico</div>

        <ul class="pure-menu-list">
            <li class="pure-menu-item"><a href="InfoTecPessoais.php" class="pure-menu-link">Informações Pessoais</a></li>
            <li class="pure-menu-item"><a href="licencas.php" class="pure-menu-link">Licenças</a></li>
        </ul>
      <?php
        }
      
        if ($_SESSION['papeis']['docente']) {
      ?>
        <div class="pure-menu-heading">Docente</div>

        <ul class="pure-menu-list">
            <li class="pure-menu-item"><a href="informacaoPessoalDocente.php" class="pure-menu-link">Informação Pessoal</a></li>
            <li class="pure-menu-item"><a href="licencas.php" class="pure-menu-link">Licenças</a></li>
        </ul>
      <?php
        }
        if ($_SESSION['papeis']['chefedepto']) {
      ?>
        <div class="pure-menu-heading">Chefe de Departamento</div>

        <ul class="pure-menu-list">
            <li class="pure-menu-item"><a href="turmas.php" class="pure-menu-link">Turmas</a></li>
            <li class="pure-menu-item"><a href="licencas.php" class="pure-menu-link">Licenças</a></li>
        </ul>
      <?php
        }
      
        if ($_SESSION['papeis']['coordcurso']) {
      ?>
      
      <?php
        }
      ?>
  </ul>
</div>