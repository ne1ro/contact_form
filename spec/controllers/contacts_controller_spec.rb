require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  let(:user) { create :user }
  let(:contact) { Contact.new attributes_for(:contact) }

  describe 'GET #new' do
    before do
      sign_in :user, user
      get :new
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns new @contact_form' do
      expect(assigns(:contact_form)).to be_a Contact
    end

    context 'sets current user`s' do
      it '#email' do
        expect(assigns(:contact_form).email).to eq(user.email)
      end

      it '#name' do
        expect(assigns(:contact_form).name).to eq(user.name)
      end
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      before { post :create, contact: attributes_for(:contact) }

      it 'redirects to new contact form' do
        expect(response).to redirect_to(new_contact_path)
      end

      it 'assigns new @contact_form' do
        expect(assigns(:contact_form)).to be_a Contact
      end
    end
  end

  context 'with invalid params' do
    before { post :create, contact: { email: user.email } }

    it 'returns http unprocessable_entity status' do
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'render form anew' do
      expect(response).to render_template(:new)
    end
  end
end
