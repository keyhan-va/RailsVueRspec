require 'rails_helper.rb'

RSpec.describe Api::V1::ArticlesController, :type => :controller do

    describe "GET #index" do
        it "reads like a sentence (almost)" do
            get :index
            json = JSON.parse(response.body)
            expect(json['status']).to eql('SUCCESS')
            expect(response.status).to eql(200)
        end
    end
end



RSpec.describe Api::V1::ArticlesController, :type => :controller do

    describe "GET #Show" do
        it "reads like a sentence (almost)" do
            get :show, params: { id: "1" }
            # expect(response.status).to eql(200)
            
        end
    end
end




