require 'rails_helper.rb'

RSpec.describe Api::V1::ArticlesController, :type => :controller do

    article = Article.create(title: 'test', body: 'test')


    describe "GET #index" do
        it "reads like a sentence (almost)" do
            get :index
            json = JSON.parse(response.body)
            expect(json['status']).to eql('SUCCESS')
            expect(response.status).to eql(200)
        end
    end

    describe "GET #Show" do
        it "reads like a sentence (almost)" do
            get :show, params: { id: article.id }
            expect(response.status).to eql(200)
            json = JSON.parse(response.body)
            expect(json['data']['id']).to eq(article.id)
            expect(json['data']['title']).to eq(article.title)
            expect(json['data']['body']).to eq(article.body)
        end
    end

    

    describe "GET #Update" do
        it "reads like a sentence (almost)" do
            put :update, params: { id: article.id, article: { title: "new title", body: "new content" } }
            json = JSON.parse(response.body)
            expect(json['status']).to eql('SUCCESS')
            expect(response.status).to eql(200)
        end
    end

    describe "GET #create" do
        it "reads like a sentence (almost)" do
            post :create, params: { article: { title: "new title", body: "new content" } }
            json = JSON.parse(response.body)
            expect(json['status']).to eql('SUCCESS')
            expect(response.status).to eql(200)
        end
    end
    

   

    describe "GET #destroy" do
        it "reads like a sentence (almost)" do
            get :destroy, params: { id: article.id }
            expect(response.status).to eql(200)
            json = JSON.parse(response.body)
            expect(json['status']).to eql('SUCCESS')
            expect(response.status).to eql(200)
        end
    end


    



    





    


end





