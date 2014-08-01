require 'open-uri'
require "duck_duck_go"

def find_details(pubukprn, kisid, mode)
  data = JSON.parse(open("https://data.unistats.ac.uk/api/v2/KIS/Institution/#{pubukprn}/Course/#{kisid}/#{mode.to_i - 1}.json", :http_basic_authentication=>["8YDECS8XPZ9R5RTBA72Z", "password"]).read)
end

# f = open("http://aldreth.com/data.xml")
# @xml = Nokogiri::XML(f)
# f.close

# puts "Loaded and parsed XML"

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
#     p u 
#     uni.css("KISCOURSE").each do |course|
#       course_data = find_details(pubukprn, course.css("KISCOURSEID").children[0].to_s, course.css("KISMODE").children[0].to_s)
#       c = Course.create(university: u, 
#                         url: course.css("CRSEURL").children[0].to_s,
#                         title: course.css("TITLE").children[0].to_s,
#                         year_abroad?: course.css("YEARABROAD").children[0].to_s,
#                         kisid: course.css("KISCOURSEID").children[0].to_s,
#                         fee_raw: course.css("ENGFEE").children[0].to_s.to_i,
#                         satisfaction: (course.css("NSS Q22").children[0].to_s.to_i)/100.0,
#                         salary_6m_raw: course.css("SALARY INSTMED").children[0].to_s.to_i,
#                         mode: course.css("KISMODE").children[0].to_s,
#                         work_study: course.css("EMPLOYMENT WORKSTUDY").children[0].to_s,
#                         ucas: course.css("UCASCOURSEID").children[0].to_s,
#                         explanation_quality: (course.css("NSS Q1").children[0].to_s.to_i)/100.0,
#                         interesting: (course.css("NSS Q2").children[0].to_s.to_i)/100.0,
#                         enthusiastic: (course.css("NSS Q3").children[0].to_s.to_i)/100.0,
#                         intellectually_stimulating: (course.css("NSS Q4").children[0].to_s.to_i)/100.0,
#                         prompt_feedback: (course.css("NSS Q7").children[0].to_s.to_i)/100.0,
#                         library: (course.css("NSS Q16").children[0].to_s.to_i)/100.0,
#                         accessible_it: (course.css("NSS Q17").children[0].to_s.to_i)/100.0,
#                         confidence: (course.css("NSS Q21").children[0].to_s.to_i)/100.0,
#                         supervised_time: (course.css("AVGCOURSEWORK").children[0].to_s.to_i)/100.0,
#                         assessment_by_cw: (course.css("AVGSCHEDULED").children[0].to_s.to_i)/100.0)
#       p c
#     end
#   end
# end

# University.all.each do |uni|
#   data = JSON.parse(open("https://data.unistats.ac.uk/api/v2/KIS/Institution/#{uni.ukprn}.json", :http_basic_authentication=>["8YDECS8XPZ9R5RTBA72Z", "password"]).read)
#   uni.title = data["Name"]
#   uni.save
# end

Course.all.select do |c|
  c.jacs.blank?
end.each do |course|
  course_data = find_details(course.university.ukprn, course.kisid, course.mode)
  course.jacs = course_data["JACSCodes"][0]
  course.save
  p course
end

ddg = DuckDuckGo.new

University.all.select do |u|
  u.description.blank? || u.image_url.blank?
end.each do |uni|
  uni.set_image_url
  res = ddg.zeroclickinfo(uni.title)
  uni.description = res.abstract
  uni.save
  p uni
end







