# Trabajo de Fin de Grado: *Accesibilidad en videojuegos para personas con visión reducida mediante estrategias de sonificación*

### Autora: María del Mar Martínez Robles
### Tutor: Antonio Bautista Bailón Morillas
___
En este repositorio no están los sonidos ni las imágenes empleadas
en el juego, debido a las limitaciones de tamaño y cantidad de
archivos de la plataforma y problemas con la propiedad intelectual
de los autores.

La documentación de este proyecto está realizada con `LaTeX`, por lo
tanto para generar el archivo PDF necesitaremos instalar `TeXLive` en
nuestra distribución.

Una vez instalada, tan solo deberemos situarnos en el directorio `doc` y ejecutar:

`
$ pdflatex main.tex
`

Seguido por

    bibtex main
    
y de nuevo

    pdflatex main.tex

O directamente

    make
    
## Errores conocidos:
" No se encuentra el paquete spanish para babel "

Para `Debian`:
`
$ sudo apt-get install texlive-lang-european
`

" No se encuentra fourier.sty "

Para `Debian`:
`
$ sudo apt-get install texlive-fonts-extra
`
