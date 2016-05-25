# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

yosemite = NationalPark.create(state: 'CA', name: 'Yosemite National Park' )

denali = NationalPark.create(state: 'AK', name: 'Denali National Park' )

big_bend = NationalPark.create(state: 'TX', name: 'Big Bend National Park' )


day_hike = HikeType.create(type: 'day')
multi_day_hike = HikeType.create(type: 'multi')

yosemite_hike_1 = Hike.create(national_park:yosemite, name: 'Half Dome', length: 16, hike_type: day_hike)

yosemite_hike_2 = Hike.create(national_park:yosemite, name: 'Vernal Falls', length: 2.4, hike_type: day_hike)


denali_hike_1 = Hike.create(national_park:denali, name: 'Horseshoe Lake', length: 3.2, hike_type: day_hike)

denali_hike_2 = Hike.create(national_park:denali, name: 'Rock Creak trail', length: 2.4, hike_type: day_hike)


big_bend_hike_1 = Hike.create(national_park:big_bend, name: 'Santa Elena Canyon', length: 22, hike_type: multi_day_hike)

big_bend_hike_2 = Hike.create(national_park:big_bend, name: 'South Rim Loop', length: 11.2, hike_type: day_hike)



