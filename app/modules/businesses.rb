module Businesses
  @API_HOST = "https://api.yelp.com"
  @SEARCH_PATH = "/v3/businesses/search"
  BUSINESS_PATH = "/v3/businesses/"
  @API_KEY = ENV["YELP_API"]
  
  def get_businesses(term, location)
    url = "#{@API_HOST}#{@SEARCH_PATH}"
    params = {
      term: term,
      location: location
    }
    response = HTTP.auth("Bearer #{@API_KEY}").get(url, params: params)
    response.parse["businesses"]
  end

  def get_business(business_id)
    url = "#{@API_HOST}#{BUSINESS_PATH}#{business_id}"
    response = HTTP.auth("Bearer #{@API_KEY}").get(url)
    response.parse
  end

  module_function :get_businesses
  module_function :get_business
end