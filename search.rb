require "rest-client"

class BingSearch
  def initialize(search)
    url = "https://www.bing.com/search"
    @search = search
    @response = RestClient.get(url, params: { q: @query })
  end

  def refine_query
    @query = @search
  end

  def code
    @response.code
  end

  def cookies
    @response.cookies
  end

  def web_page
    search_result = @response.body
    IO.write("search.html", search_result)
    link = File.expand_path("search.html")
    puts "Find search result here => #{link}"
  end

  def headers
    @response.headers
  end
end

search = "hello"
