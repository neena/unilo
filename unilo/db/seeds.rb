f = File.open("#{Rails.root}/public/data.xml")
@xml = Nokogiri::XML(f)
f.close

puts "Loaded and parsed XML"

University.delete_all

@locations = @xml.css("LOCATION").inject({}) do |hash, loc|
  hash[loc.css("UKPRN").children[0].to_s] = {latitude: loc.css("LATITUDE").children[0].to_s.to_f,
                                            longitude: loc.css("LONGITUDE").children[0].to_s.to_f,
                                            location: loc.css("LOCNAME").children[0].to_s,
                                            public_accomodation_q3: loc.css("INSTUPPER").children[0].to_s.to_i,
                                            public_accomodation_q1: loc.css("INSTLOWER").children[0].to_s.to_i,
                                            private_accomodation_q3: loc.css("PRIVATEUPPER").children[0].to_s.to_i,
                                            private_accomodation_q1: loc.css("PRIVATELOWER").children[0].to_s.to_i} unless hash[loc.css("UKPRN").children[0].to_s]
  hash
end

@xml.css("INSTITUTION").each do |uni|
  loc = @locations[uni.css("UKPRN").children[0].to_s] 
  u = University.create({ukprn: uni.css("PUBUKPRN").children[0].to_s}.merge(loc || {}))
  uni.css("KISCOURSE").each do |course|
    c = Course.create(university: u, 
                      url: course.css("CRSEURL").children[0].to_s,
                      title: course.css("TITLE").children[0].to_s,
                      year_abroad?: course.css("YEARABROAD").children[0].to_s,
                      kisid: course.css("KISCOURSEID").children[0].to_s,
                      fee: course.css("ENGFEE").children[0].to_s.to_i,
                      satisfaction: (course.css("NSS Q22").to_s.to_i)/100,
                      salary_6m: course.css("SALARY INSTMED"))
  end
end

