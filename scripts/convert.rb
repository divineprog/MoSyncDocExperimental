# Prorgam that builds the documentation website.
# And handles the import of documentation from Drupal.

# This is a way to copy files.
# FileUtils.cp_r(Dir[sourceDir + "*"], destDir)

require 'fileutils'
require 'pathname'
require "open-uri"

load 'structure.rb' 

# Directory of Drupal export.
# Not in git.
def pathExports
  "../mosync-doc-exports-130429/"
end

# Templates used for building the web site.
# In git.
def pathTemplates
  "../templates/"
end

def pathPageTemplate
  pathTemplates + "page-template.html"
end

def pathMainMenuTemplate
  pathTemplates + "page-template.html"
end

def pathPageSDK
  pathTemplates + "page-sdk.html"
end

def pathPageSDKMenu
  pathTemplates + "page-sdk-menu.html"
end

def pathPageReload
  pathTemplates + "page-reload.html"
end

def pathPageReloadMenu
  pathTemplates + "page-reload-menu.html"
end

# Documentation main source directory
# In git.
def pathDocuments
  "../docs/"
end

# Directory of doc web site
# Not in git.
def pathWebSite
  "../website/"
end

# Root folder for doc pages.
def pathWebSitePages
  pathWebSite
end

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

# TODO: Remove this function, it is dangerous.
# Deletes files under version control.
# Only for development phase.
def docClean
  dir = Pathname.new pathDocuments
  fileCleanPath(dir)
end

def webSiteClean
  dir = Pathname.new pathWebSite
  fileCleanPath(dir)
end

def docImportAll
  docImportHTML
  docDownloadImages
  docUpdateImageTags
end

# Import HTML files exported from Drupal.
def docImportHTML
  sourceDir = Pathname.new pathExports
  destDir = Pathname.new pathDocuments
  
  # Process and copy pages to dest dir.
  n = 0
  docPages().each do |page|
    n = n + 1
    
    sourceFile = sourceDir + pageOriginalFile(page) + "index.html"
    destPath = destDir + pageTargetFile(page)
    destFile = destPath + "index.html"
    
    puts "Importing File #{n.to_s}: #{sourceFile} #{destFile}"
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


# Iterate over all pages and all image urls
# and download images to local files.
def docDownloadImages
  puts "Downloading images"
  
  externalImages = "EXTERNAL IMAGES:\n"
  
  # Find all files.
  n = 0
  Pathname.glob(pathDocuments() + "**/*.html").each do |filePath|
    n = n + 1
    puts "Processing File " + n.to_s + ": " + filePath.to_s
    # Iterate over all images in the file.
    html = fileReadContent(filePath)
    html.scan(/<img.*?>/) do |imgTag|
      puts "  img: " + imgTag
      # Get the scr url of the img tag
      # and download and save image.
      url = docGetImageDownloadURL(imgTag)
      if url != nil then
	    destFile = docGetImagePath(url, filePath.parent)
        puts "    downloading from: " + url
        puts "    writing image to: " + destFile.to_s
        docDownloadImage(url, destFile)
        puts "    done"
	  else
	    puts "    *** IMAGE NOT DOWNLOADED: " + imgTag
        # A hack indeed.
        externalImages += filePath.to_s + ": " + $lastImageUrl + "\n"
      end
    end
  end
  
  puts externalImages
end

# Iterate over all pages and all image urls
# and convert img tags to refer to local files.
def docUpdateImageTags
  puts "Updating image tags"

  # Find all files.
  n = 0
  Pathname.glob(pathDocuments() + "**/*.html").each do |filePath|
    n = n + 1
    puts "Updating File " + n.to_s + ": " + filePath.to_s
	
    # Iterate over all images in the file.
    html = fileReadContent(filePath)
    html.scan(/<img.*?>/) do |imgTag|
      puts "  img: " + imgTag
      url = docGetImageDownloadURL(imgTag)
      if url != nil then
        # Update img tag.
        parts = imgTag.split(/src="(.*?)"/)
		imageFileName = docGetImagePath(url, "")
		imageFileName = imageFileName.gsub(" ", "%20")
        newImgTag = parts[0] + "src=\"" + imageFileName + "\"" + parts[2]
        puts "  new img: " + newImgTag
        # Update image tag.
        html = html.gsub(imgTag, newImgTag)
	  else
	    puts "    *** IMAGE IGNORED: " + imgTag
      end
	end

    # Write the updated file.
    fileSaveContent(filePath, html)
  end
