describe 'API' do

  let(:params) {
    {
      lat: 55.7914056,
      lng: 49.1120427
    }
  }

  let(:error) {
    { error: 'lat is missing, lng is missing' }
  }

  let(:name_response) {
    { timezone: 'Europe/Moscow' }
  }

  it 'should greet us' do
    get '/'

    expect(last_response).to be_ok
    expect(last_response.body).to eq(%Q{"Welcome to Time Zone API Service"})
  end

  describe 'Timezone name' do
    subject {
      last_response
    }

    context 'with wrong params' do
      before do
        get '/timezone/name'
      end

      its(:status) {should eq 400}
      its(:body) {should eq error.to_json}
    end

    context 'with right params' do
      before do
        get '/timezone/name', params
      end

      its(:status) {should eq 200}
      its(:body) {should eq name_response.to_json}
    end

  end

end