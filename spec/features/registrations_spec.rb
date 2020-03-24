require 'rails_helper.rb'

RSpec.describe Api::V1::RegistrationsController, :type => :controller do
    after(:all) do
        DatabaseCleaner.clean_with(:truncation)
    end
     
    
    describe "GET #index" do
        it "check the index of user response" do
            get :index
            json = JSON.parse(response.body)
            expect(json['status']).to eql('SUCCESS')
            expect(response.status).to eql(200)
        end
    end


    describe "GET #show" do
        it "check the show of user response" do
            user = User.create!(email: "user13@example.org", password: "password", password_confirmation: "password")
            get :show, params: { id: user.id }
            expect(response.status).to eql(200)
            json = JSON.parse(response.body)
            expect(json['data']['id']).to eq(user.id)
            expect(json['data']['email']).to eq(user.email)
        end
    end

    describe "Post #create" do
        it "check the create of user response" do
            post :create, params: { user: { email: "usercreate@example.org", password: "password", password_confirmation: "password" } }
            expect(response.status).to eql(200)
            json = JSON.parse(response.body)
            expect(json['status']).to eql('SUCCESS')
            expect(json['message']).to eql('Saved user')
            expect(json['data']['email']).to eq('usercreate@example.org')
  
        end
    end


    describe "Put #Update" do
     
        it "check the update of user response" do
            user = User.create!(email: "user1111@example.org", password: "password", password_confirmation: "password")
            put :update, params: { id: user.id, user: { email: "userupdated@example.org", password: "password", password_confirmation: "password" } }
            expect(response.status).to eql(200)
            json = JSON.parse(response.body)
            expect(json['status']).to eql('SUCCESS')
            expect(json['message']).to eql('Updated User')
            expect(json['data']['id']).to eq(user.id)
            expect(json['data']['email']).to eq('userupdated@example.org')

        end
    end


end





