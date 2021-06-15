# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join("public", "locations.csv"))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  loc = Location.new(name: row[1], city: row[2])
  loc.save
end

csv_text = File.read(Rails.root.join("public", "technicians.csv"))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  t = Technician.new(name: row[1])
  t.save
end

csv_text = File.read(Rails.root.join("public", "work_orders.csv"))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  w = WorkOrder.new(technician_id: row[1], location_id: row[2], time: row[3], duration: row[4], price: row[5])
  w.save
end
