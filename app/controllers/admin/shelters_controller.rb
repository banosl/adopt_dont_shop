class Admin::SheltersController < ApplicationController
    def index
      @shelters = Shelter.reverse_alphabetical
      @pending_shelters = ApplicationPet.pending
    end
end