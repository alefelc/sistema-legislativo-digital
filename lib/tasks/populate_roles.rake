namespace :roles do
  desc "Cargar roles dentro de la DB"
  task migrate: :environment do
    puts "Adding roles"
    Roles::Activity.activities_with_name.each do |role|
      title = role[:title]
      activities = role[:activities].collect { |x| x[:activity] }
      Role.create name: title, activities: activities
      print "."
    end
    puts " - - - - - - - - - - - - - - - Roles added successfully!!"
  end
end
