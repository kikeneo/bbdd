<?php 
//1-2 conectamos
    include './inc/connect.php';
    
    //Validación de mensaje creado por insert 
    $mng="";
    if(isset($_GET["c"])){
        
        switch ($_GET[c]){ //$error
	case 1:
	    $mng="Contacto añadido correctamente";
	    break;
	case 2:
	    $mng="Error al guardar";
	    break;
	case 3:
	    $mng="Debes rellenar nombre y teléfono";
	    break;
    }
    }
?>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Agenda</title>
    </head>
    <body>
    <center>
        <h2>Nuevo contacto</h2>
        <form action="insert.php" method="post">
            <input type="text" name="nombre" placeholder="Nombre" required>
            <input type="text" name="apellidos" placeholder="Apellidos">
            <input type="text" name="tlfn" placeholder="Teléfono" required>
            <input type="email" name="email" placeholder="Email">
            <input type="text" name="foto" placeholder="Foto">
            
            <input type="submit" value="guardar">
        </form>
        <span><?=$mng?></span>
        <hr>
        
        <h1>Contactos</h1>
        
            <?php 
            //3- petición
            $sql = "select * from contactos order by nombre asc";
            $result = mysqli_query($link, $sql);
            
            //4- Obtener y procesar resultados
            $nfilas = mysqli_num_rows($result);
            ?>
        <section>
            <?php 
                if ($nfilas>0) { ?>
                   
                    <?php for($i=0;$i<$nfilas;$i++) {?>
                    <!--Nos ayudamos del bucle para convertir cada registro de la tabla almacenada en $result en un array asociativo-->
                        <?php $fila=  mysqli_fetch_array($result)?>
            <article>
                <img src="<?= $fila["foto"]?>" width="50">
                <p><?=$fila["nombre"]?> <?=$fila["apellidos"]?> <br> <?=$fila["telefono"]?> | <?=$fila["email"]?></p>
            </article>
            
            <?php } ?>
            
                <?php } ?>
            
            
                    
        </section>
        
    </center>
        
    </body>
</html>
