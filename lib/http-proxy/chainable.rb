require 'http'
require 'proxy_pool'

module HTTP
  module Chainable
    # Choose a proxy to send HTTP request
    #
    # @param anonymous [Boolean] Using anonymous proxy or not
    def proxy(anonymous = true, &block)
      if anonymous
        p = ProxyPool.get_high_anonymous_proxy
      elsif block_given?
        p = ProxyPool.get(&block)
      else
        p = ProxyPool.get
      end

      via(p['host'], p['port'])
    end
  end
end