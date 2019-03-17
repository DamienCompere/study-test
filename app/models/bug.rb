class Bug < ApplicationRecord
    enum :state => [:open, :assignated, :closed]

    validates_presence_of :title
    validates_presence_of :description
end