end

# Get URL to download image from. Return nil
# if the image should not be downloaded.
def docGetImageDownloadURL(imgTag)
  srcMatch = imgTag.scan(/src="(.*?)"/)
  if not srcMatch.empty? then 
	src = srcMatch[0][0]
    $lastImageUrl = src # Useful for logging when returning nil below
    if src.start_with?("http://www.mosync.com") then
      return src
    elsif src.start_with?("https://raw.github.com") then
      return src
    elsif src.start_with?("http://") or 
      src.start_with?("https://") then
	  # Return nil here if images from other domains
	  # should not be downloaded.
      puts "    *** External image: " + src
      return nil
    elsif src.start_with?("/") then
      # Download from http://www.mosync.com/
      return "http://www.mosync.com" + src
    else 
      puts "    *** UKNOWN IMAGE SOURCE: " + src
    end
  end
  return nil
end

# Given a url and a path, get the 
# file path to the image file.
def docGetImagePath(url, dirPath)
  imageFileName = Pathname(url).basename.to_s
  return dirPath + "images/" + imageFileName
end

# Download an image to the destination file.
def docDownloadImage(url, destFile)
  # Fix the image url, it cannot contain spaces.
  url = url.gsub(" ", "%20")
  begin
    open(url) do |f|
      Pathname(destFile).parent.mkpath()
      File.open(destFile,"wb") do |file| file.puts(f.read) end
    end
  rescue
    puts "*** CANNOT DOWNLOAD IMAGE: " + url.to_s + " ***"
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
      "sdk-navigation.html",
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
      
    webSiteBuildPageFromFiles(
      :pagePath => sourceFile,
      :pageTemplatePath => "dummy",
      :menuTemplatePath => "sdk-navigation.html",
      :outputPath => destFile
	)
	
	
	# Copy images to destination directory.
	imagesSource = sourceDir + pageTargetFile(page) + "images"
	imagesDest = destDir + pageTargetFile(page)
	FileUtils.cp_r(Dir[imagesSource], imagesDest)
  end
end

def webSiteBuildPageFromFiles params
    pagePath = params[:pagePath]
    outputPath = params[:outputPath]
    pageTemplatePath = params[:pageTemplatePath]
    menuTemplatePath = params[:menuTemplatePath]
	
    html = File.open(pagePath, "rb") { |f| f.read }
    webSiteBuildPageFromStandardTemplate(
      htmlGetPageTitle(html),
      htmlGetPageContent(html),
      menuTemplatePath.to_s,
      outputPath)
end

