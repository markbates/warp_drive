# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{warp_drive}
  s.version = "0.1.5.20090903142132"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["markbates"]
  s.date = %q{2009-09-03}
  s.description = %q{Screw Rails Engines! Why not install a Warp Drive! Completely bundle up an ENTIRE Rails application into a gem, then load it into another application! It's that easy!}
  s.email = %q{mark@markbates.com}
  s.executables = ["warpify", "install_warp_drive"]
  s.extra_rdoc_files = ["README", "LICENSE"]
  s.files = ["lib/tasks/compile.rake", "lib/warp_drive/boot/method_list.rb", "lib/warp_drive/boot/migration_override.rb", "lib/warp_drive/boot/procs.rb", "lib/warp_drive/boot/rails_init.rb", "lib/warp_drive/boot/workers.rb", "lib/warp_drive/boot.rb", "lib/warp_drive/configure.rb", "lib/warp_drive/path.rb", "lib/warp_drive/tasks.rb", "lib/warp_drive/templates/lib/%=app%/boot.rb.template", "lib/warp_drive/templates/lib/%=app%/tasks.rb.template", "lib/warp_drive/templates/lib/%=app%.rb.template", "lib/warp_drive/templates/LICENSE.template", "lib/warp_drive/templates/Rakefile.template", "lib/warp_drive/templates/README.template", "lib/warp_drive/warp_drive_gem_generator.rb", "lib/warp_drive.rb", "README", "LICENSE", "bin/warpify", "bin/install_warp_drive"]
  s.homepage = %q{http://www.metabates.com}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{magrathea}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{warp_drive}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<configatron>, [">= 0"])
      s.add_runtime_dependency(%q<genosaurus>, [">= 0"])
    else
      s.add_dependency(%q<configatron>, [">= 0"])
      s.add_dependency(%q<genosaurus>, [">= 0"])
    end
  else
    s.add_dependency(%q<configatron>, [">= 0"])
    s.add_dependency(%q<genosaurus>, [">= 0"])
  end
end
