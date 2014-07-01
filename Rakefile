ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

# Type `rake -T` on your command line to see the available rake tasks.
# seed the db
task :seed => :environment do

  pigeon_list = {
    "Theo" => {
      :color => ["purple", "grey"],
      :gender => "male",
      :lives => "Subway"
    },
    "Peter Jr." => {
      :color => ["purple", "grey"],
      :gender => "male",
      :lives => "Library"
    },
    "Lucky" => {
      :color => ["purple"],
      :gender => "male",
      :lives => "City Hall"
    },
    "Ms .K" => {
      :color => ["grey", "white"],
      :gender => "female",
      :lives => "Central Park"
    },
    "Queenie" => {
      :color => ["white", "brown"],
      :gender => "female",
      :lives => "Subway"
    },
    "Andrew" => {
      :color => ["white"],
      :gender => "male",
      :lives => "Central Park"
    },
    "Alex" => {
      :color => ["white", "brown"],
      :gender => "male",
      :lives => "Central Park"
    }
  }

  pigeon_list.each do |name, pigeon_hash|
    p = Pigeon.new
    p.name = name
    pigeon_hash.each do |attribute, value|
      if attribute == :color
        p[attribute] = value.join(", ")
      else
        p[attribute] = value
      end
    end
    p.save
  end

end

#reset
task :reset => :environment do
  Pigeon.destroy_all
  ActiveRecord::Base.connection.execute("DROP TABLE IF EXISTS pigeons")
end

#run server
task :server => :environment do
  `bundle exec shotgun`
end