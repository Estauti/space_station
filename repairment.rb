class Repairment

  require "thread"

  def self.define_one_from_tips first, last
    if first.has_not_repaired?
      puts "escolhido pois ainda não reparou"
      first
    elsif last.has_not_repaired?
      puts "escolhido pois ainda não reparou"
      last
    else
      puts "escolhido aleatoriamente"
      [first, last].sample      
    end
  end

  def self.dispatch_robots robots
    launched_robots = []
    threads = []
    robots.each do |robot|
      threads << Thread.new { launched_robots << robot if robot.launch }
    end
    threads.each(&:join)    
    launched_robots
  end
end