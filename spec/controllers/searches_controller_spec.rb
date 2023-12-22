require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  let(:user_query) { create(:user_query) }

  describe 'GET #index' do
    it 'renders the :index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new search query' do
        expect {
          post :create, params: { search_query: { query: 'your_query_here' } }
        }.to change(UserQuery, :count).by(1)
      end

      it 'redirects to the searches index page' do
        post :create, params: { search_query: { query: 'your_query_here' } }
        expect(response).to redirect_to(searches_path)
      end
    end

  end
end
