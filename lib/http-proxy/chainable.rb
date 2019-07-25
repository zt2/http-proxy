require 'http'
require 'proxy_pool'

module HTTP
  module Chainable
    # Choose a proxy to send HTTP request
    #
    # @param anonymous [TrueClass | FalseClass] Using anonymous proxy or not
    def proxy(anonymous = true)
      if anonymous
        p = ProxyPool.get_anonymous_proxy
      else
        p = ProxyPool.get_transparent_proxy
      end

      via(p['host'], p['port'])
    end
  end
end