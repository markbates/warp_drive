namespace :enterprise do
  
  namespace :weapons do
    
    desc 'Fire!'
    task :fire => :environment do
      puts 'FIRE!!'
    end
    
  end
  
end