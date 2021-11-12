#!/bin/bash
#
# This script builds a PDF of the LaTeX source and places the output in docs/.
#
# See https://tex.stackexchange.com/a/12717/201232 for explanation.
# You can use the following Docker image to compile LaTeX to PDF:
# https://hub.docker.com/r/blang/latex

mkdir -p docs/sections
pdflatex -output-directory docs webextensions-main.tex
cp sections/webextensions.bib docs/sections/
cd docs/
bibtex webextensions-main
cd ..
pdflatex -output-directory docs webextensions-main.tex
pdflatex -output-directory docs webextensions-main.tex
