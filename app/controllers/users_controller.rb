# UsersController
class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        # debugger
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        respond_to do |f|
            if @user.save
                # Sccuess
                # flash[:success] = 'Welcome to the Sample App!'
                f.html { redirect_to @user, notice: 'User was successfully created.' }
                f.json { render :show, status: :created, location: @user }
            else
                f.html { render :new, status: :unprocessable_entity }
                f.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password,
                                     :password_confirmation)
    end
end
