module SessionsHelper
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      end
    
      def authorize
        redirect_to '/login' unless current_user
      end

      def logged_in?
        !current_user.nil?
      end

      def admin?
		if logged_in?
			current_user.admin?
		else
			return false
		end
	end
end
