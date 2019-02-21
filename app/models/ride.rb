class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
      return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."

    elsif self.user.tickets < self.attraction.tickets
      return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."

    elsif self.user.height < self.attraction.min_height
      return "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    end
    ticket_total = self.user.tickets - self.attraction.tickets
    self.user.update(tickets: ticket_total)

    nausea_total = self.user.nausea + self.attraction.nausea_rating
    self.user.update(nausea: nausea_total)

    happiness_total = self.user.happiness + self.attraction.happiness_rating
    self.user.update(happiness: happiness_total)
  end
end
