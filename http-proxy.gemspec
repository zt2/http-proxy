lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'http-proxy'
  spec.version       = '0.3.1'
  spec.authors       = ['hi_ztz']
  spec.email         = ['hi_ztz@protonmail.com']

  spec.summary       = %q{Sending HTTP request via proxy automatically}
  spec.description   = %q{HTTP::Proxy extending HTTP to make proxy automatically}
  spec.homepage      = 'https://github.com/zt2/http-proxy'
  spec.license       = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'minitest', '~> 5.0'

  spec.add_runtime_dependency 'proxy_pool', '~> 0.3.0'
  spec.add_runtime_dependency 'http', '~> 4.4', '>= 4.4.1'
end
