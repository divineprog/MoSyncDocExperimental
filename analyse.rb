require 'fileutils'
require 'pathname'


def exportsDir1
 "./mosync-doc-exports/"
end

def exportsDir2
 "./mosync-doc-exports-2/"
end

def allHtmlFiles(path)
  Pathname.glob(path + "**/*.html").collect { |item| 
    item.to_s.split(path)[1] }
end

def countFiles
  numFiles1 = allHtmlFiles(exportsDir1()).length
  numFiles2 = allHtmlFiles(exportsDir2()).length
  puts "========================================================="
  puts "HTML files in " + exportsDir1() + ": " + numFiles1.to_s
  puts "HTML files in " + exportsDir2() + ": " + numFiles2.to_s
  puts "Number of new files: " + (numFiles2 - numFiles1).to_s
  puts "========================================================="
end

def newFiles
  files1 = allHtmlFiles(exportsDir1())
  files2 = allHtmlFiles(exportsDir2())
  puts "========================================================="
  puts "New files in " + exportsDir1()
  puts files2 - files1
  puts "========================================================="
end

def listAllFiles
  dir = exportsDir2()
  puts "========================================================="
  puts "All files in " + dir
  puts allHtmlFiles(dir).sort
  puts "========================================================="
end

if (ARGV.include? "new")
  newFiles
elsif (ARGV.include? "count")
  countFiles
elsif (ARGV.include? "all")
  listAllFiles
elsif (ARGV.include? "links")
  listAllLinks
else
  puts "========================================================="
  puts "Options:"
  puts "  all (show all files in new export)"
  puts "  new (show new files in new export)"
  puts "  count (count files in all exports)"
  puts "  links (show all links in new export)"
  puts "(please manually update the script to specify"
  puts "export directories)"
  puts "========================================================="
end
