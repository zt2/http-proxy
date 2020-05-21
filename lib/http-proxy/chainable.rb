require 'http'
require 'proxy_pool'

module HTTP
  module Chainable
    # Choose a proxy to send HTTP request
    #
    # @param lazy_mode [Boolean] Re-use the last working proxy
    def proxy(lazy_mode: true, &block)
      p = if lazy_mode && !@_last_proxy.nil?
            @_last_proxy
          else
            block_given? ? ProxyPool.get(&block) : ProxyPool.get
          end

      begin
        ret = via(p['host'], p['port'])
        @_last_proxy = p
      rescue HTTP::ConnectionError, HTTP::TimeoutError => e
        # Remove it from pool
        ProxyPool.remove(p)

        # Select another one
        p = block_given? ? ProxyPool.get(&block) : ProxyPool.get
        while p.nil?
          ProxyPool.update
          p = block_given? ? ProxyPool.get(&block) : ProxyPool.get
        end

        retry
      end

      ret
    end
  end
end