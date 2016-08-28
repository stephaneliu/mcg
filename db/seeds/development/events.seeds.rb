near_future = Event.create!(name: 'School Performance', description: 'Perform at general assembly',
                            starts: 36.hours.from_now, ends: 37.hours.from_now)
puts "Created event: #{near_future.name}"

next_week = Event.create!(name: 'Practice Session',
                          description: 'Meet at the gym. Remember your water',
                          starts: 1.week.from_now)
puts "Created event: #{next_week.name}"

next_spring = Event.create!(name: 'WGI', description: 'Kill it',
                            starts: DateTime.new(2017, 4, 20, 18, 00).in_time_zone,
                            ends: DateTime.new(2017, 4, 25, 10, 00).in_time_zone)
puts "Created event: #{next_spring.name}"
