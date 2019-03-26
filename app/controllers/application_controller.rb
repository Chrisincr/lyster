class ApplicationController < ActionController::Base
    before_action :require_login, only: [:edit, :update, :destroy, :create, :new]

    def index
        
    end

    def require_login
        if session[:pref_url]
            redirect_to session[:prev_url], notice: 'Invalid login' unless current_user
        else
            redirect_to '/', notice: 'Invalid login' unless current_user
        end
    end



    def current_user
        if User.where(id:session[:user_id]).count <1
            session.delete(:user_id)
        end
        User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user
end
