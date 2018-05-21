class PersonPetExperiment < ApplicationRecord
    validates :height, presence: true
    validates :weight, presence: true
    attr_accessor :pet_kind
end
