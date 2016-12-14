require 'rails_helper'

describe "Dashboard" do
  it "shows enrollment data for a given cohort" do
    # request going to look like get to /api/v1/enrollments/1701
    # expected json response = { fe => {enrolled: 14, maximum: 28}, be => {enrolled: 21, maximum: 28} }
    #as an authenticated user
    #when I visit the landing page
    visit '/'
    #and I click the link for cohort 1701
    click_link '1701'

    #then I see the number of seats filled in 1701 backend
    within(".backend-enrolled") do
      expect(page).to have_content('21/28 enrolled')
    end
    #and I see the number of seats filled in 1701 frontend
    within(".frontend-enrolled") do
      expect(page).to have_content('14/28 enrolled')
    end
  end
end
