load "./lib/search.rb"

def web_page(body)
  IO.write("search.html", body)
  link = File.expand_path("search.html")
  puts "#{link}"
end

loop do
  puts "Search Bing!"
  puts "Enter `q` to Quit"
  word = gets.chomp.strip
  break if word== 'q'

  bing = BingSearch.new(word)
  body = bing.body
  bing.code
  bing.cookies
  bing.headers
  bing.raw_headers

  puts "Top Results are: "
  puts bing.top_result
  puts "You can find the full result in the link below..."
  web_page(body)
end
puts "run `bin/bing_search.rb` to search again!!!"
