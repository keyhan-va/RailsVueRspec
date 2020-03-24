require 'rails_helper.rb'

RSpec.describe Api::V1::ArticlesController, :type => :controller do

    
    describe "GET #index" do
        it "check the index of Article response" do
            get :index
            expect(response.status).to eql(200)
            json = JSON.parse(response.body)
            expect(json['status']).to eql('SUCCESS')
            
        end
    end


    describe "GET #Show" do
        it "check the Show of Article response" do
            article = Article.create(title: 'test', body: 'test')
            get :show, params: { id: article.id }
            expect(response.status).to eql(200)
            json = JSON.parse(response.body)
            expect(json['data']['id']).to eq(article.id)
            expect(json['data']['title']).to eq(article.title)
            expect(json['data']['body']).to eq(article.body)
        end
    end

    

    describe "GET #Update" do
        it "check the Update of Article response" do
            article = Article.create(title: 'test', body: 'test')
            put :update, params: { id: article.id, article: { title: "Updated title", body: "Updated content" } }
            expect(response.status).to eql(200)
            json = JSON.parse(response.body)
            expect(json['status']).to eql('SUCCESS')
            expect(json['data']['title']).to eq('Updated title')
            expect(json['data']['body']).to eq('Updated content')
        end
    end


    
    describe "GET #create" do
        it "check the create of Article response" do
            post :create, params: { article: { title: "new title", body: "new content" } }
            expect(response.status).to eql(200)
            json = JSON.parse(response.body)
            expect(json['status']).to eql('SUCCESS')
            expect(json['message']).to eql('Saved article')
            expect(json['data']['title']).to eq('new title')
            expect(json['data']['body']).to eq('new content')
        end
    end
    

   

    describe "GET #destroy" do
        it "check the destroy of Article response" do
            article = Article.create(title: 'test', body: 'test')
            delete :destroy, params: { id: article.id }
            expect(response.status).to eql(200)
            json = JSON.parse(response.body)
            expect(json['status']).to eql('SUCCESS')
            expect(json['message']).to eql('Deleted article')
            expect(json['data']['id']).to eq(article.id)
            expect(json['data']['title']).to eq(article.title)
            expect(json['data']['body']).to eq(article.body)
        end
    end


    



    





    


end





