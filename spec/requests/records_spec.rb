require 'rails_helper'

RSpec.describe RecordsController, type: :request do
  before(:each) do
    @user = User.create(name: 'Test', email: 'test2@example.com', password: 'password')
    @category = Category.create(name: 'Test Category')
    sign_in @user
  end

  describe 'GET #index' do
    it 'returns http success' do
      get category_records_path(@category)
      expect(response).to have_http_status(:success)
    end

    it 'assigns the category to @category' do
      get category_records_path(@category)
      expect(assigns(:category)).to eq(@category)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get new_category_record_path(@category)
      expect(response).to have_http_status(:success)
    end

    it 'assigns a new record to @record' do
      get new_category_record_path(@category)
      expect(assigns(:record)).to be_a_new(Record)
    end

    it 'assigns the category to @category' do
      get new_category_record_path(@category)
      expect(assigns(:category)).to eq(@category)
    end
  end

  describe 'POST #create' do
    let(:record_attributes) { { name: 'Test Record', amount: 10, category_ids: [@category.id] } }

    context 'with valid parameters' do
      it 'creates a new record' do
        expect do
          post category_records_path(@category), params: { record: record_attributes }
        end.to change(Record, :count).by(1)
      end

      it 'assigns the record to the current user' do
        post category_records_path(@category), params: { record: record_attributes }
        expect(assigns(:record).author).to eq(@user)
      end

      it 'redirects to the category records index' do
        post category_records_path(@category), params: { record: record_attributes }
        expect(response).to redirect_to(category_records_path(@category))
      end

      it 'sets a flash notice message' do
        post category_records_path(@category), params: { record: record_attributes }
        expect(flash[:notice]).to be_present
      end
    end
  end
end
