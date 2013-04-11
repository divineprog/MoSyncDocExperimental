require "open-uri"

url = "http://www.gravatar.com/avatar/17dc990ed4899b8fd0fbf01be7c09e6f?s=128&d=identicon&r=PG"
open(url) do |f|
   File.open("tempus.png","wb") do |file|
     file.puts f.read
   end
end

File.open("tempus2.png", "wb") do |f|
  f.write open(url).read 
end
