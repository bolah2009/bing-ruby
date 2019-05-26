load "./lib/search.rb"

RSpec.describe BingSearch do
  let(:hello_search) { BingSearch.new("hello") }

  context "#response" do
    let(:response) { hello_search.response }
    it "returns an object from the 'RestClient' Class" do
      expect(response.class).to eq RestClient::Response
    end
  end

  context "#code" do
    let(:code) { hello_search.code }
    it "returns an integer of the HTTP response code" do
      expect(code.class).to eq Integer
    end
  end

  context "#body" do
    let(:body) { hello_search.body }
    it "returns the response body as a string of html file" do
      expect(body.class).to eq String
    end
  end

  context "#headers" do
    let(:headers) { hello_search.headers }
    it "returns a hash of HTTP response headers" do
      expect(headers.class).to eq Hash
    end
  end

  context "#raw_headers" do
    let(:raw_headers) { hello_search.raw_headers }
    it "returns a hash of HTTP response headers as unprocessed arrays" do
      expect(raw_headers.class).to eq Hash
    end
  end

  context "#cookies" do
    let(:cookies) { hello_search.cookies }
    it "hash of HTTP cookies set by the server" do
      expect(cookies.class).to eq Hash
    end
  end

  context "#refine_query" do
    it "replace whitespace (spaces, tabs and new lines) with a plus ('+') sign " do
      actual = hello_search.refine_query("What is bing?")
      expected = "What+is+bing?"
      expect(actual).to eq expected
    end
  end

  context "#top_result" do
    let(:top_result) { hello_search.top_result }
    it "returns an array of top results from the searched word" do
      expect(top_result.class).to eq Array
    end
  end
end
