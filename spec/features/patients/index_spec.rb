require 'rails_helper'

RSpec.describe 'Patients index page' do
  it 'When I visit the patients index page I see a list of all patients from oldest to youngest' do
    hospital1 = Hospital.create!(name: "Sacred Heart")
    hospital2 = Hospital.create!(name: "Pacific Northwest General Hospital")

    doctor1 = Doctor.create!(name: "Turk", specialty: "Surgery", university: "Colorado University", hospital: hospital1)
    doctor2 = Doctor.create!(name: "Carla", specialty: "Nursing", university: "New Jersey University", hospital: hospital2)

    patient1 = Patient.create!(name: 'Zola Shepherd', age: 2)
    patient2 = Patient.create!(name: 'Rebecca Pope', age: 32)
    patient3 = Patient.create!(name: 'Denny Duquette', age: 39)
    patient4 = Patient.create!(name: 'Katie Bryce', age: 24)

    doctor1.patients << patient1
    doctor1.patients << patient2
    doctor2.patients << patient3
    doctor2.patients << patient4

    visit patients_path

    page.body.index('Denny Duquette').should < page.body.index('Rebecca Pope')
    page.body.index('Rebecca Pope').should < page.body.index('Katie Bryce')
    page.body.index('Katie Bryce').should < page.body.index('Zola Shepherd')
  end
end
