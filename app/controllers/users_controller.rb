class UsersController < ApplicationController
    def show
      @user = User.find(params[:id]) 
    end

    #def Calender
    #  @calenders = @user.calenders.includes(:logo)
    #end

    private

    def user_params
        params.require(:user).permit(:name, :profile, :image)
    end

end