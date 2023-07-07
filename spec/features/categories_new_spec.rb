require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  describe 'New Category Page' do
    it 'displays the form for creating a new category' do
      visit new_category_path

      expect(page).to have_css('.form-container')
      expect(page).to have_css('.navbar')
      expect(page).to have_css('.navbar-brand', text: 'New Category')
      expect(page).to have_css('.navbar-right')
      expect(page).to have_css('.fas.fa-arrow-left')
      expect(page).to have_css('.navbar-form')
      expect(page).to have_css('form')
      expect(page).to have_css('label[for="category_name"]')
      expect(page).to have_css('input#category_name')
      expect(page).to have_css('label[for="category_icon"]')
      expect(page).to have_css('input#category_icon')
      expect(page).to have_button('Save', class: 'btn btn-primary')
    end
  end
end
