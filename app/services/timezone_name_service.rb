class TimezoneNameService

  def initialize(lat, lng)
    @lat = lat
    @lng = lng
  end

  def name
    sql = "SELECT tzid FROM tz_world WHERE ST_Contains(geom, ST_MakePoint(#{@lng}, #{@lat}));"
    name_hash = ActiveRecord::Base.connection.execute(sql).first

    name_hash['tzid'] rescue nil
  end
end