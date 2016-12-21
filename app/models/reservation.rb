class Reservation < ApplicationRecord
  belongs_to :user

  def start_time
     self.slot
  end
  def name
    self.eventname
  end

end
