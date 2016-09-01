@echo off
xelatex ./tex/Assignment.tex
xelatex ./tex/Assignment.tex
xelatex ./tex/Assignment.tex
del  *.toc /s
del  *.out  /s
del  *.aux  /s
del  *.log  /s
del  *.bak  /s
dvipdfmx ./tex/Assignment.tex
start Assignment.pdf