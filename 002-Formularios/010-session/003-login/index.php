<?php
$class="";
$mng="";
/*Primero preguntamos si existe dato almacenado, ya que ello querría decir que el usuario ya se había logueado*/
session_start();
if (isset($_SESSION["emailUser"])) {
    header("location:perfil.php");
} else {
    /*Si no es así, me mantengo a la espera de recibir info del formulario y validarlo*/
    if ($_POST) {
	extract($_POST); //$email, $password

	if ($email == "kike@cice.es" && $password == "1234") {
	    
	    $_SESSION["emailUser"] = $email;
	    header("location:perfil.php");
	} else {
	    $class = 2;
	    $mng = "Usuario o contraseña incorrecta";
	}
    }
}
?>

<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
	<link href="style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body id="login">
	
	<h1>Login</h1>
	<form action="<?= $_SERVER["PHP_SELF"] ?>" method="post">
	    <input type="email" name="email" placeholder="Email" required>
	    <input type="password" name="password" placeholder="Password">
	    <input type="submit" value="Entrar">
	</form>
	<p class="mgn_<?=$class?>"><?= $mng ?></p>
	
    </body>
</html>
