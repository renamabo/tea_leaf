require 'rails_helper'

RSpec.describe 'create subscription endpoint', type: :request do
    describe 'happy path' do
        it 'can create a subscription', :vcr do
            body = {
                    "subscription_id": 2,
                    "first_name": "dane",
                    "last_name": "brophy",
                    "email": "dbrophy@cats.biz",
                    "address": "101 Generic Drive, Ware, CO"
            }

            headers = { 'CONTENT_TYPE': 'application/json', "Accept": 'application/json' }

            post '/api/v1/subscriptions', headers: headers, params: body, as: :json

            expect(response).to be_successful
            expect(response.status).to eq(201)
        end
    end
end