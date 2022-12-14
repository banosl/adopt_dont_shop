class ApplicationPet < ApplicationRecord
  belongs_to :application
  belongs_to :pet
  def self.update_helper(app, pet)
    where(application_id: app, pet_id: pet).first
  end

  def self.status_check(ap_list, ap_id, total)
    count = where(status: true, application_id: ap_id).length
    if (count / total) == 1
        app = Application.find(ap_id)
        app.update(status: 'Approved')      
    end
    if (count / total) != 1
        app = Application.find(ap_id)
        app.update(status: 'In Progress')      
    end
  end
end
