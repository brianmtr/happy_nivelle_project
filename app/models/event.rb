class Event < ApplicationRecord
    acts_as_votable
    include ImageUploader::Attachment.new(:image)
    validates :title, presence: true
    validates :description, presence: true
    validates :adress, presence: true
    validates :date, presence: true
    validates :image_data, presence: true

    enum status: [:proposed, :accepted, :past]
end
