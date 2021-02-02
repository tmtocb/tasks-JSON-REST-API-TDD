require 'rails_helper'

RSpec.describe "Points API", type: :request do
  let(:user) { create(:user) }
  let!(:task) { create(:task, created_by: user.id) }
  let!(:points) { create_list(:point, 20, task_id: task.id) }
  let(:task_id) { task.id }
  let(:id) { points.first.id }
  let(:headers) { valid_headers }
                     
  describe 'GET index' do
    before { get "/tasks/#{task_id}/points", params: {}, headers: headers }

    context 'when task exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all task points' do
        expect(json.size).to eq(20)
      end
    end

    context 'when task does not exist' do
      let(:task_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Task/)
      end
    end
  end

  describe 'GET show' do
    before { get "/tasks/#{task_id}/points/#{id}", params: {}, headers: headers }

    context 'when task point exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the item' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when task point does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Point/)
      end
    end
  end

  describe 'POST create' do
    let(:valid_attributes) { { name: 'Rails', done: false }.to_json }

    context 'when request attributes are valid' do
      before { post "/tasks/#{task_id}/points", params: valid_attributes, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/tasks/#{task_id}/points", params: {}, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PUT update' do
    let(:valid_attributes) { { name: 'Laravel' }.to_json }

    before { put "/tasks/#{task_id}/points/#{id}", params: valid_attributes, headers: headers }

    context 'when point exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the point' do
        updated_point = Point.find(id)
        expect(updated_point.name).to match(/Laravel/)
      end
    end

    context 'when the item does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Point/)
      end
    end
  end

  describe 'DELETE destroy' do
    before { delete "/tasks/#{task_id}/points/#{id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
