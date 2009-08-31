require 'rubygems'
require 'gemstub'

Gemstub.test_framework = :rspec

Gemstub.gem_spec do |s|
  # s.version = "0.0.1"
  # s.rubyforge_project = "warp_drive"
  s.add_dependency('configatron')
  s.add_dependency('genosaurus')
  s.executables << 'warpify'
  s.executables << 'install_warp_drive'
end

Gemstub.rdoc do |rd|
  rd.title = "warp_drive"
end
