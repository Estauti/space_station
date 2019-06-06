require_relative 'repairment'
require_relative 'robot'
require_relative 'battery'

batteries = [
  Battery.new(1),
  Battery.new(2),
  Battery.new(3),
  Battery.new(4)
]

robots = [
  # Robot.new id, name, num_repairs, batteries
  Robot.new(1, "R1", 0, [ batteries[0] ]),
  Robot.new(2, "R2", 0, [ batteries[0], batteries[1] ]),
  Robot.new(3, "R3", 0, [ batteries[1], batteries[2] ]),
  Robot.new(4, "R4", 0, [ batteries[2], batteries[3] ]),
  Robot.new(5, "R5", 0, [ batteries[3] ])
]

puts robots
counter = 1

while true do   

  puts ""
  puts "EXECUÇÃO NÚMERO ##{counter}"


  puts "==== Robô da Ponta ===="
  robot_from_tip = Repairment.define_one_from_tips(robots.first, robots.last)  
  puts robot_from_tip
  puts ""

  remaining_robots = robots[1..-2]
  remaining_robots << robot_from_tip
  puts "==== Robôs Permitidos ===="
  puts remaining_robots.sort!{ |a,b| a.id <=> b.id }
  puts ""

  dispatched_robots = Repairment.dispatch_robots remaining_robots
  puts "==== Robôs Enviados ===="
  puts dispatched_robots
  puts ""

  puts "==== Após Manutenção ===="
  puts robots

  counter += 1
end