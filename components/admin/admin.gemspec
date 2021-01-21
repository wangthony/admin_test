$:.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'admin/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "admin"
  spec.version     = Admin::VERSION
  spec.authors     = ['Hellobase']
  spec.email       = ['code@hellobase.com']
  spec.summary     = "Admin"

  spec.files = Dir['{app,config,db,lib}/**/*']

  spec.add_dependency 'rails', '~> 6'
  spec.add_dependency("activeadmin", "~> 2.8")
end
