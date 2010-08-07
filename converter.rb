#!/usr/bin/env ruby

require 'rubygems'
require 'maruku'
require 'liquid'
require 'active_support/all'

LAYOUT = 'layouts/site.html.liquid'

layout = Liquid::Template.parse(File.read(LAYOUT))
files = Dir['**/_*.html'] + Dir['**/*.{txt,text,md,markdown,mdown,markdn,mdml}']

files = ARGV unless ARGV.empty?

files.each do |file|
  raise "File not found: #{file}" unless File.exists?(file)
  outfile = "#{file}"
  if File.basename(file).starts_with?('_')
    outfile.sub!(Regexp.new("#{File.basename(file)}$"), File.basename(file).sub(/^_/, ''))
  end
  outfile.sub!(/\.[^.]*$/, '.html')
  raise "File #{file} would be overwritten." if outfile == file
  puts "Converting #{file}"
  File.open(outfile, 'w') do |f|
    content = Maruku.new(File.read(file)).to_html
    content =~ /<h1[^>]*>(.*)<\/h1>/i
    f << layout.render({
      :title => $1,
      :content => content,
    }.with_indifferent_access)
  end
end
