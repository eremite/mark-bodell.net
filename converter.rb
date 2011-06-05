#!/usr/bin/env ruby

require 'rubygems'
require 'maruku'
require 'liquid'
require 'active_support/all'

LAYOUT = 'layouts/site.html.liquid'

layout = Liquid::Template.parse(File.read(LAYOUT))
files = Dir['**/*.{txt,text,md,markdown,mdown,markdn,mdml}']
skip_index = false
toc = {}

unless ARGV.empty?
  files = ARGV
  skip_index = true
end

files.each do |file|
  raise "File not found: #{file}" unless File.exists?(file)
  outfile = file.sub(/\.[^.]*$/, '.html')
  raise "File #{file} would be overwritten." if outfile == file
  puts "Converting #{file}"
  filename, *category  = file.split('/').reverse
  category = category.join('-')
  toc[category] ||= []
  parts = filename.split('.').first.split('-')
  name, title = parts[0..-2].join(', ').titleize, parts.last.titleize
  File.open(outfile, 'w') do |f|
    content = File.read(file)
    links = {}
    unless file =~ /.html?$/
      content = Maruku.new(content).to_html
      links[:text] = File.basename(file)
    end
    if File.exists?("#{file.sub(/\.[^\.]+$/, '')}.pdf")
      links[:pdf] = File.basename("#{file.sub(/\.[^\.]+$/, '')}.pdf")
    end
    toc[category] << {
      :name => name,
      :href => outfile,
      :text => title,
    }
    f << layout.render({
      :title => title,
      :relative_root => '.' * (file.scan('/').size + 1),
      :content => content,
      :text_link => links[:text],
      :pdf_link => links[:pdf],
    }.with_indifferent_access)
  end
end

unless skip_index
  puts "Creating Index"
  outfile = "index.html"
  File.open(outfile, 'w') do |f|
    content = %{
      <div id="search">
        <form action="http://www.google.com/search" method="get" onsubmit="javascript: document.getElementById('search-q').value = 'site:http://mark-bodell.net ' + document.getElementById('search-q').value;">
          <p>
            <label for="search">Search</label>
            <input class="text" id="search-q" name="q" type="text" style="width: 200px">
            <input name="commit" type="submit" value="Search" class="button">
          </p>
        </form>
      </div>
    }
    toc.each do |category, links|
      next if category.blank?
      link_list = links.sort_by {|a| a[:name].to_s}.map do |a|
        %Q%\n#{' ' * 10}<li>#{a[:name]} &ndash; <a href="#{a[:href]}">#{a[:text]}</a></li>%
      end
      content << <<-HEREDOC
      <div class="category">
        <h2>#{category.titleize}</h2>
        <ul>#{link_list}
        </ul>
      </div>
      HEREDOC
    end
    f << layout.render({
      :title => "Family History of Mark and Bodell Esplin",
      :relative_root => '.',
      :content => content,
    }.with_indifferent_access)
  end
end
