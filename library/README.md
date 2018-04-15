# LARA librarian 

Auxiliar programs and files to help cataloguing the books on LARA's library. 

* bib2html: Generates an html file from a .bib file (https://sourceforge.net/projects/bib2html/)
* porta.svg: Paper to stick in the cabinet's door.

## How to use:
**bib2html**

### Requirements:
* bib2html (v. 0.94)
* Perl (tested on Perl 5 v. 22)
* xsltproc

### Instructions:

(1) Apply bib2html.patch (in this repository) to bib2html.pl:

```sh
$patch < bib2html.patch
```

(2) Ask the responsible for the library for the file lara_armario.bib. Add this file to bib2html folder.
(3) Replace bib2html.conf file on bib2html folder by the file of this repository.
(4) Search a .bib file for the new book in [crossref](http://crossref.org/) or [GoogleBooks](https://books.google.com/).
(5) Update lara_armario.bib with the new bibtex entries
(6) Add the following additional fields to each bibtex entry:
- bib2html_rescat: Category of book
- bib2html_location: Number of book in the catalog 

If the category is novel, please add it after the "catlist_rescat:" line on bib2html.conf.

(7) Run bib2html.pl to generate the html file:

```sh
$perl bib2html.pl
```

(8) Upload the folder *lara_armario* to LARA server. The library catalogue HTML page is *class_rescat.html*.
(9) Update the [spreadsheet](https://docs.google.com/spreadsheets/d/1rZPmUNfQXn-eabzWHW9pJ5Lqo2YDDxv-atCAUcfin08/edit?usp=sharing) with additional info.   
