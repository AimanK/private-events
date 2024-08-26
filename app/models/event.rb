class Event < ApplicationRecord
    has_many :attendances
    has_many :attendees, through: :attendances, source: :user

    belongs_to :creator, class_name: "User"

    scope :past, -> { where('date < ?', Date.today) }

    scope :future, -> { where('date >= ?', Date.today) }


end
