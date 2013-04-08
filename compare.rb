require 'fileutils'
require 'pathname'

def countAndCompareFiles
  files1 = Pathname.glob("./mosync-doc-exports/**/*.html").collect { |item| 
    item.to_s.split("./mosync-doc-exports/")[1] } 
  files2 = Pathname.glob("./mosync-doc-exports-2/**/*.html").collect { |item| 
    item.to_s.split("./mosync-doc-exports-2/")[1] } 
  numFiles1 = files1.length
  numFiles2 = files2.length
  puts "Files in 1: " + numFiles1.to_s
  puts "Files in 2: " + numFiles2.to_s
  puts "New files:"
  puts files2 - files1
  puts "Old files:"
  puts files1
end

def listAllFiles
  files = Pathname.glob("./mosync-doc-exports/**/*.html").collect { |item| 
    item.to_s.split("./mosync-doc-exports/")[1] } 
  puts "============================================================"
  puts "All files (export 1):"
  puts files.sort
end

#countAndCompareFiles
listAllFiles
