class TzOffset < ActiveRecord::Base

  def self.actualize(tz_name, secs)
    tz_offset = find_or_create_by(tz_name: tz_name)
    tz_offset.offset = secs
    tz_offset.save!
  end

end