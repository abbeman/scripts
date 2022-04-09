#!/bin/bash

read -p '1/3: Have you spec.d multipage pdf as Argument + Processfile alone in proc-dir? Otherwise ^C to abort: '
read -p '2/3: +wdir contains an "orig/"-directory?: '
read -p '3/3: And specified TargetDir in script-source? Otherwise ^C to abort: '

echo "saving origfilename"
origfilename=`basename *.pdf .pdf`


read -p 'Check pdf for num. of pages (rename-seqprop hardcoded to 3). ^C and change if not correct: '
evince ${origfilename}.pdf
clear
read -p 'Continue/Start processing?: '

cp ${origfilename}.pdf orig/

echo "splitting pdf into pages"
pdfseparate $1 %d.pdf

#=comment out for small 1-9 page doks (=eg. like 'svgrefx1-2021' etc) (**!)
echo "(renaming sequential pdf:s to 'sequential proper')"
~/dropbox-legacy/scripts/rename-sequentialproper.bash

###### read -p '(Remove orig multipage pdf? ^C if not: )'
###### echo "(removing)"
rm ${origfilename}.pdf

echo "downsizing individual pdf-pages *"
~/dropbox-legacy/scripts/./downsize_pdf.bash

echo "combining pdf pages"
gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=$origfilename.pdf -dBATCH *.pdf

# mkdir .sources
# mv [0-9][0-9]*.pdf .sources
mv ${origfilename}.pdf orig/
mv [0-9][0-9]*.pdf orig/
mv orig/${origfilename}.pdf .
# mv ${origfilename}.pdf .sources 

audacious ~/Dropbox/rsc/media/au/ding.mp3 &
clear
read -p 'Check done_pdf before copying to Storage HD:s ;)  ^C if resulting pdf not correct(!): '
evince ${origfilename}.pdf
clear
read -p 'Continue(=Copying done to Storage HD:s)?: '

targetdir='doc_newest2019'
#		doc_newest2019
#		Documents/doks
#		Documents/doks_mernytt/lang/SV
#		bluelegend/SailfishOS/mersdk
#		Pictures/galaxykameran2014ag-2015
#		pictures_papperbort2019/Camera
#		pictures_papperbort2019/Camera/Grey_AlltOmBilen
#		pictures_papperbort2019/Camera/minificklexikon-Tyska
#		pictures_papperbort2019/Camera/PALjudPerfekt
#		pictures_papperbort2019/Camera/RedovisnGrunder
#		Pictures/projs/z_NYA/0_sept2018

cp ${origfilename}.pdf /media/bluelegend/8b66662c-fce3-4420-869d-beff2c3286f91/${targetdir}/${origfilename}.pdf
cp ${origfilename}.pdf /media/bluelegend/Verbatim/${targetdir}/${origfilename}.pdf
cp ${origfilename}.pdf /media/bluelegend/4f0df23e-4f40-470d-a87c-d33022d40948/${targetdir}/${origfilename}.pdf
# cp ${origfilename}.pdf /home/bluelegend/${targetdir}/${origfilename}.pdf


# donepdf_size=`ls -sh *.pdf | sed 's/ .*//'`

audacious ~/Dropbox/rsc/media/au/ding.mp3 &
clear
read -p 'All done!: '
# read -p "All done\! Size of resulting pdf is $donepdf_size\!: "




# orig 2019

##   read -p 'Have you spec.d multipage pdf as Argument + Processfile alone in proc-dir? Otherwise ^C to abort: '
##   
##   echo "saving origfilename"
##   origfilename=`basename *.pdf .pdf`
##   
##   
##   echo "splitting pdf into pages"
##   pdfseparate $1 %d.pdf
##   
##   echo "(renaming sequential pdf:s to 'sequential proper')"
##   rename-sequentialproper.bash
##   
##   
##   read -p '(Remove orig multipage pdf? ^C if not: )'
##   echo "(removing)"
##   rm ${origfilename}.pdf
##   
##   echo "downsizing individual pdf-pages *"
##   downsize_pdf.bash
##   
##   echo "combining pdf pages"
##   gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=$origfilename.pdf -dBATCH *.pdf
##   
##   mkdir .sources
##   mv [0-9][0-9]*.pdf .sources
##   
##   audacious ~/Dropbox/rsc/media/au/ding.mp3 &

