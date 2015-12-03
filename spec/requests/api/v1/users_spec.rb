require 'rails_helper'

describe 'Users API' do
  let(:headers){
    {
      'Accept' => 'application/vnd.example.v1'
    }
  }
  describe 'GET /api/users' do
    context 'anonymous' do
      it 'forbidden to access this resource' do
        get '/api/users', headers: headers

        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'User with any role' do
      it 'sends a list of users' do
        user = FactoryGirl.create(:user)

        headers.merge!(
          'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials(user.login, 'secret')
        )
        get '/api/users', headers: headers

        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)).to eq([{'id' => user.id, 'login' => user.login}])
      end
    end
  end

  describe 'GET /api/users/1' do
    context 'anonymous' do
      it 'forbidden to access this resource' do
      end
    end

    context 'User with any role' do
      it 'retrieves a specific user with id 1'
    end
  end

  describe 'POST /api/users' do
    context 'anonymous' do
      it 'forbidden to access this resource' do
      end
    end

    context 'User with role :admin' do
      it 'creates an user'
    end
  end

  describe 'PUT /api/users/1' do
    context 'anonymous' do
      it 'forbidden to access this resource' do
      end
    end

    context 'User with role :user' do
      it 'updates only authored user'
    end

    context 'User with role :admin' do
      it 'updates any user'
    end
  end

  describe 'DELETE /api/users/1' do
    context 'anonymous' do
      it 'forbidden to access this resource' do
      end
    end

    context 'User with role :admin' do
      it 'deletes any user'
    end
  end
end
