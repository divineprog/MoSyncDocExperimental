require 'fileutils'
require 'pathname'
require "open-uri"

load 'structure.rb' 

def pathExports
  "./mosync-doc-exports-2/"
end

def pathTemplates
  "./templates/"
end

# Used for step before downloading
# images and replacing image urls.
def pathDocumentsPre
  "./documentspre/"
end

def pathDocuments
  "./documents/"
end

def pathWebSite
  "./docsite/"
end

def pathWebSitePages
  pathWebSite + "pages/"
end

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
  root = pathExports
  n = 1
  Pathname.glob(pathExports() + "**/*.html").each  do |p|
    puts "File " + n.to_s + ": " + p.to_s
    n = n + 1
    infile = p.to_s
    outfile = p.sub_ext(".md").to_s
    command = "pandoc -f html -t markdown -o #{outfile} #{infile}"
    puts command
    sh(command)
  end
end

def importAll
  importHTML
end

# Import HTML files exported from Drupal.
def importHTML
  sourceDir = Pathname.new pathExports
  destDir = Pathname.new pathDocumentsPre
  
  # Clean and create target directory.
  fileCleanPath(destDir)
  
  # Process and copy pages.
  n = 0
  docPages().each do |page|
    n = n + 1
    
    sourceFile = sourceDir + pageOriginalFile(page) + "index.html"
    destPath = destDir + pageTargetFile(page)
    destFile = destPath + "index.html"
    
    puts "Importing File #{n.to_s} #{sourceFile} #{destFile}"
    puts " "
    
    destPath.mkpath()
    html = File.open(sourceFile, "rb") { |f| f.read }
    html = htmlUpdateLinks(html)
    html = htmlStripTOC(html)
    html = htmlReplaceSyntaxHighlighterTags(html)
    html = htmlReplaceTabsWithSpaces(html)
    html = htmlPrettify(html)
    fileSaveContent(destFile, html)
  end
end

# Import (download) image files
def importImages
  copyExportedFilesToDocuments
  downloadImages true
end

def copyExportedFilesToDocuments
  sourceDir = Pathname.new pathDocumentsPre
  destDir = Pathname.new pathDocuments
  
  # Clean and create target directory.
  # Commented out to don't erase images
  # in destDir when testing conversion.
  #fileCleanPath(destDir)
  
  # Copy files.
  FileUtils.cp_r(Dir[sourceDir + "*"], destDir)
end

# Iterate over all pages and all image urls on each page.
# Download images to local files, and update image urls
# to refer to local files.
def downloadImages(downloadImage?)
  puts "Downloading images"
  n = 0
  # Find all files.
  Pathname.glob(pathDocuments() + "**/*.html").each do |path|
    n = n + 1
    puts "Downloading images for file " + n.to_s + ": " + path.to_s
    # Find images in file.
    html = fileReadContent(path)
    html.scan(/(<img.*?>)/) do |img|
      puts "  img: " + img[0]
      # Process image tag
      url = ""
      imageName = ""
      img[0].scan(/src="(.*?)"/) do |src|
        if src[0].start_with?("http://www.mosync.com") then
          # Download image
          url = src[0]
        elsif src[0].start_with?("http://") or 
          src[0].start_with?("https://") then
          # Do not download image ?
          # Or just download every image?
        elsif src[0].start_with?("/") then
          # Download from http://www.mosync.com/
          url = "http://www.mosync.com" + src[0]
        end
        
		url = url.gsub(" ", "%20")
		  
        # Download and save image.
        if url != "" and downloadImage? then
          imageName = Pathname(url).basename.to_s
          destPath = path.parent + "images/" + imageName
          Pathname(destPath).parent.mkpath()
          puts "    downloading from: " + url
          puts "    writing image to: " + destPath.to_s
          downloadImage(url, destPath)
          puts "    done"
        end
      end

      # Update img tag.
      if url != "" then
        parts = img[0].split(/src="(.*?)"/)
        newImgTag = parts[0] + "src=\"images/" + imageName + "\"" + parts[2]
        puts "    new img: " + newImgTag
        # Update image tag.
        html = html.gsub(img[0], newImgTag)
      end
    end
    
    # Write updated file.
    fileSaveContent(path, html)
  end
end

def downloadImage(url, destPath)
# TODO: Catch errors
  open(url) do |f|
    File.open(destPath,"wb") do |file|
      file.puts f.read
    end
  end
end

def webSiteBuild
  webSiteClean
  webSiteBuildHomePage
  webSiteBuildDocPages
  webSiteBuildLinkPages
end

