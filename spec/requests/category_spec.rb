require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  before :each do
    @user = User.create(name: 'Test', email: 'test2@example.com', password: 'password')
    sign_in @user
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/categories'
      expect(response).to have_http_status(:success)
    end

    it 'assigns all categories to @categories' do
      category1 = Category.create(name: 'Category 1', icon: 'icon1.jpg')
      category2 = Category.create(name: 'Category 2', icon: 'icon2.jpg')

      get '/categories'

      expect(assigns(:categories)).to match_array([category1, category2])
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/categories/new'
      expect(response).to have_http_status(:success)
    end

    it 'assigns a new category to @category' do
      get '/categories/new'
      expect(assigns(:category)).to be_a_new(Category)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new category' do
        category_params = { name: 'Category 3', icon: 'icon3.jpg' }

        expect do
          post '/categories', params: { category: category_params }
        end.to change(Category, :count).by(1)

        expect(response).to redirect_to(categories_path)
        expect(flash[:notice]).to eq('Category created successfully.')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new category' do
        category_params = { name: '', icon: 'icon3.jpg' }

        expect do
          post '/categories', params: { category: category_params }
        end.not_to change(Category, :count)

        expect(response).to render_template(:new)
      end
    end
  end
end
