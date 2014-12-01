namespace :offsets do
  desc 'Offsets actualization'
  task :actualize do
    #Getting all offsets
    offsets = ActiveRecord::Base.connection.execute('select tzid from tz_world group by tzid;')

    #Parsing offsets from http://www.zeitverschiebung.net
    data = offsets.map do |record|
      #timezone name
      tzid = record['tzid']

      #America/Dominica -> america--dominica
      tz = tzid.downcase.gsub('/', '--')

      url = "http://www.zeitverschiebung.net/en/timezone/#{tz}"

      #Getting timezone page
      p "Getting #{url}"
      page = Nokogiri::HTML(RestClient.get(url))

      #Parse GMT/UTC hours... Sorry about this shit code...
      p "Parsing #{tz}"
      hours = Float(page.css('table.timezoneinfo')[0].css('tr')[0].css('td')[1].css('strong').text.gsub(' hours', '').gsub(' hour', '')) rescue nil

      #Making a GMT/UTC offset in second
      secs =
      if hours
        (hours * 1.hour).to_i
      else
        nil
      end
      p "Done! #{tzid} -> #{secs} seconds"
      p '------------------------------------------'

      TzOffset.actualize(tzid, secs)

      [tzid, secs]
    end

    p 'Offsets actualized!'
    p data
  end
end
