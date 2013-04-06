require 'fileutils'
require 'pathname'

load 'structure.rb' 

puts(SDK)

puts($pages)

def sh(cmd)
    #TODO: optimize by removing the extra shell
    #the Process class should be useful.
    $stderr.puts cmd
    if (!system(cmd)) then
        error "Command failed: '#{$?}'"
    end
end

#root.children.each do |p|
  #puts "Hello " + p.to_s
#end

# Not used for now.
def convertHtmlToMarkdown
  root = Pathname.new("./mosync-doc-exports")
  n = 1
  Pathname.glob("./mosync-doc-exports/**/*.html").each  do |p|
    puts "File " + n.to_s + ": " + p.to_s
    n = n + 1
    infile = p.to_s
    outfile = p.sub_ext(".md").to_s
    command = "pandoc -f html -t markdown -o #{outfile} #{infile}"
    puts command
    sh(command)
  end
end

# Import HTML files from Drupal.
def importHTML
  sourceDir = Pathname.new("./mosync-doc-exports")
  destDir = Pathname.new("./documents")
  n = 1
  $pages.each do |pageData|
    puts "Processing file " + n.to_s
    n = n + 1
    params = pageData[2]
    if not params.include? REDIRECT then
      sourceFile = sourceDir + pageData[0] + "index.html"
      destPath = destDir + pageData[1]
      destFile = destPath + "index.html"
      destPath.mkpath()
      html = File.open(sourceFile, "rb") { |f| f.read }
      html = prettifyHTML(html)
      File.open(destFile, "wb") { |f| f.write(html) }
      puts "Importing #{sourceFile} #{destFile}"
      # FileUtils.cp(sourceFile, destFile)
    end
  end
end

def buildWebSite
  #buildHomePage
  buildCodingGuidesPage
  #buildTutorialsPage
  #buildExamplesPage
  buildDocPages
end

def buildDocPages
  # Replace template elements in each file
  sourceDir = Pathname.new("./documents")
  destDir = Pathname.new("./website/pages")
  jsDir = Pathname.new("./website/js")
  pagesDir = Pathname.new("./website/pages")
  templateFile = Pathname.new("./templates/docpage.html")
  template = File.open(templateFile, "rb") { |f| f.read }
  n = 1
  $pages.each do |pageData|
    puts "Processing file " + n.to_s
    n = n + 1
    params = pageData[2]
    if not params.include? REDIRECT then
      sourceFile = sourceDir + pageData[1] + "index.html"
      destPath = destDir + pageData[1]
      destFile = destPath + "index.html"
      jsDirRelativePath = jsDir.relative_path_from(destPath)
      pagesDirRelativePath = pagesDir.relative_path_from(destPath)
      destPath.mkpath()
      html = File.open(sourceFile, "rb") { |f| f.read }
      #html = cleanHTML(html)
      html = template.gsub(
        "TEMPLATE_PAGE_TITLE", getPageTitle(html)).sub(
          "TEMPLATE_PAGE_CONTENT", getPageContent(html)).gsub(
            "TEMPLATE_JS_PATH", jsDirRelativePath.to_s).gsub(
              "TEMPATE_DOC_PATH", pagesDirRelativePath.to_s)
      File.open(destFile, "wb") { |f| f.write(html) }
      puts "Building #{sourceFile} #{destFile}"
      # FileUtils.cp(sourceFile, destFile)
    end
  end
end

def buildCodingGuidesPage
  # Build list with links to all guides.
  sourceDir = Pathname.new("./documents")
  list = "<ul data-role=\"listview\" data-inset=\"true\">\n"
  $pages.each do |pageData|
    params = pageData[2]
    if params.include?(CPP) and params.include?(GUIDE) then
      sourceFile = sourceDir + pageData[1] + "index.html"
      linkTitle = getPageTitleFromFile(sourceFile)
      puts "Generating Guide Link: " + linkTitle
      linkTarget = sourceFile.to_s.split("cpp/guides/")[1]
      list = list + "<li><a data-ajax=\"false\" href=\"#{linkTarget}\">#{linkTitle}</a></li>\n"
    end
  end
  list = list + "</ul>\n"
  
  # Insert list and write page.
  destFile = Pathname.new("./website/pages/cpp/guides/index.html")
  jsDir = Pathname.new("./website/js")
  jsDirRelativePath = jsDir.relative_path_from(destFile.parent)
  puts("jsDirRelativePath: " + jsDirRelativePath.to_s)
  templateFile = Pathname.new("./templates/docpage.html")
  template = File.open(templateFile, "rb") { |f| f.read }
      html = template.gsub(
        "TEMPLATE_PAGE_TITLE", "C/C++ Coding Guides").sub(
          "TEMPLATE_PAGE_CONTENT", list).gsub(
            "TEMPLATE_JS_PATH", jsDirRelativePath.to_s)
  File.open(destFile, "wb") { |f| f.write(html) }
end

def getPageTitle(html)
  getTagContents(html, "title")
end

def getPageContent(html)
  getTagContents(html, "body")
end

def getPageTitleFromFile(filePath)
  html = File.open(filePath, "rb") { |f| f.read }
  getPageTitle(html)
end

# Works for simple cases.
def getTagContents(html, tagName)
  html.split("<#{tagName}>")[1].split("</#{tagName}>")[0]
end

def cleanHTML(html)
  html
end

def prettifyHTML(html)
  newLineAfterOpeningAndClosingTags = ["html", "head", "body", "div", "ul", "ol", "table"]
  newLineAfterClosingTags = ["title", "h1", "h2", "h3", "h4", "p", "pre", "li", "tr"]
  #start = html.index("</p>", 0)
  (newLineAfterOpeningAndClosingTags + newLineAfterClosingTags).each do |tagName|
    tag = "</" + tagName + ">"
    html = html.gsub(tag, tag + "\n")
  end
  newLineAfterOpeningAndClosingTags.each do |tagName|
    tag = "<" + tagName + ">"
    html = html.gsub(tag, tag + "\n")
  end
  html
end

def cleanmd
  root = Pathname.new("./mosync-doc-exports")
  n = 1
  Pathname.glob("./mosync-doc-exports/**/*.md").each  do |p|
    puts "rm " + n.to_s + ": " + p.to_s
    n = n + 1
    file = p.to_s
    File.delete file
  end
end

if (ARGV.include? "html2md")
    convertHtmlToMarkdown
elsif (ARGV.include? "cleanmd")
    cleanmd
elsif (ARGV.include? "import")
    importHTML
elsif (ARGV.include? "build")
    buildWebSite
else
    puts "Options:"
    #puts "  html2md"
    #puts "  cleanmd"
    puts "  import (imports HTML from Drupal export)"
    puts "  build (builds web site)"
end
