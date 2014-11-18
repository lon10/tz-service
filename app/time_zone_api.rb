class TimeZoneAPI < Grape::API

  format :json
  default_format :json
  default_error_formatter :txt

  desc 'Start page'
  get '/' do
    'Welcome to Time Zone API Service'
  end

  namespace 'timezone' do

    desc 'Time zone name by coordinates'
    params do
      requires :lat, type: Float, desc: 'Latitude'
      requires :lng, type: Float, desc: 'Longitude'
    end
    get '/name' do
      name = TimezoneNameService.new(params[:lat], params[:lng]).name

      { timezone: name }
    end

  end

end