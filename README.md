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

* sudo aptitude install git-core ruby ruby1.8-dev rubygems build-essential
* sudo gem install activesupport maruku liquid

## Usage

### Regenerate Entire Site

    ruby converter.rb

### Convert One File

    ruby converter.rb path/to/file.txt

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
