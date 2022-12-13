class Admin::ApplicationsController < ApplicationController
    def show 
        @application = Application.find(params[:id])
    end
    def update
        application = Application.find(params[:id])
        if params[:approve] != nil
            pet = Pet.find(params[:approve])
            ap = ApplicationPet.update_helper(application.id, pet.id)
            ap.update(status: true)
            redirect_to "/admin/applications/#{application.id}"
        elsif params[:reject] != nil
            pet = Pet.find(params[:reject])
            ap = ApplicationPet.update_helper(application.id, pet.id)
            ap.update(status: false)
            redirect_to "/admin/applications/#{application.id}"
        end
    end
end