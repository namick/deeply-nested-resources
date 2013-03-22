require 'spec_helper'

feature "Nested resources have obfuscated ids" do

  scenario "Create, update and destroy a publisher" do
    visit publishers_path
    click_on "New Publisher"
    fill_in "Name", with: "Obfuscation Magazines"
    click_on "Create Publisher"

    page.current_url.should == "http://www.example.com/publishers/7158896520"
    page.should have_content("Publisher was successfully created.")
    page.should have_content("Obfuscation Magazines")

    click_on "Edit"
    fill_in "Name", with: "Obfuscation Magazines, Inc."
    click_on "Update Publisher"

    page.should have_content("Publisher was successfully updated.")
    page.should have_content("Obfuscation Magazines, Inc.")

    visit publishers_path
    click_on "Destroy"

    page.should_not have_content("Obfuscation Magazines, Inc.")
    page.current_url.should == "http://www.example.com/publishers"
  end

  scenario "Create, update and destroy a magazine" do
    publisher = Publisher.create name: "Obfuscation Magazines, Inc."

    visit publisher_magazines_path(publisher)
    click_on "New Magazine"
    fill_in "Name", with: "Obfuscate"
    click_on "Create Magazine"

    page.current_url.should == "http://www.example.com/publishers/7158896520/magazines/9371142008"
    page.should have_content("Magazine was successfully created.")
    page.should have_content("Obfuscate")

    click_on "Edit"
    fill_in "Name", with: "Obfuscate Monthly"
    click_on "Update Magazine"

    page.should have_content("Magazine was successfully updated.")
    page.should have_content("Obfuscate Monthly")

    visit publisher_magazines_path(publisher)
    click_on "Destroy"

    page.should_not have_content("Obfuscate Monthly")
  end

  scenario "Create, update and destroy a photo" do
    publisher = Publisher.create name: "Obfuscation Magazines, Inc."
    magazine = Magazine.create name: "Obfuscate Monthly"

    visit publisher_magazine_photos_path(publisher, magazine)
    click_on "New Photo"
    fill_in "Name", with: "obfuscate.png"
    click_on "Create Photo"

    page.current_url.should == "http://www.example.com/publishers/7158896520/magazines/9371142008/photos/1746845325"
    page.should have_content("Photo was successfully created.")
    page.should have_content("obfuscate.png")

    click_on "Edit"
    fill_in "Name", with: "obfuscate_id.png"
    click_on "Update Photo"

    page.should have_content("Photo was successfully updated.")
    page.should have_content("obfuscate_id.png")

    visit publisher_magazine_photos_path(publisher, magazine)
    click_on "Destroy"

    page.should_not have_content("obfuscate_id.png")
  end
end
