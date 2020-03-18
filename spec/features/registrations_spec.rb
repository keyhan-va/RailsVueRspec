require 'rails_helper.rb'

RSpec.describe Api::V1::RegistrationsController, :type => :controller do
    after(:all) do
        DatabaseCleaner.clean_with(:truncation)
    end
     user = User.create!(email: "user13@example.org", password: "password", password_confirmation: "password")
    
    describe "GET #index" do
        it "reads like a sentence (almost)" do
            get :index
            json = JSON.parse(response.body)
            expect(json['status']).to eql('SUCCESS')
            expect(response.status).to eql(200)
        end
    end


    describe "GET #show" do
        it "reads like a sentence (almost)" do
            
            get :show, params: { id: user.id }
            expect(response.status).to eql(200)
            json = JSON.parse(response.body)
            expect(json['data']['id']).to eq(user.id)
            expect(json['data']['email']).to eq(user.email)
        end
    end

    describe "GET #create" do
        it "reads like a sentence (almost)" do
            post :create, params: { user: { email: "user14@example.org", password: "password", password_confirmation: "password" } }
            json = JSON.parse(response.body)
            expect(json['status']).to eql('SUCCESS')
            expect(response.status).to eql(200)
        end
    end


    describe "GET #Update" do
        it "reads like a sentence (almost)" do
            put :update, params: { id: user.id, user: { email: "user20@example.org", password: "password1", password_confirmation: "password1" } }
            json = JSON.parse(response.body)
            expect(response.status).to eql(200)
        end
    end


end





