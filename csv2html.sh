#!/bin/sh
############################################################################
# author: ashok.shivarudriah
# Usage: csv2html.sh <csv file>
# Count number of lines in the given csv file.
# '|' is the delimitor in csv file
############################################################################

a=0
echo '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">'
echo '<html>'
echo '<head>'
echo '<style type="text/css">'
# echo '<!-- @import url("style.css"); -->'
cat ~/bin/table_styles.css
echo "</style>" 
echo "</head>"

echo "<body>"
echo "<table id=\"one-column-emphasis\" >"
while read line; do 
  echo "<tr><td>"
  echo $line |sed "s@|@</td><td>@g"
  echo "</td></tr>"
done < $1
echo "</table>"
echo "</body>"
echo "<html>"
