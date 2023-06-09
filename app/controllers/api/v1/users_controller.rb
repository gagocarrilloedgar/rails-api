module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: [:show, :update, :destroy]

      def index
        @users = UserRepository.all
        render json: @users
      end

      def show
        render json: @user
      end

      def create
        @user = UserRepository.create(user_params)
        if @user.persisted?
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def update
        if UserRepository.update(@user, user_params)
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def destroy
        UserRepository.destroy(@user)
        head :no_content
      end

      private

      def set_user
        @user = UserRepository.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:name, :email)
      end
    end
  end
end
