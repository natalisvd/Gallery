require "spec_helper"

describe "categories/index.html.haml" do
  let(:user) { FactoryGirl.create(:user) }

  it "displays all the categories ", :js => true do
       Category.create!(name: 'Ruby')
       visit categories_path
       fill_in "Email", :with => "aa@bb.c"
       fill_in "Password", :with => "1234567890"
       click_button "Sign in"
       page.should have_content("Signed in successfully.")
       page.should have_content("Ruby")
       sleep(10)
  end

end