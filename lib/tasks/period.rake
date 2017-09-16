namespace :periods do
  desc "Fill periods"
  task migrate: :environment do
  	puts "Adding periods...."
    Periodo.create desde: "Mon, 02 Jul 2012", hasta: "Fri, 01 Jul 2016"
    print "."
    Periodo.create desde: "Sat, 02 Jul 2016", hasta: "Thu, 02 Jul 2020"
  	print "."
  	puts "\n - - - - - - - - - - - - - - Periods added succesfully! \n"
  end
end
