class Userevent < ApplicationRecord
    belongs_to :event
    belongs_to :user

    enum state: [:yes, :maybe, :no]

end
