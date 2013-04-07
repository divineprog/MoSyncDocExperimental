require 'fileutils'
require 'pathname'

load 'structure.rb' 

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

# Import HTML files exported from Drupal.
def importHTML
  sourceDir = Pathname.new("./mosync-doc-exports")
  destDir = Pathname.new("./documents")
  
  n = 1
  docPages().each do |page|
    puts "Processing file " + n.to_s
    n = n + 1
    
    sourceFile = sourceDir + pageOriginalFile(page) + "index.html"
    destPath = destDir + pageTargetFile(page)
    destFile = destPath + "index.html"
    destPath.mkpath()
    html = File.open(sourceFile, "rb") { |f| f.read }
    html = htmlReplaceSyntaxHighlighterTags(html)
    html = htmlReplaceTabsWithSpaces(html)
    html = htmlPrettify(html)
    File.open(destFile, "wb") { |f| f.write(html) }
    puts "Importing #{sourceFile} #{destFile}"
    
    # Not used: FileUtils.cp(sourceFile, destFile)
  end
end

def webSiteBuild
  webSiteBuildHomePage
  webSiteBuildDocPages
  webSiteBuildLinkPages
end

def webSiteBuildDocPages
  sourceDir = Pathname.new("./documents")
  destDir = Pathname.new("./website/pages")
  
  # Replace template elements in each file and save.
  n = 1
  docPages().each do |page|
    puts "Processing file " + n.to_s
    n = n + 1
    
    sourceFile = sourceDir + pageTargetFile(page) + "index.html"
    destPath = destDir + pageTargetFile(page)
    destFile = destPath + "index.html"

    puts "Building #{sourceFile} #{destFile}"
      
    html = File.open(sourceFile, "rb") { |f| f.read }
    webSiteBuildPageFromStandardTemplate(
      htmlGetPageTitle(html),
      htmlGetPageContent(html),
      destFile)
  end
end

# Build link pages for all categories and page types.
def webSiteBuildLinkPages
  title = "C/C++ Coding Guides"
  webSiteBuildCategoryLinkPage(CPP, GUIDE, "cpp/guides/", title)
  
  title = "C/C++ Tutorials"
  webSiteBuildCategoryLinkPage(CPP, TUTORIAL, "cpp/tutorials/", title)
  
  title = "C/C++ Examples"
  webSiteBuildCategoryLinkPage(CPP, EXAMPLE, "cpp/examples/", title)
  
  title = "JavaScript Coding Guides"
  webSiteBuildCategoryLinkPage(JS, GUIDE, "js/guides/", title)
  
  title = "JavaScript Tutorials"
  webSiteBuildCategoryLinkPage(JS, TUTORIAL, "js/tutorials/", title)
  
  title = "JavaScript Examples"
  webSiteBuildCategoryLinkPage(JS, EXAMPLE, "js/examples/", title)
end

def webSiteBuildHomePage
  title = "MoSync Documentation"

  # Get content HTML.
  homePageFile = Pathname.new("./templates/home.html")
  html = File.open(homePageFile, "rb") { |f| f.read }
  
  # Save the page.
  destFile = Pathname.new("./website/pages") + "index.html"
  webSiteBuildPageFromStandardTemplate(
      title,
      html,
      destFile)
      
  # Copy images.
  #FileUtils.cp(
  #  Pathname.new("./templates/mosync_logo.jpg"),
  #  Pathname.new("./website/pages/mosync_logo.jpg"))
end

# Builds and saves a page of links for the given category and type.
# Exampel of pageShortPath: "cpp/guides/"
def webSiteBuildCategoryLinkPage(category, type, pageShortPath, pageTitle)
  # Create page path.
  destDir = Pathname.new("./website/pages")
  destFile = destDir + pageShortPath + "index.html"
  
  puts "Building page: " + destFile.to_s
  
  # Get content HTML.
  html = webSiteBuildLinkListForCategoryType(category, type, pageShortPath)
  
  # Save the page.
  webSiteBuildPageFromStandardTemplate(
      pageTitle,
      html,
      destFile)
end

# Returns HTML with list items for each label found in 
# pages of the given category and type.
# baseDir is a string naming the directory of the
# target page, e.g. "cpp/guides/".
def webSiteBuildLinkListForCategoryType(category, type, baseDir)
  # Get pages.
  pages = pagesForType(
     pagesForCategory(docPages(), category),
     type)
     
  # Get labels.
  labels = pagesGetAllLabels(pages).sort
  
  ## Generate lists for each label
  html = ""
  labels.each do |label|
    html += webSiteBuildLinkListForPages(
      pagesForLabel(pages, label),
      label,
      baseDir)
  end

  html
