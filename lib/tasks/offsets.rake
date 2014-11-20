namespace :offsets do

  #TODO write it to some yaml
  desc 'Offsets actualization'
  task :actualize do
    sql = 'select tzid from tz_world group by tzid;'
    offsets = ActiveRecord::Base.connection.execute(sql)

    data = offsets.map do |record|
      tzid = record['tzid']

      tz = tzid.downcase.gsub('/', '--')
      page = Nokogiri::HTML(RestClient.get("http://www.zeitverschiebung.net/en/timezone/#{tz}"))

      hours = page.css('table.timezoneinfo')[0].css('tr')[0].css('td')[1].css('strong').text.gsub(' hours', '').to_f rescue 0
      secs = hours.to_i * 60 * 60

      [tzid , secs]
    end

    p 'Offsets actualized!'
    p data
  end
end
