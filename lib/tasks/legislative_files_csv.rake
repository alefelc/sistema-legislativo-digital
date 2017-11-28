require 'csv'
require 'rake'

namespace :migrate do
  task :legislative_files_csv => :environment do
    csv_text = File.read('lib/tasks/legislative_files.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      index = row[0]
      number = row[1]
      bis = row[2]
      year = row[3]
      topic = row[4]
      # observation = row[5]
      # acum = row[6]
      # adj_fis = row[7]
      # n = row[8]
      # lalo = row[9]

      file = LegislativeFileService.new({number: number, bis: bis, year: year, topic: topic})
      if file.save!
        print "."
      else
        puts "error #{file.errors}"
      end
    end

    puts "\n Legislative files migrated successfully \n"
  end
end
