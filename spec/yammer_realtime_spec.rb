require 'spec_helper'

describe YammerRealtime do
  context 'configure' do
    before do
      YammerRealtime.configure do |config|
        config.auth_token = 'abcdefghijklmnopqrstuvwxyz'
      end
    end
    it 'returns the same result' do
      expect(YammerRealtime.auth_token).to eq('abcdefghijklmnopqrstuvwxyz')
    end
  end
end

