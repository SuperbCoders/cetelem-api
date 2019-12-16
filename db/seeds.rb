require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

# create dealers
# begin
#   User.delete_all
#   puts '### importing users'
#   YAML::load(File.open("./db/data/users.yaml")).each { |user| User.create(user) }
# rescue => e
#   puts 'Failed to import users'
#   puts e.message
# end
#
# # create dealers
# begin
#   Dealer.delete_all
#   puts '### importing dealers'
#   Dealer.import(YAML::load(File.open("./db/data/dealers.yaml")))
# rescue => e
#   puts 'Failed to import dealers'
#   puts e.message
# end

# create regions
begin
  Region.delete_all
  puts '### importing regions'
  data =
    CSV.parse(File.read('./db/data/regions.csv'), headers: true, col_sep: ';').
    map { |i| { name: i['Name'], code: i['Code'] } }
  Region.import(data)
rescue => e
  puts 'Failed to import regions'
  puts e.message
end


# create extra options
# begin
#   ExtraOption.delete_all
#   puts '### importing extra_options'
#   YAML::load(File.open("./db/data/extra_options.yaml")).each do |type, names|
#     ExtraOption.import(names.map { |name| { name: name, type: type } })
#   end
# rescue => e
#   puts 'Failed to import extra_options'
#   puts e.message
# end
#
# # create cars dictionary
# begin
#   Modification.delete_all
#   Complectation.delete_all
#   Model.delete_all
#   Mark.delete_all
#
#   puts '### importing all cars'
#   CarImport.call("/tmp/cars.xml")
# rescue => e
#   puts 'Failed to import cars'
#   puts e.message
# end
