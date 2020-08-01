class Reservation < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_date_must_be_before_end_date
  validate :overlaping_reservation?

  belongs_to :guest, class_name: 'User'
  belongs_to :listing

  def start_date_must_be_before_end_date
    valid = self.start_date && self.end_date && self.start_date < self.end_date
    errors.add(:start_date, "Must before end date") unless valid
  end
  
  def duration
    return (self.end_date - self.start_date).to_i
  end
  def overlaping_reservation?
    self.listing.reservations.each do |reservation|
      if self.start_date < reservation.end_date
        return errors.add(:start_date, "This period has already booked!")
      end
      if self.end_date > reservation.start_date
        return errors.add( :end_date, "This period has already booked!")
      end
    end
  end

end
