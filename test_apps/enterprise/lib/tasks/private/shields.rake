namespace :enterprise do
  
  namespace :shields do
    
    desc 'Shield Status'
    task :status => :environment do
      puts 'Shields are UP!'
    end
    
  end
  
end