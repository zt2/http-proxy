require 'http'
require 'proxy_pool'

module HTTP
  module Chainable
    # Choose a proxy to send HTTP request
    #
    # @param anonymous [Boolean] Using anonymous proxy or not
    def proxy(anonymous = true)
      if anonymous
        p = ProxyPool.get_high_anonymous_proxy
      else
        p = ProxyPool.get
      end

      via(p['host'], p['port'])
    rescue HTTP::ConnectionError
      ProxyPool.remove(p)
      retry
    end
  end
end