# Build link pages for all categories and page types.
def webSiteBuildLinkPages
  title = "C/C++ Coding Guides"
  webSiteBuildCategoryLinkPage([CPP, GUIDE], "sdk/cpp/guides/", title)
  
  title = "C/C++ Tutorials"
  webSiteBuildCategoryLinkPage([CPP,TUTORIAL], "sdk/cpp/tutorials/", title)
  
  title = "C/C++ Examples"
  webSiteBuildCategoryLinkPage([CPP,EXAMPLE], "sdk/cpp/examples/", title)
  
  title = "JavaScript Coding Guides"
  webSiteBuildCategoryLinkPage([JS,GUIDE], "sdk/js/guides/", title)
  
  title = "JavaScript Tutorials"
  webSiteBuildCategoryLinkPage([JS,TUTORIAL], "sdk/js/tutorials/", title)
  
  title = "JavaScript Examples"
  webSiteBuildCategoryLinkPage([JS,EXAMPLE], "sdk/js/examples/", title)
  
  #title = "All Examples"
  #webSiteBuildCategoryLinkPage([CPP,JS,EXAMPLE], "sdk/overviews/examples/", title)
  
  title = "Tool Guides"
  webSiteBuildCategoryLinkPage([SDK,TOOLS,GUIDE], "sdk/tools/guides/", title)
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
      "sdk-navigation.html",
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
def webSiteBuildPageFromStandardTemplate(title, content, navigationTemplate, destFile)
  # Set up paths.
  templateFile = Pathname.new(pathTemplates() + "page-template.html")
  navigationTemplateFile = Pathname.new(pathTemplates() + navigationTemplate)
  pagesDir = Pathname.new(pathWebSitePages())
  jsDir = Pathname.new(pathWebSite() + "js/")
  destPath = destFile.parent
  
  # Relative paths used for links and js/css imports.
  pagesDirRelativePath = pagesDir.relative_path_from(destPath)
  jsDirRelativePath = jsDir.relative_path_from(destPath)

  # Read template.
  template = File.open(templateFile, "rb") { |f| f.read }
  navigation = File.open(navigationTemplateFile, "rb") { |f| f.read }
  
  # Create HTML from template.
  html = webSiteBuildPageFromTemplate(
    template,
    title,
    content,
    navigation,
    jsDirRelativePath,
    pagesDirRelativePath)
  
  # Make sure dest path exists and write file.
  destPath.mkpath()
  File.open(destFile, "wb") { |f| f.write(html) }
end

# Returns HTML for page built from template.
def webSiteBuildPageFromTemplate(template, title, content, navigation, jsDirRelativePath, pagesDirRelativePath)
  # Order of these statements is important since included parts
  # also contain placeholders to be replaced.
  html = template.gsub("TEMPLATE_PAGE_CONTENT", content)
  html = html.gsub("TEMPLATE_PAGE_TITLE", title)
  html = html.gsub("TEMPLATE_PAGE_NAVIGATION", navigation)
  html = html.gsub("TEMPLATE_NAVIGATION_INSET", "true")
  html = html.gsub("TEMPLATE_PANEL_NAVIGATION", navigation)
  html = html.gsub("TEMPLATE_NAVIGATION_INSET", "false")
  html = html.gsub("TEMPLATE_JS_PATH", jsDirRelativePath.to_s)
  html = html.gsub("TEMPLATE_DOC_PATH", pagesDirRelativePath.to_s)
  html
end

def allPages()
  $pages
end

def allPagesNotIgnore()
  $pages.select { |page|
    not pageIsIgnore?(page) }
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
  html = html.gsub(/{syntaxhighlighter brush: cpp.*?}/, "<pre class=\"mosync-code-cpp\">")
  html = html.gsub(/{syntaxhighlighter brush: jscript.*?}/, "<pre class=\"mosync-code-js\">")
  html = html.gsub(/{syntaxhighlighter brush: css.*?}/, "<pre class=\"mosync-code-css\">")
  html = html.gsub(/{syntaxhighlighter brush: xml.*?}/, "<pre class=\"mosync-code-xml\">")
  html = html.gsub(/{\/syntaxhighlighter}/, "</pre>")
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
      "/NEWDOC_UPDATED_URL_TEMPLATE_DOC_PATH/" + pageTargetFile(page) + "/index.html")
	# Replace short urls
    html = html.gsub(
      pageOriginalFile(page), 
      "NEWDOC_UPDATED_URL_TEMPLATE_DOC_PATH/" + pageTargetFile(page) + "/index.html")
  end
  
  # Step 2: Strip off absolute urls and markers
  html = html.gsub("http://www.mosync.com/NEWDOC_UPDATED_URL_", "")
  html = html.gsub("/NEWDOC_UPDATED_URL_", "")
  html = html.gsub("NEWDOC_UPDATED_URL_", "")
  
  # Step 3: Clean up weird urls
  html = html.gsub("//index.html", "/index.html")
  html = html.gsub("//index.html", "/index.html")
  html = html.gsub("index.html/", "index.html")
  html = html.gsub("TEMPLATE_DOC_PATH//", "TEMPLATE_DOC_PATH/")
  
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
    puts "Cannot delete: " + pathName.to_s
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

