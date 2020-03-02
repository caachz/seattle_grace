require 'rails_helper'

RSpec.describe 'Doctors show page' do
  describe 'When I visit the doctors show page I see the following info' do
    hospital1 = Hospital.create!(name: "Sacred Heart")
    hospital1 = Hospital.create!(name: "Pacific Northwest General Hospital")

    doctor1 = Doctor.create!(name: "Turk", specialty: "Surgery", university: "Colorado University", hospital: hospital1)
    doctor2 = Doctor.create!(name: "Carla", specialty: "Nursing", university: "New Jersey University", hospital: hospital2)

    patient1 = Patient.create!(name: 'Zola  Shepherd', age: 2)
    patient1 = Patient.create!(name: 'Rebecca Pope', age: 32)
    patient1 = Patient.create!(name: 'Denny Duquette', age: 39)

    doctor1.patients << patient1
    doctor1.patients << patient2
    doctor2.patients << patient3

    visit "/doctors/#{doctor1.id}"

    expect(page).to have_content("Turk")
    expect(page).to have_content("Surgery")
    expect(page).to have_content("Colorado University")
    expect(page).to have_content("Sacred Heart")
    expect(page).to have_content("Zola  Shepherd")
    expect(page).to have_content("Rebecca Pope")

    expect(page).to_not have_content("Carla")
    expect(page).to_not have_content("Nursing")
    expect(page).to_not have_content("New Jersey University")
    expect(page).to_not have_content("Pacific Northwest General Hospital")
    expect(page).to_not have_content("Denny Duquette")
  end
end