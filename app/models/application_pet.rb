class ApplicationPet < ApplicationRecord
    belongs_to :application 
    belongs_to :pet 

    def self.pending
      joins(:application).where(status: "Pending")
    end
end