#!/bin/bash
python /usr/bin/asciidoc -a data-uri -a icons -a lang=de -a toc2 -a toclevels=3 -a theme=flask -o "yaVDR_doc.html" "yaVDR_doc.txt"
read -p "Done. Press [ENTER] to exit..."
