class ApplicationPet < ApplicationRecord
    belongs_to :application 
    belongs_to :pet 
    def self.update_helper(app, pet)
        where(application_id: app, pet_id: pet).first
    end
end