# Used for one shot conversion of symbolic path names.
def do_not_use_updatePathSymbols
  puts "Updating path symbols"

  # Find all files.
  n = 0
  Pathname.glob("../**/*.html").each do |filePath|
    n = n + 1
    puts "Updating File " + n.to_s + ": " + filePath.to_s
	
    # Replace all symbols in file.
    html = fileReadContent(filePath)
    html = html.gsub("RELATIVE_", "TEMPLATE_")

    # Write the updated file.
    fileSaveContent(filePath, html)
  end
end

def listExportedPagesNotInDocs
  exportedFileNames = 
    Pathname.glob(pathExports + "**/*.html").collect do |filename|
	  filename.to_s.gsub(pathExports, "").gsub("/index.html", "")
	end
  importedFileNames = allPages().collect do |page|
    pageOriginalFile(page)
  end
  
  puts exportedFileNames - importedFileNames
end

def listTargetFileNames
  targetFileNames = allPages().collect do |page|
    pageTargetFile(page)
  end
  
  puts targetFileNames.sort
end

def generateRedirectSQL
  deleteTemplate = "DELETE FROM mosyncweb_path_redirect where source = 'ORIGINAL_PATH';"
  insertTemplate = "INSERT INTO mosyncweb_path_redirect (rid,source,redirect,query,fragment,type,last_used,language)
VALUES (NULL,'ORIGINAL_PATH','TARGET_PATH',NULL,NULL,'301',NOW(),'');"

  sql = ""
  targetFileNames = allPagesNotIgnore().collect do |page|
    originalPath = pageOriginalFile(page)
    targetPath = pageTargetFile(page)
	if (targetPath == HOME_PATH) then
	  targetPath = "docs/index.html"
	else
	  targetPath = "docs/" + targetPath + "/index.html"
	end
	deleteStatement = deleteTemplate.gsub("ORIGINAL_PATH", originalPath)
	insertStatement = insertTemplate.
		gsub("ORIGINAL_PATH", originalPath).
			gsub("TARGET_PATH", targetPath)
	sql += deleteStatement + "\n" + insertStatement + "\n"
  end
  
  puts sql
end


# Helper function to run shell commands.
def sh(cmd)
    #TODO: optimize by removing the extra shell
    #the Process class should be useful.
    $stderr.puts cmd
    if (!system(cmd)) then
        error "Command failed: '#{$?}'"
    end
end

# Commands
if (ARGV.include? "html2md")
    #convertHtmlToMarkdown
elsif (ARGV.include? "cleanmd")
    #cleanmd
elsif (ARGV.include? "importall")
    docImportAll
elsif (ARGV.include? "importhtml")
    docImportHTML
elsif (ARGV.include? "downloadimages")
    docDownloadImages
elsif (ARGV.include? "updateimagetags")
    docUpdateImageTags
elsif (ARGV.include? "cleandoc")
    docClean
elsif (ARGV.include? "buildweb")
    webSiteBuild
elsif (ARGV.include? "cleanweb")
    webSiteClean
elsif (ARGV.include? "listexports")
    listExportedPagesNotInDocs
elsif (ARGV.include? "listtargets")
	listTargetFileNames
elsif (ARGV.include? "redirects")
	generateRedirectSQL
else
    puts "Options:"
    #puts "  html2md"
    #puts "  cleanmd"
    puts "  importall (importhtml + downloadimages + updateimagetags)"
    puts "  importhtml (imports HTML from Drupal export)"
    puts "  downloadimages (download images)"
    puts "  updateimagetags (update img urls)"
    puts "  cleandoc (cleans documentation folder)"
    puts "  buildweb (builds website)"
    puts "  cleanweb (cleans website folder)"
end
