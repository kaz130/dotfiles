#!/usr/bin/env perl
$latex = 'platex -interaction=nonstopmode -kanji=utf-8 %O %S';
$dvipdf = 'dvipdfmx %O -o %D %S';
$bibtex = 'pbibtex %O %B';
$bibtex_use = 2;
$pdf_mode = 3; # use dvipdf
$pdf_update_method = 2;
if ($^O eq 'darwin') {
    $pdf_previewer = 'open -a Preview';
} elsif ($^O eq 'linux') {
    $pdf_previewer = 'evince';
}
