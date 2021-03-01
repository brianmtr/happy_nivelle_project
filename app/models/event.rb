class Event < ApplicationRecord

    has_many :user_events
    has_many :users, through: :user_events
    
    include ImageUploader::Attachment.new(:image)
    validates :title, presence: true
    validates :description, presence: true
    validates :address, presence: true
    validates :date, presence: true
    validates :image_data, presence: true

    enum status: [:proposed, :accepted, :past]
end
