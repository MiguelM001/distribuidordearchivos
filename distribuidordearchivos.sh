#!/bin/bash
#
#
# TITULO: PEQUEÑO SCRIPT QUE DIVIDE UN DIRECTORIO EN VARIOS SUBDIRECTORIOS CON ARCHIVOS DEL MISMO FORMATO
#
# SUSCERTE: VENCERT
# DIRECCION DEL VENCERT
# AUTOR: MIGUEL MARQUEZ 
# CARACAS, MARZO DEL 2022
#
# distribuidordearchivos.sh V1.0
#

echo "Iniciando Copia de Archivos"

/usr/bin/ls -h > formatos_x.txt
/bin/chmod 777 -R formatos_x.txt

contador=1
contCarpetas=1
numeroDeArchivos=50 #cantidad de archivos para cada carpeta

/usr/bin/mkdir "archivos_x".${contCarpetas}

#echo $contador
#/usr/bin/mkdir  "archivos_x."${contCarpetas}

while IFS= read -r line

	do
		let modulo=$contador%$numeroDeArchivos
		
		if [ $modulo -eq 0 ]
		then
			contCarpetas=$((contCarpetas+1))
			
			/usr/bin/mkdir "archivos_x".${contCarpetas}
			/usr/bin/mv $line "archivos_x".${contCarpetas}
		else
			#echo "$line >  archivos_java.${contCarpetas}"
			/usr/bin/mv $line "archivos_x".${contCarpetas}
		
		fi
		
		contador=$((contador+1))
		
done < formatos_x.txt

echo "Copia de Archivos finalizada"
