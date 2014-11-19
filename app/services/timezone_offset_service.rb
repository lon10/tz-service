class TimezoneOffsetService

  def initialize(timezone)
    @timezone = timezone
  end

  def offset
    if (@timezone.present?)
      TimezoneOffsets::OFFSETS.to_h[@timezone]
    else
      nil
    end
  end

end