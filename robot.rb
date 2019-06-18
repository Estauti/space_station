class Robot

  attr_reader :id, :name
  attr_accessor :num_repairs

  def initialize id, name, num_repairs, batteries, repair_duration = 2
    @id = id
    @name = name
    @num_repairs = num_repairs
    @batteries = batteries
    @repair_duration = repair_duration    
  end

  def to_s
    "#{@name}, #{@num_repairs}, #{@last_repair_at if @last_repair_at}"
  end

  def launch
    launched = false
    begin
      get_batteries      
      if got_all_bateries
        repair_station 
        @last_repair_at = Time.now
        @num_repairs += 1
        launched = true
      end
      unlock_batteries
      launched
    rescue StandardError => e      
      puts "deu ruim no launch do robo #{@name}"
      puts "erro: #{e.message}"  
    end
  end

  def get_batteries
    @batteries.each do |battery|
      battery.lock
      battery.add_to_logs({
        time: Time.now,
        robot: @name,
        msg: "Tried to access"
      })
    end
  end

  def got_all_bateries
    got_all = true
    @batteries.each do |battery|
      unless battery.owns_this
        got_all = false
      end
    end
    got_all
  end

  def repair_station    
    sleep @repair_duration
  end    

  def has_not_repaired?
    @num_repairs == 0
  end

  def unlock_batteries
    @batteries.each do |battery|
      battery.unlock
    end
  end

end