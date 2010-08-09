# mark-bodell.net

## What is it?

This is the code and content for [mark-bodell.net](http://www.mark-bodell.net),
which is a collection of genealogical information and family history stories
and journals, etc. related to the ancestors of Mark and Bodell Esplin.

## How does it work?

The content is stored as [markdown][] compatible text files. A ruby script
converts these files to html (with [maruku][]) and gives them a layout (with
[liquid][]). So the end result is a collection of static html files.

[markdown]: http://daringfireball.net/projects/markdown/syntax
[maruku]: http://maruku.rubyforge.org/maruku.html
[liquid]: http://www.liquidmarkup.org

## Why not use one of the existing static site generators?

The most important priority of this project is to preserve historical data, not
create a feature rich website. All the static site generators I looked at
required the text files to have special headers to give hints to the html
converter. And I wanted the text files to be the canonical source for the data
and in a format that will never become unreadable or obsolete.

Also, most of the static site generators had a bunch of blog-related or other
advanced features that would only get in the way for this simple project.

## Requirements

* packages
  * ruby
  * git
* gems
  * active_support
  * maruku
  * liquid

## Usage

### Regenerate Entire Site

    ruby converter.rb

### Convert One File

    ruby converter.rb path/to/file.txt

### Adding a New Document

* Run `git pull` to get the latest code. Resolve any conflicts.
* Put the markdown compatible text file in the `esplin/` or `barton/` directory.
* Edit `_index.html` and add a link.
* Run `ruby converter.rb` to regenerate the site. If there are errors, fix them and run the converter again.
* Run `git status` to see what files were altered.
* Use FTP or the web interface to uploaded the changed files to the hosting server.
* Run `git commit -am "Added new document."` to have git save your changes.
* Run `git push` to push the changes back to github.

## Questions

* What is the only true and living way to write dates? 12 December, 1828?

* Would you rather keep the text and html files in separate directories?

* What do you think about adding a provenance trail on all the files? Could we use that to justify paragraph breaks?

* Are you OK with Markdown quirks \[like escaping brackets\]? Do you have an h1 preference?

* Do you want to line wrap at 80 characters? Punchcards never die!

* File name conventions? (Google juice) What do you think of `firstname_lastname_title_with_dashes.txt` (.text?)

* Do you want to keep _all_ html out of the text files? e.g. Should 8th be `8<sup>th</sup>`?

## TODO

* Prettify
* images?
* Add all the existing content
* Shoutout to ruby, maruku, markdown and liquid.
* Add a footer.
* Contact email.
* Decide on License, CC, copyright stuff.
* Add a search box.
* Google Analytics

## License

Public Domain or MIT license or something...

