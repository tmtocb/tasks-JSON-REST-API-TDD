require 'rails_helper'

RSpec.describe "V1::Tasks API", type: :request do
  let(:user) { create(:user) }
  let!(:tasks) { create_list(:task, 10, created_by: user.id) } 
  let(:task_id) { tasks.first.id }
  let(:headers) { valid_headers }

  describe 'GET /tasks' do
    before { get '/tasks', params: {}, headers: headers }
    it 'returns all tasks' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns success http code' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET show' do
    before { get "/tasks/#{task_id}", headers: headers }

    context 'when the task exists' do
      it 'returns the task' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(task_id)
      end

      it 'returns success http code' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the task does not exist' do
        let(:task_id) { 100 }

        it 'returns 404 http code' do
          expect(response).to have_http_status(404)
        end

        it 'returns a not found message' do
           expect(response.body).to match(/Couldn't find Task/)
        end
      end
    end

  describe 'POST create' do
    let(:valid_attributes) do
      { title: 'Learn Rails', created_by: '1' }.to_json
    end

    context 'when the request is valid' do
      before { post '/tasks', params: valid_attributes, headers: headers  }

      it 'creates a task' do
        expect(json['title']).to eq('Learn Rails')
      end

      it 'returns 201 http code' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { title: nil }.to_json }
      before { post '/tasks', params: invalid_attributes, headers: headers }

      it 'returns 422 http code' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message'])
          .to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  describe 'PUT update' do
    let(:valid_attributes) { { title: 'Learn RSpec' }.to_json }
    context 'when the record exists' do
      before { put "/tasks/#{task_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns 204 http code' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE destroy' do
    before { delete "/tasks/#{task_id}", params: {}, headers: headers }

    it 'returns 204 http code' do
      expect(response).to have_http_status(204)
    end
  end
end
