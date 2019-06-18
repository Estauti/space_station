require "monitor"
require "json"

class Battery
  attr_reader :id
  attr_accessor :logs

  def initialize id
    @id = id
    @logs = []
    extend(MonitorMixin)    
  end

  def to_s
    "#{@id}, #{JSON.pretty_generate(@logs)}"
  end

  def lock
    try_mon_enter
  end

  def unlock
    if mon_owned?
      mon_exit
    end
  end

  def owns_this
    mon_owned?
  end

  def add_to_logs log
    @logs << log
  end
  
end