require 'rails_helper'

RSpec.describe 'Category/Index', type: :system do
  describe 'category index page' do
    before do
      @user = User.create(name: 'Test', email: 'test2@example.com', password: 'password')
      @category1 = Category.create(name: 'test category1', icon: 'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg')
      @category2 = Category.create(name: 'test category2', icon: 'https://cdn.britannica.com/25/7125-050-67ACEC3C/Abyssinian-sorrel.jpg')

      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'user_password', with: @user.password # Assuming the password field has the ID 'user_password'
      click_button 'Log in'
    end

    it 'displays the list of categories' do
      expect(page).to have_content('test category1')
      expect(page).to have_content('test category2')
    end

    it 'displays the category icons' do
      expect(page).to have_css('img[src="https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg"]')
      expect(page).to have_css('img[src="https://cdn.britannica.com/25/7125-050-67ACEC3C/Abyssinian-sorrel.jpg"]')
    end
  end
end
