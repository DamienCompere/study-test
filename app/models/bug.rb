class Bug < ApplicationRecord
    enum :state => [:open, :assignated, :closed]
    enum :severity => [:trivial, :low, :medium, :high, :critical]
    #make the description and title mandatory
    validates_presence_of :title
    validates_presence_of :description
end
