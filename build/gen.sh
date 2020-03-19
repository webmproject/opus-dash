#!/usr/bin/env bash
## Requires kramdown and athenapdf

infile='opus-iso-binding.md'
outfile='opus-iso-binding'

printf "\nConverting Markdown to HTML ...\n"

kramdown --template html-template ../${infile} > ${outfile}.html

printf "\nHTML finished.\n\n"

printf "\nConverting HTML to PDF ...\n\n"

docker run --security-opt seccomp=unconfined \
  --rm -v $(pwd):/converted/ arachnysdocker/athenapdf athenapdf --no-cache \
  ${outfile}.html ${outfile}.pdf

printf "\nPDF finished.\n\n"
