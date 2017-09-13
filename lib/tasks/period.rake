namespace :fill do
  desc "Fill periods"
  task periods: :environment do
    Periodo.create desde: "Mon, 02 Jul 2012", hasta: "Fri, 01 Jul 2016"
    Periodo.create desde: "Sat, 02 Jul 2016", hasta: "Thu, 02 Jul 2020"
  end
end
