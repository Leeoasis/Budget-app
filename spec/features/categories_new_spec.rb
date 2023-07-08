require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  describe 'New Category Page' do
    it 'displays the form for creating a new category' do
      visit new_category_path

      expect(page).to have_css('.navbar')
      expect(page).to have_css('.fas.fa-arrow-left')
    end
  end
end
