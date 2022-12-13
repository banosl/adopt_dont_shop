require 'rails_helper'

RSpec.describe 'Admin Show Spec' do
  before :each do
    @shelter1 = Shelter.create!(foster_program: true, name: 'Denver Animal Shelter', city: 'Denver', rank: 1)
    @shelter2 = Shelter.create!(foster_program: false, name: 'Charlotte Dog Catchers', city: 'Charlotte', rank: 12)

    @pet1 = Pet.create!(adoptable: true, age: 3, breed: 'dog', name: 'Luca', shelter_id: @shelter1.id)
    @pet2 = Pet.create!(adoptable: true, age: 15, breed: 'dog', name: 'Sebastian', shelter_id: @shelter1.id)
    @pet3 = Pet.create!(adoptable: true, age: 5, breed: 'cat', name: 'Charles', shelter_id: @shelter1.id)

    @pet4 = Pet.create!(adoptable: false, age: 12, breed: 'dog', name: 'Paul', shelter_id: @shelter1.id)
    @pet5 = Pet.create!(adoptable: true, age: 5, breed: 'cat', name: 'Maggie', shelter_id: @shelter2.id)

    @application1 = Application.create!(last: 'Banos', first: 'Leo', street: '123 1st St', city: 'Denver', state: 'CO',
                                        zip: '24135', description: 'I am good parent', status: 'Pending')
    @application2 = Application.create!(last: 'Lampke', first: 'William', street: '456 2nd St', city: 'Charlotte',
                                        state: 'NC', zip: '24451', description: 'I am great parent', status: 'Pending')

    @application3 = Application.create!(last: 'fake', first: 'iam', street: '123 1st St', city: 'Denver', state: 'CO',
                                        zip: '24135', description: 'I am good parent', status: 'In Progress')

    @ap1 = ApplicationPet.create!(application_id: @application1.id, pet_id: @pet1.id, status: nil)
    @ap2 = ApplicationPet.create!(application_id: @application2.id, pet_id: @pet2.id, status: nil)
  end
  describe 'approve buttons' do
    it 'can approve a pet and update it to say approved ' do
      visit "/admin/applications/#{@application1.id}"
      click_on 'Approve'
      expect(page).to have_content('Approved')
    end
  end
  describe 'reject buttons' do
    it 'can reject a pet and update it to say rejected' do
      visit "/admin/applications/#{@application1.id}"
      click_on 'Reject'
      expect(page).to have_content('Rejected')
    end
  end

  describe "approving/denying one applications pet does not affect other applications" do
    it "checks application 2 doesn't refer to the accepted pet on application1" do

      @ap3 = ApplicationPet.create!(application_id: @application3.id, pet_id: @pet1.id, status: nil)
      visit "/admin/applications/#{@application1.id}"
      click_on 'Approve'
      visit "/admin/applications/#{@application3.id}"

      expect(page).to have_content("Luca")
      expect(page).to have_button("Approve")
      expect(page).to have_button("Reject")

    end
  end
end
