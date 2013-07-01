class GroupGenerator < Rails::Generators::NamedBase
  
  desc "This groups all users into a group"
  source_root File.expand_path("../templates", __FILE__)
  argument :org_class, :type => :string, :default => "organization"
   

  def generate_group 
    puts "add #{org_class}_id as a has_many to #{file_name}'s class"
    
    insert_into_file "app/models/#{file_name}.rb", :after => "class #{file_name.capitalize} < ActiveRecord::Base" do
      "\n  belongs_to :#{org_class}\n\n"
    end 
   
    run("rails g migration add_#{org_class}_to_#{file_name}s #{org_class}_id:integer")
    
    generate "scaffold", "#{org_class}s name:string contact_id:integer"

    rake "db:migrate" 
    
    insert_into_file "app/models/#{org_class}.rb", :after => "class #{org_class.capitalize} < ActiveRecord::Base" do
      "\n  has_many :#{file_name}s\n\n"
    end 

    route "resources :#{org_class}s do resources :#{file_name}s end"
  end
end
