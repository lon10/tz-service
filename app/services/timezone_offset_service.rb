class TimezoneOffsetService

  def initialize(timezone)
    @timezone = timezone
  end

  def offset
    if (@timezone.present?)
      TzOffset.find_by_tz_name(@timezone).offset
    else
      nil
    end
  end

end