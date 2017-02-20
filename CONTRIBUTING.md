Contribution
===============================



This document provides information on how contributing works in this project.



### Issues

__Rules:__

+   respect PR template
+   give your issue a reasonable name



### Pull Requests

__Rules:__

+   one changed file per PR
+   respect PR template
+   only change contents of `./chapters`, unless you really know what you are doing and it sill 
    addresses one of the defined PR types (see template)


__Branch name:__ [PURPOSE]_[FILE_NAME]_[SCOPE]`
+   PURPOSE: top level namespace to distinguish, e.g. `review-3`
+   FILE_NAME: complete file name as defined under `./chapters`, e.g. `250_standards-specs-technologies`
+   [OPTIONAL] SCOPE: part of the file that is affected, e.g. `OAuth`


__Commit message__

In general, messages MUST contain scope/headline/topic and a related list showing the addressed 
changes/fixes, e.g.
 
```
[review: phase 3]
+   reviewed 250
+   fixed spelling in 500
+   changed access verification prtocol in 640 
```



### Template headers (referring to files in `/.github`)

+   review phase - current review iteration (should not change)
+   level - relevance, importancy
    -   `mistake` - critical, MUST be fixed
    -   `enhancement` - general enhancement, SHOULD be fixed
    -   `opinion` - subject, debatable, MAY be fixed
+   type - what type of problem
    -   `content` - what the text says is wrong 
    -   `phrasing` - sentence structure, hwo things are said
    -   `grammer or spelling` - language-specific mistakes
    -   `design or layout` - how the thesis (and its content) looks like (in the pdf)



### Further notes:

+   please respect max line length defined in `.editorconfig`



### Links and Resources

+   [news feed](https://github.com/lucendio/pdaas_thesis/issues/16)
+   [naming things](https://github.com/lucendio/pdaas_thesis/issues/17)
+   [current version of the thesis document](./dist/index.pdf)
