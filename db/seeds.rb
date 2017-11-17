# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..6).each do |i|
  (1..6).each do |j|
    WeekPeriod.create do |s|
      s.week_num= i
      s.period_num = j
    end
  end
end

dids = [357,391,361,363,393,364,373,367,379,372,368,370]
rids = [936,143,544,100,92,1,1,235,21,174,5,2]


(0..11).each do |i|
  IdOfBulletinboard.create do |s|
    s.did = dids[i]
    s.rid = rids[i]
  end
end