def webSiteClean
  # Clean and create target directories.
  fileCleanPath(Pathname.new(pathWebSitePages()))
  fileCleanPath(Pathname.new(pathWebSite() + "js/"))
end

def webSiteBuildHomePage
  title = "MoSync Documentation"

  # Get content HTML.
  homePageFile = Pathname.new(pathTemplates() + "home.html")
  html = File.open(homePageFile, "rb") { |f| f.read }
  
  # Save the page.
  destFile = Pathname.new(pathWebSite()) + "index.html"
  webSiteBuildPageFromStandardTemplate(
      title,
      html,
      destFile)
      
  # Copy JavaScript libs.
  FileUtils.cp_r(Dir[pathTemplates() + "js"], pathWebSite())
  
  # Copy images.
  #FileUtils.cp(
  #  Pathname.new("./templates/mosync_logo.jpg"),
  #  Pathname.new("./docsite/pages/mosync_logo.jpg"))
end

def webSiteBuildDocPages
  sourceDir = Pathname.new(pathDocuments())
  destDir = Pathname.new(pathWebSitePages)
  
  # Replace template elements in each file and save.
  n = 0
  docPages().each do |page|
    n = n + 1
    puts "Processing file " + n.to_s + ": " + pageTargetFile(page)
    
    sourceFile = sourceDir + pageTargetFile(page) + "index.html"
    destPath = destDir + pageTargetFile(page)
    destFile = destPath + "index.html"

    puts "Building #{sourceFile} #{destFile}"
      
    html = File.open(sourceFile, "rb") { |f| f.read }
    webSiteBuildPageFromStandardTemplate(
      htmlGetPageTitle(html),
      htmlGetPageContent(html),
      destFile)
	  
	# Copy images.
	imagesSource = sourceDir + pageTargetFile(page) + "images"
	imagesDest = destDir + pageTargetFile(page)
	FileUtils.cp_r(Dir[imagesSource], imagesDest)
  end
end

# Build link pages for all categories and page types.
def webSiteBuildLinkPages
  title = "C/C++ Coding Guides"
  webSiteBuildCategoryLinkPage([CPP, GUIDE], "cpp/guides/", title)
  
  title = "C/C++ Tutorials"
  webSiteBuildCategoryLinkPage([CPP,TUTORIAL], "cpp/tutorials/", title)
  
  title = "C/C++ Examples"
  webSiteBuildCategoryLinkPage([CPP,EXAMPLE], "cpp/examples/", title)
  
  title = "JavaScript Coding Guides"
  webSiteBuildCategoryLinkPage([JS,GUIDE], "js/guides/", title)
  
  title = "JavaScript Tutorials"
  webSiteBuildCategoryLinkPage([JS,TUTORIAL], "js/tutorials/", title)
  
  title = "JavaScript Examples"
  webSiteBuildCategoryLinkPage([JS,EXAMPLE], "js/examples/", title)
  
  title = "All Examples"
  webSiteBuildCategoryLinkPage([CPP,JS,EXAMPLE], "overviews/examples/", title)
end

# Builds and saves a page of links for the given category and type.
# Exampel of pageShortPath: "cpp/guides/"
def webSiteBuildCategoryLinkPage(labels, pageShortPath, pageTitle)
  # Create page path.
  destDir = Pathname.new(pathWebSitePages())
  destFile = destDir + pageShortPath + "index.html"
  
  puts "Building page: " + destFile.to_s
  
  # Get content HTML.
  html = webSiteBuildLinkListForLabels(labels, pageShortPath)
  
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
def webSiteBuildLinkListForLabels(labels, baseDir)
  # Filter pages.
  pages = docPages()
  pages = pagesForLabels(pages, labels)

  # Get all labels except category and type.
  allLabels = pagesGetAllLabels(pages).sort
  allLabels = allLabels - labels
  
  # Generate lists for each label.
  html = ""
  allLabels.each do |label|
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
  templateFile = Pathname.new(pathTemplates + "docpage.html")
  pagesDir = Pathname.new(pathWebSitePages())
  jsDir = Pathname.new(pathWebSite() + "js/")
  destPath = destFile.parent
  
  # Relative paths used for links and js/css imports.
  pagesDirRelativePath = pagesDir.relative_path_from(destPath)
  jsDirRelativePath = jsDir.relative_path_from(destPath)

  # Read template.
  template = File.open(templateFile, "rb") { |f| f.read }
  
  # Create HTML from template.
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
    "TEMPLATE_PAGE_CONTENT", content).gsub(
      "TEMPLATE_PAGE_TITLE", title).gsub(
        "TEMPLATE_JS_PATH", jsDirRelativePath.to_s).gsub(
          "TEMPLATE_DOC_PATH", pagesDirRelativePath.to_s)
  html
