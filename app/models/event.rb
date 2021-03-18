class Event < ApplicationRecord

    has_many :user_events
    has_many :users, through: :user_events
    has_one_attached :image
    
    validates :title, presence: true, length: {minimum:2, maximum:12}
    validates :description, presence: true, length: {minimum:2, maximum:1000}
    validates :address, presence: true
    validates :date, presence: true
    validates :image, attached: true, content_type: %i[png jpg jpeg]

    enum status: [:proposed, :accepted, :cancel]
end
