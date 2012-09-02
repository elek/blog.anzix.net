#!/bin/bash

##############################################################################
#
# htmlplusyml2mkd.sh - Converts HTML files that include YAML front matter into
#                      a Markdown file that includes the same front matter.
#
# Requires:
#
#  GNU tail
#  GNU grep ?
#  pandoc
#  html2text.py
# 
##############################################################################

### Sanity Check
        
# TODO Make sure that the HTML file is passed as an argument

# TODO Check for the existence of pandoc and html2text.py

### Write the YAML front matter to a file

# Get the "base" file name, sans the file extension
md_file_name=$(echo $1 | sed 's/\.html$/\.md/')

# Find the line positions of the starting and ending "triple dashes"
# Assumptions 
#>  There are only two lines in the first 50 that start with "---"
#>  The YAML front matter is Between those two lines 
#>  Line 1 is where the YAML front matter starts
yaml_end_line_num=$(head -50 $1 | grep -n -e ^--- | tail -1 | awk -F: '{print $1}')

# Now grab lines 1 - $yaml_end_line_num and write them on the markdown file
head -${yaml_end_line_num} $1 > $md_file_name

### Convert the HTML to Markdown and append it to the file

startpos=$(echo "$yaml_end_line_num + 1" | bc)

# First let's try using html2text.py since that has given me the best looking
#>output.
tail -n +${startpos} $1 | ./html2text.py  >> $md_file_name
# Only <0 if the last command in the pipeline fails
if [[ $? -ne 0 ]]; then
    echo "INFO - Trouble converting $1 using html2text.py"
    echo "INFO - Trying pandoc instead"
    tail -n +${startpos} $1 | pandoc -f html -t markdown >> $md_file_name
    if [[ $? -ne 0 ]]; then
        echo "ERROR - Pandoc didn't work either. Sorry."
        echo "ERROR - Could not convert $1"
    fi
fi


