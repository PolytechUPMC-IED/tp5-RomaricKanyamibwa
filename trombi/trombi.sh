#!/bin/bash

num_arg=$#
len=`ls $PWD | grep ".jpg"| wc -l`
if  [ "$num_arg" -eq 0 ] && [ len -eq 0 ];
    then 
        echo "Vous n'avez pas mis un archive à decompresser "
    else
        archive="$1"
        #Question 1
        tar -xzvf $archive
        #Question 2
        dir=`ls $PWD | grep ".jpg"`

        #Question 5 
        list_spe=`ls $PWD | grep ".jpg"| cut -d "_" -f3`
        nb=0
        touch filieres.txt
        for i in $list_spe;
        do
            nb=$((nb+1))
            prenom=`ls $PWD | grep ".jpg"| cut -d "_" -f1|sed "$nb q;d"`
            nom=`ls $PWD | grep ".jpg"| cut -d "_" -f2|sed "$nb q;d"`
            annee=`ls $PWD | grep ".jpg"| cut -d "_" -f4| cut -d "." -f1 | sed "$nb q;d"`
            mkdir -vp $i$annee/ >> filieres.txt
            temp="_"
            convert -resize 90x120 $prenom$temp$nom$temp$i$temp$annee.jpg $i$annee/$nom.$prenom.jpg
            
            #Question 7
            ligne=0 
            temp_dir=`ls  $i$annee/ | grep ".jpg" | sort`
            echo "<html><head><meta charset="utf-8" /><title> Trombinoscope Spé $i</title></head>" > $i$annee/index.html
            echo "<body>" >> $i$annee/index.html
            echo "<h1 align=’center’>Trombinoscope Spé $i</h1>" >> $i$annee/index.html
            echo "<table cols=2 align=’center’>" >> $i$annee/index.html
            for image in $temp_dir;
            do
                surname=`echo $image | cut -d "." -f1`
                firstname=`echo $image | cut -d "." -f2`
                if [ $ligne -eq 0 ];
                    then
                        ligne=1
                        echo -e "<tr>" >> $i$annee/index.html
                        echo "<td><img src="$image" width=90 height=120/><br/> $firstname $surname </td>" >> $i$annee/index.html
                    else
                        ligne=0
                        echo "<td><img src="$image" width=90 height=120/><br/> $firstname $surname </td>" >> $i$annee/index.html
                        echo "</tr>" >> $i$annee/index.html
                fi
            done
            echo "</table>" >> $i$annee/index.html
            echo "</body></html>" >> $i$annee/index.html
        done
fi