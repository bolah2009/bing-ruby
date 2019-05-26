require "rest-client"

class BingSearch
  def initialize(search)
    @url = "https://www.bing.com/search"
    @query = refine_query(search)
    response
  end

  def refine_query(search)
    search.gsub(/\s/, "+")
  end

  def response
    @response = RestClient.get(@url, params: { q: @query })
  end

  def code
    @response.code
  end

  def cookies
    @response.cookies
  end

  def headers
    @response.headers
  end

  def raw_headers
    @response.raw_headers
  end

  def body
    @response.body
  end

  def top_result
    matcher = /<h2><a.*?href="(?<link>.*?)".*?h=.*?>(?<text>.*?)<\/a.*?>/
    index = 1
    result_list = []
    body.scan(matcher).each do |result|
      result_list << "\n#{index}: #{result.last}\nLink:  #{result.first}\n"
      index += 1
    end
    result_list
  end
end
