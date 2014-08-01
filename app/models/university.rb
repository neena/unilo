class University < ActiveRecord::Base
  require 'open-uri'
  require 'uri'
  has_many :courses
  has_many :elo_scores

  def set_image_url
    puts "https://api.datamarket.azure.com/Bing/Search/v1/Image?$format=json&Query=%27#{CGI.escape(self.title + " campus")}%27"
    data = JSON.parse(open("https://api.datamarket.azure.com/Bing/Search/v1/Image?$format=json&Query=%27#{CGI.escape(self.title.gsub('&', '\&') + " campus")}%27", :http_basic_authentication=>["8g4bf1KG8MEmBTM1JMnPv47TbemHVjJrhLfG6ZnOFcU", "8g4bf1KG8MEmBTM1JMnPv47TbemHVjJrhLfG6ZnOFcU"]).read)
    self.image_url = data["d"]["results"][0]["MediaUrl"]
    self.save
  end
end
