# Converts HTML export of the Feature/Platform Support page to a tab separated file.

def inputFile
 "./featureplatform.html"
end

def outputFile
 "./featureplatform.csv"
end

def process
  html = File.open(inputFile, "rb") { |f| f.read }
  
  html = html.gsub(/\n\040{22}/, "")
  html = html.gsub(/\n\040{18}/, "")
  html = html.gsub(/\040{14}/, "")
  html = html.gsub(/\n\040{12}/, "")
  html = html.gsub(/\040{10}/, "")
  html = html.gsub("<tr class=\"odd views-row-first\">", "<tr>")
  html = html.gsub("<td class=\"views-field views-field-edit-node\"></td>", "")
  html = html.gsub(" class=\"odd views-row-last\"", "")
  html = html.gsub(" class=\"odd\"", "")
  html = html.gsub(" class=\"even\"", "")
  html = html.gsub("views-field views-field-field-", "")
  html = html.gsub("<div class=\"yes-color\">Yes</div>", "Yes")
  html = html.gsub("<div class=\"no-color\">No</div>", "No")
  html = html.gsub("<div class=\"default-color\">N/A</div>", "N/A")
  html = html.gsub("lang-layer-value", "lang")
  html = html.gsub("feature-module-value", "module")
  html = html.gsub("classes-functions-value", "functions")
  html = html.gsub("-feature-value", "")
  html = html.gsub("</td>\n</tr>", "</td></tr>")
  html = html.gsub("<td class=\"notes\"></td>", "<td class=\"notes\">NONE</td>")
  html = html.gsub("&amp;lt", "")
  
  #puts html
  
  result = ""
  html.scan(/<tr><td class="lang">(.*?)<\/td><td class="module">(.*?)<\/td><td class="functions">(.*?)<\/td><td class="android">(.*?)<\/td><td class="ios">(.*?)<\/td><td class="wp7">(.*?)<\/td><td class="bby">(.*?)<\/td><td class="j2me">(.*?)<\/td><td class="moblin">(.*?)<\/td><td class="more">(.*?)<\/td><td class="symbian">(.*?)<\/td><td class="winmo">(.*?)<\/td><td class="notes">(.*?)<\/td><\/tr>/) do 
  | lang, mod, fun, android, ios, wp, bb, j2me, moblin, more, symbian, winmo, notes |
    result += lang + "\t" + mod + "\t" + fun + "\t" + android + "\t" + ios + "\t" + wp + "\t" + bb + "\t" + j2me + "\t" + moblin + "\t" + more + "\t" + symbian + "\t" + winmo + "\t" + notes + "\n"
  end
  
  File.open(outputFile, "wb") { |f| f.write(result) }
end

process