end

# Return HTML for a list with links to the given pages.
# baseDir is a string naming the directory of the
# target page, e.g. "cpp/guides/".
# TODO: Sort kist by title of pages.
def webSiteBuildLinkListForPages(pages, label, baseDir)
  html = "<ul data-role=\"listview\" data-inset=\"true\">\n"
  html += "<li data-role=\"list-divider\">#{label}</li>\n"
  pages.each do |page|
    title = pageGetTitleFromTargetFile(page)
    target = pageTargetFile(page) + "/index.html"
    url = target.split(baseDir)[1]
    html += "<li><a data-ajax=\"false\" href=\"#{url}\">#{title}</a></li>\n"
  end
  html += "</ul>\n"
  html
end

# Build and save page from template file.
def webSiteBuildPageFromStandardTemplate(title, content, destFile)
  # Set up paths.
  templateFile = Pathname.new("./templates/docpage.html")
  pagesDir = Pathname.new("./website/pages")
  jsDir = Pathname.new("./website/js")
  destPath = destFile.parent
  
  # Relative paths used for links and js/css imports.
  pagesDirRelativePath = pagesDir.relative_path_from(destPath)
  jsDirRelativePath = jsDir.relative_path_from(destPath)

  # Read template.
  template = File.open(templateFile, "rb") { |f| f.read }
  
  # Cerate HTML from template.
  html = webSiteBuildPageFromTemplate(
    template,
    title,
    content,
    jsDirRelativePath,
    pagesDirRelativePath)
  
  # Make sure dest path exists and write file.
  destPath.mkpath()
  File.open(destFile, "wb") { |f| f.write(html) }
end

# Returns HTML for page built from template.
def webSiteBuildPageFromTemplate(template, title, content, jsDirRelativePath, pagesDirRelativePath)
  html = template.gsub(
    "TEMPLATE_PAGE_TITLE", title).sub(
      "TEMPLATE_PAGE_CONTENT", content).gsub(
        "TEMPLATE_JS_PATH", jsDirRelativePath.to_s).gsub(
          "TEMPLATE_DOC_PATH", pagesDirRelativePath.to_s)
  html
end

def docPages()
  $pages.select { |page| not pageIsRedirect?(page) }
end

def redirectPages()
  $pages.select { |page| pageIsRedirect?(page) }
end

def pagesForCategory(pages, category)
  pages.select { |page| pageHasCategory?(page, category) }
end

def pagesForType(pages, type)
  pages.select { |page| pageHasType?(page, type) }
end

def pagesForLabel(pages, label)
  pages.select { |page| pageHasLabel?(page, label) }
end

def pagesGetAllLabels(pages)
  (pages.inject([]) { |result,page| 
    result + pageLabels(page) }).uniq
end

def pageIsRedirect?(page)
  pageCategory(page) == REDIRECT
end

def pageOriginalFile(page)
  page[0]
end

def pageTargetFile(page)
  page[1]
end

def pageCategory(page)
  page[2]
end

def pageHasCategory?(page,category)
  pageCategory(page) == category
end

def pageType(page)
  page[3]
end

def pageHasType?(page,type)
  pageType(page) == type
end

def pageLabels(pageData)
  pageData[4]
end

def pageHasLabel?(page,label)
  pageLabels(page).include? label
end

def pageGetTitleFromTargetFile(page)
  dir = Pathname.new("./documents")
  file = dir + pageTargetFile(page) + "index.html"
  fileGetPageTitle(file)
end

def htmlGetPageTitle(html)
  htmlGetTagContents(html, "title")
end

def htmlGetPageContent(html)
  htmlGetTagContents(html, "body")
end

def fileGetPageTitle(filePath)
  html = File.open(filePath, "rb") { |f| f.read }
  htmlGetPageTitle(html)
end

# Works for simple cases.
def htmlGetTagContents(html, tagName)
  html.split("<#{tagName}>")[1].split("</#{tagName}>")[0]
end

# TODO: Implement. Make a fun that insert pre tags.
def htmlClean(html)
  html
end

def htmlPrettify(html)
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

def htmlReplaceSyntaxHighlighterTags(html)
  html.gsub(/{syntaxhighlighter(.*?)}/, "<pre>").gsub(
    /{\/syntaxhighlighter}/, "</pre>")
end

def htmlReplaceTabsWithSpaces(html)
  html.gsub("\t", "    ")
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
    webSiteBuild
else
    puts "Options:"
    #puts "  html2md"
    #puts "  cleanmd"
    puts "  import (imports HTML from Drupal export)"
    puts "  build (builds web site)"
end
