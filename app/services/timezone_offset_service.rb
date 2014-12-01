class TimezoneOffsetService
  def initialize(timezone)
    @timezone = timezone
  end

  def offset
    if @timezone.present?
      TzOffset.find_by_tz_name(@timezone).try(:offset)
    else
      nil
    end
  end
end