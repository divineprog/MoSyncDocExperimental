require 'fileutils'
require 'pathname'

# Old export
def exportsDir1
 "./mosync-doc-exports-130415/"
end

# New export
def exportsDir2
 "./mosync-doc-exports-130418/"
end

# All HTML file names stripped of basePath
def allHtmlFiles(basePath)
  Pathname.glob(basePath + "**/*.html").collect { |item| 
    item.to_s.split(basePath)[1] }
end

# All HTML file names including basePath
def allHtmlPaths(basePath)
  Pathname.glob(basePath + "**/*.html")
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
  puts "New files in " + exportsDir2()
  puts (files2 - files1).sort
  puts "========================================================="
end

def listAllFiles
  dir = exportsDir2()
  puts "========================================================="
  puts "All files in " + dir
  puts allHtmlFiles(dir).sort
  puts "========================================================="
end

# Collect links in all documents and list them
def listAllLinks
  dir = exportsDir2()
  files = allHtmlPaths(dir)
  links = (files.collect { |path|
    html = File.open(path, "rb") { |f| f.read }
    html.scan(/href="(.*?)"/)
  }).flatten.uniq.sort
  puts "========================================================="
  puts "All links in all files in " + dir
  puts links
  puts "========================================================="
end

# Collect anchor tags in all documents and list them
def listAnchors
  dir = exportsDir2()
  files = allHtmlPaths(dir)
  hrefs = (files.collect { |path|
    html = File.open(path, "rb") { |f| f.read }
    html.scan(/href="(.*?)"/)
  }).flatten
  anchors = (files.collect { |path|
    html = File.open(path, "rb") { |f| f.read }
    html.scan(/<a(.*?)>/)
  }).flatten
  puts "========================================================="
  puts "All anchors in all files in " + dir
  puts anchors.uniq.sort
  puts "Num hrefs:   " + hrefs.size.to_s
  puts "Num anchors: " + anchors.size.to_s
  puts "========================================================="
end

# Collect images in all documents and list them.
def listImages
  dir = exportsDir2()
  #dir = "./documents/"
  files = allHtmlPaths(dir)
  imgs = (files.collect { |path|
    html = File.open(path, "rb") { |f| f.read }
    # html.scan(/<img(.*?)>/)
    html.scan(/src="(.*?)"/)
  }).flatten
  puts "========================================================="
  puts "All img tags in all files in " + dir
  puts imgs.uniq.sort
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
elsif (ARGV.include? "a")
  listAnchors
elsif (ARGV.include? "img")
  listImages
else
  puts "========================================================="
  puts "Options:"
  puts "  all (show all files in new export)"
  puts "  new (show new files in new export)"
  puts "  count (count files in all exports)"
  puts "  links (show all links in new export)"
  puts "  img (show all img src attributes)"
  puts "(please manually update the script to specify"
  puts "export directories)"
  puts "========================================================="
end
