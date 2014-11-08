# coding: utf-8
require 'yammer_realtime/version'
require 'yammer_realtime/client'

module YammerRealtime
  class << self
    attr_accessor :auth_token

    def configure
      yield self
    end
  end
end
