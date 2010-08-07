# mark-bodell.net

## Summary

converter.rb is a ruby script that looks in the working directory and all subdirectories for .html files with filenames beginning with an underscore (e.g. `_index.html`) and all text (.txt) or markdown (.md) files. These are then given the layout found in layouts/site.html.liquid and the markdown files are converted to html. And that's it. The site is then ready for viewing.

## Questions

Can I put this, with all the content, publicly on github?

What is the only true and living way to write dates? 12 December, 1828

Would you rather keep the text and html files in separate directories?

What do you think about adding a provenance trail on all the files? Could we use that to justify paragraph breaks?

Are you OK with Markdown quirks \[like escaping brackets\]? Do you have an h1 preference?

Do you want to line wrap at 80 characters? Punchcards never die!

File name conventions? (Google juice) What do you think of `firstname_lastname_title_with_dashes.txt` (.text?)

Do you want to keep _all_ html out of the text files? e.g. Should 8th be 8<sup>th</sup>?

## TODO

* Prettify
* images?
* images in the css?
* Add all the existing content
* Shoutout to ruby, maruku, markdown and liquid.
* Add a search box.
