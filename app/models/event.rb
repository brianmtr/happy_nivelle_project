class Event < ApplicationRecord

    has_many :userevent
    has_many :user, through: :userevent
    
    include ImageUploader::Attachment.new(:image)
    validates :title, presence: true
    validates :description, presence: true
    validates :adress, presence: true
    validates :date, presence: true
    validates :image_data, presence: true

    enum status: [:proposed, :accepted, :past]
end
