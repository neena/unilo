require 'open-uri'
require "duck_duck_go"

# f = File.open("#{Rails.root}/public/data.xml")
# @xml = Nokogiri::XML(f)
# f.close

# puts "Loaded and parsed XML"


# def find_details(pubukprn, kisid, mode)
#   data = JSON.parse(open("https://data.unistats.ac.uk/api/v2/KIS/Institution/#{pubukprn}/Course/#{kisid}/#{mode.to_i - 1}.json", :http_basic_authentication=>["8YDECS8XPZ9R5RTBA72Z", "password"]).read)
# end

# @locations = @xml.css("LOCATION").inject({}) do |hash, loc|
#   hash[loc.css("UKPRN").children[0].to_s] = {latitude: loc.css("LATITUDE").children[0].to_s.to_f,
#                                             longitude: loc.css("LONGITUDE").children[0].to_s.to_f,
#                                             location: loc.css("LOCNAME").children[0].to_s,
#                                             public_accomodation_q3: loc.css("INSTUPPER").children[0].to_s.to_i,
#                                             public_accomodation_q1: loc.css("INSTLOWER").children[0].to_s.to_i,
#                                             private_accomodation_q3: loc.css("PRIVATEUPPER").children[0].to_s.to_i,
#                                             private_accomodation_q1: loc.css("PRIVATELOWER").children[0].to_s.to_i} unless hash[loc.css("UKPRN").children[0].to_s]
#   hash
# end

# @xml.css("INSTITUTION").each do |uni|
#   pubukprn = uni.css("PUBUKPRN").children[0].to_s
#   unless University.find_by_ukprn(pubukprn)
#     loc = @locations[uni.css("UKPRN").children[0].to_s]
#     u = University.create({ukprn: pubukprn}.merge(loc || {}))
#     uni.css("KISCOURSE").each do |course|
#       course_data = find_details(pubukprn, course.css("KISCOURSEID").children[0].to_s, course.css("KISMODE").children[0].to_s)
#       c = Course.create(university: u, 
#                         url: course.css("CRSEURL").children[0].to_s,
#                         title: course.css("TITLE").children[0].to_s,
#                         year_abroad?: course.css("YEARABROAD").children[0].to_s,
#                         kisid: course.css("KISCOURSEID").children[0].to_s,
#                         fee: course.css("ENGFEE").children[0].to_s.to_i,
#                         satisfaction: (course.css("NSS Q22").children[0].to_s.to_i)/100.0,
#                         salary_6m: course.css("SALARY INSTMED").children[0].to_s.to_i,
#                         jacs: course_data["JACSCodes"][0])
#     end
#   end
# end

# University.all.each do |uni|
#   data = JSON.parse(open("https://data.unistats.ac.uk/api/v2/KIS/Institution/#{uni.ukprn}.json", :http_basic_authentication=>["8YDECS8XPZ9R5RTBA72Z", "password"]).read)
#   uni.title = data["Name"]
#   uni.save
# end

# ddg = DuckDuckGo.new

# University.all.each do |uni|
#   res = ddg.zeroclickinfo(uni.title)
#   puts res.image
#   uni.image_url = res.image.to_s
#   uni.save
# end






