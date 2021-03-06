class SessionsController < ApplicationController

    def new
    end

    def create
        # binding.pry
        @user = User.find_by({email: params[:email]})

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            puts session
            redirect_to "/users/#{session[:user_id]}/jobs"
        else
            redirect_to root_path
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end

end