end

def allPages()
  $pages
end

def docPages()
  $pages.select { |page| 
    #puts "Page:" + page.to_s
    not pageIsRedirect?(page) and not pageIsIgnore?(page) }
end

def redirectPages()
  $pages.select { |page| pageIsRedirect?(page) }
end

def pagesForLabel(pages, label)
  pages.select { |page| pageHasLabel?(page, label) }
end

def pagesForLabels(pages, labels)
  pages.select { |page| pageHasAllLabels?(page, labels) }
end

def pagesGetAllLabels(pages)
  (pages.inject([]) { |result,page| 
    result + pageLabels(page) }).uniq
end

def pageIsRedirect?(page)
  pageHasLabel?(page, REDIRECT)
end

def pageIsIgnore?(page)
  pageHasLabel?(page, IGNORE)
end

def pageOriginalFile(page)
  page[0]
end

def pageTargetFile(page)
  page[1]
end

def pageLabels(pageData)
  pageData[2]
end

def pageHasLabel?(page, label)
  pageLabels(page).include? label
end

def pageHasAllLabels?(page, labels)
  labels.each do |label|
    if not pageHasLabel?(page,label) then
	  return false
	end
  end
  return true
end

def pageGetTitleFromTargetFile(page)
  dir = Pathname.new(pathDocuments())
  file = dir + pageTargetFile(page) + "index.html"
  fileGetPageTitle(file)
end

def htmlGetPageTitle(html)
  htmlGetTagContents(html, "title")
end

def htmlGetPageContent(html)
  htmlGetTagContents(html, "body")
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
  html.gsub(/{syntaxhighlighter(.*?)}/, "<pre class=\"mosync-code-cpp\">").gsub(
    /{\/syntaxhighlighter}/, "</pre>")
end

def htmlReplaceTabsWithSpaces(html)
  html.gsub("\t", "    ")
end

# Update links to point to new urls.
def htmlUpdateLinks(html)
  #puts "Page BEFORE URL update: " + html
  #puts " "
  
  # Step 1: Update urls and insert marker
  allPages().each do |page|
    # Replace full urls
    html = html.gsub(
      "http://www.mosync.com/" + pageOriginalFile(page), 
      "/NEWDOC_UPDATED_URL:TEMPLATE_DOC_PATH/" + pageTargetFile(page) + "/index.html")
	# Replace short urls
    html = html.gsub(
      pageOriginalFile(page), 
      "NEWDOC_UPDATED_URL:TEMPLATE_DOC_PATH/" + pageTargetFile(page) + "/index.html")
  end
  
  # Step 2: Strip off absolute urls and markers
  html = html.gsub("http://www.mosync.com/NEWDOC_UPDATED_URL:", "")
  html = html.gsub("/NEWDOC_UPDATED_URL:", "")
  
  # Step 3: Clean up weird urls
  html = html.gsub("//index.html", "/index.html") 
  html = html.gsub("//index.html", "/index.html") 
  html = html.gsub("index.html/", "index.html") 
  
  #puts "Page AFTER URL update: " + html
  #puts " "
  
  html
end

def htmlStripTOC(html)
  html.gsub("[toc]", "")
end

# Clean (and create) directory.
def fileCleanPath(pathName) 
  pathName.mkpath()
  begin
    pathName.rmtree()
  rescue
  end
  pathName.mkpath()
end

def fileReadContent(filePath)
  File.open(filePath, "rb") { |f| f.read }
end

def fileSaveContent(destFile, content)
  File.open(destFile, "wb") { |f| f.write(content) }
end

def fileGetPageTitle(filePath)
  html = fileReadContent(filePath)
  htmlGetPageTitle(html)
end

def cleanmd
  root = Pathname.new pathExports
  n = 1
  Pathname.glob(pathExports + "**/*.md").each  do |p|
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
elsif (ARGV.include? "importall")
    importAll
elsif (ARGV.include? "importhtml")
    importHTML
elsif (ARGV.include? "importimages")
    importImages
elsif (ARGV.include? "updateimages")
    downloadImages false
elsif (ARGV.include? "build")
    webSiteBuild
else
    puts "Options:"
    #puts "  html2md"
    #puts "  cleanmd"
    puts "  importall (imports HTML and images)"
    puts "  importhtml (imports HTML from Drupal export)"
    puts "  importimages (download images and update img urls)"
    puts "  updateimages (only update img urls)"
    puts "  build (builds web site)"
end
