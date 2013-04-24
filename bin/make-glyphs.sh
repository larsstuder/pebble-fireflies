#!/bin/sh
#
# Generate a .h file for the numbers based on the glyphs for a particular font.
# Requires the (for-pay) tool GlyphDesigner CLI GDCL & (opensource) Imagemagick
# along with Pebbles png 2 .h tools
#
# Update the paths below as necessary
#
GLYPHS_DIR=doc/glyphs
rm -f $GLYPHS_DIR/*.png
pushd $GLYPHS_DIR
for i in $(seq 0 9); do
  GDCL GlyphDesignerProject.GlyphProject glyphs -fs 100 -fo PlainText-txt -in "$i"
  convert -trim glyphs.png $i.png
done
rm glyphs.png
rm glyphs.txt
