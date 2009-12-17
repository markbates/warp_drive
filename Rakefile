require 'rubygems'
require 'gemstub'

Gemstub.test_framework = :rspec

Gemstub.gem_spec do |s|
  s.email = 'mark@markbates.com'
  s.homepage = 'http://www.metabates.com'
  s.description = %{Screw Rails Engines! Why not install a Warp Drive! Completely bundle up an ENTIRE Rails application into a gem, then load it into another application! It's that easy!}
  s.version = "0.1.11"
  s.rubyforge_project = "magrathea"
  s.add_dependency('configatron')
  s.add_dependency('genosaurus')
  s.executables << 'warpify'
  s.executables << 'install_warp_drive'
end

Gemstub.rdoc do |rd|
  rd.title = "Warp Drive"
end
