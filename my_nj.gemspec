# -*- encoding: utf-8 -*-

=begin
#myNJ authorization API

#__This document is confidential and proprietary to the State of New Jersey. Do not redistribute it outside your team, and do not post it in any repository or allow it to be incorporated into any artificial intelligence tool, LLM or other database.__  This API is used to manage authorizations for myNJ users to access an agency's application.  It should be called from a user management module in the application, to enable a privileged user to grant and revoke access for other users.  The API allows the privileged user to avoid using the myNJ Role Manager facility for granting and revoking.  The calling application __must__ restrict access to its user management module so that only properly privileged users can use it to cause API calls to be made to myNJ.  The privileged user must have a myNJ account with the role being managed, along with a valid user key (unique identifier) for that role.  The API is not designed or intended for batch operation. 

OpenAPI spec version: 1.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 3.0.66
=end

$:.push File.expand_path("../lib", __FILE__)
require "my_nj/version"

Gem::Specification.new do |s|
  s.name        = "my_nj"
  s.version     = MyNJ::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Swagger-Codegen"]
  s.email       = [""]
  s.homepage    = "https://github.com/swagger-api/swagger-codegen"
  s.summary     = "myNJ authorization API Ruby Gem"
  s.description = "__This document is confidential and proprietary to the State of New Jersey. Do not redistribute it outside your team, and do not post it in any repository or allow it to be incorporated into any artificial intelligence tool, LLM or other database.__  This API is used to manage authorizations for myNJ users to access an agency's application.  It should be called from a user management module in the application, to enable a privileged user to grant and revoke access for other users.  The API allows the privileged user to avoid using the myNJ Role Manager facility for granting and revoking.  The calling application __must__ restrict access to its user management module so that only properly privileged users can use it to cause API calls to be made to myNJ.  The privileged user must have a myNJ account with the role being managed, along with a valid user key (unique identifier) for that role.  The API is not designed or intended for batch operation. "
  s.license     = "Unlicense"
  s.required_ruby_version = ">= 1.9"

  s.add_runtime_dependency 'typhoeus', '~> 1.0', '>= 1.0.1'
  s.add_runtime_dependency 'json', '~> 2.1', '>= 2.1.0'

  s.add_development_dependency 'rspec', '~> 3.6', '>= 3.6.0'

  s.files         = `find *`.split("\n").uniq.sort.select { |f| !f.empty? }
  s.test_files    = `find spec/*`.split("\n")
  s.executables   = []
  s.require_paths = ["lib"]
end
