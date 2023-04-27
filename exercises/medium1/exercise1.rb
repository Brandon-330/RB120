class Machine
  attr_writer :switch

  def start
    flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  private

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

Machine.new.stop