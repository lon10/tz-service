describe 'API' do
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
      its(:body) { should eq({ error: 'lat is missing, lng is missing' }.to_json) }
    end

    context 'with right params' do
      before do
        get '/timezone/name', { lat: 55.7914056, lng: 49.1120427 }
      end

      it {should be_ok}
      its(:body) { should eq({ timezone: 'Europe/Moscow', offset: 10800 }.to_json) }
    end

    context 'with wrong coords' do
      before do
        get '/timezone/name', { lat: 0.0, lng: 0.0 }
      end

      it {should be_ok}
      its(:body) { should eq({ timezone: nil, offset: nil }.to_json) }
    end
  end
end