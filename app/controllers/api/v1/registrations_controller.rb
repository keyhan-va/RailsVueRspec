module Api
    module V1
        class RegistrationsController < ApplicationController
            skip_before_action :verify_authenticity_token
            def index
                user =User.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'Loaded user', data:user},status: :ok
            end


            def show
                user = User.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded user', data:user},status: :ok
            end
 

            def create
                #binding.pry
                user = User.new(user_params)
                if user.save
                    render json: {status: 'SUCCESS', message: 'Saved user', data:user},status: :ok
                else
                    render json: {status: 'ERROR', message: 'User not saved', data:user.errors},status: :unprocessable_entity
                end
            end


            def update
                user = User.find(params[:id])
                if user.update(user_params)
                    render json: user, status: 200
                else
                    render json: { errors: user.errors}, status: 422
                end
            end


            private
            
            def user_params
                params.require(:user).permit(:email, :password, :password_confirmation)
            end
        end
    end
end