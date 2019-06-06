require "monitor"

class Battery
  attr_reader :id

  def initialize id
    @id = id
    extend(MonitorMixin)    
  end

  def to_s
    "#{@id}"
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
  
end