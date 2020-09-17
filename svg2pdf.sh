#!/bin/sh

# (cl)2020 ernierasta

# this script will create multipage pdf from svg files

# dependecies:
# - inkscape
# - pdfjam

DIR="$1"
TEMP="temp"
DNGNVER=1.1
FILEVER=1.0

# make temporary directory
mkdir -p $TEMP

# use inkscape to convert all svg pages to pdf
for FILE in `ls $DIR/ | grep ".svg"`; do
    BASENAME=`basename "$FILE" ".svg"` 
    echo "Processing file $DIR/$FILE."
    inkscape --export-filename "$TEMP/$BASENAME.pdf" "$DIR/$FILE"
done

# use pdfjam to join all pdf files to one multipage pdf
pdfjam --fitpaper true temp/*.pdf -o "dngn-$DNGNVER-$DIR-gutter-$FILEVER.pdf"

# remove temp
rm -rf $TEMP
