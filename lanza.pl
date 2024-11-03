#!/usr/bin/perl
#**************************************************************
#         		Pontificia Universidad Javeriana
#     Autor: J. Corredor
#     Fecha: Febrero 2024
#     Materia: Sistemas Operativos
#     Tema: Taller de Evaluación de Rendimiento
#     Fichero: script automatización ejecución por lotes 
#****************************************************************/

$Path = `pwd`;
chomp($Path);

$Nombre_Ejecutable = "MM_ejecutable";
@Size_Matriz = ("200","300");
@Num_Hilos = (1,2);
$Repeticiones = 2;

foreach $size (@Size_Matriz){
	foreach $hilo (@Num_Hilos) {
		$file = "$Path/$Nombre_Ejecutable-".$size."-Hilos-".$hilo.".csv";
		for ($i=0; $i<$Repeticiones; $i++) {
			system("$Path/$Nombre_Ejecutable $size $hilo  >> $file");
			#printf("$Path/$Nombre_Ejecutable $size $hilo \n");
		}
		#close($file); La línea close($file); es innecesaria y puede eliminarse sin afectar el funcionamiento del script, shell maneja la apertura y cierre del archivo automáticamente
	#$p=$p+1; La variable $p se incrementa en esta línea, pero no está inicializada previamente en el script ni se utiliza en ninguna otra parte.
	}
}
