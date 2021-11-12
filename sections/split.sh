#!/bin/bash

# Split sections

csplit 02_work.tex '/\\section/' '{*}' -f 02_section -b '%d.tex'

cat 02_section0.tex 02_section1.tex > section1
rm 02_work.tex 02_section0.tex
mv section1 02_section1.tex

# Split section 2 subsections

# csplit section2.tex '/\\subsection/' '{*}' -f section2_subsection -b '%d.tex'

# cat section2_subsection0.tex section2_subsection1.tex > section2_subsection1
# rm section2.tex section2_subsection0.tex
# mv section2_subsection1 section2_subsection1.tex
