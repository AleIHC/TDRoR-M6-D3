class ApplicationController < ActionController::Base

    protected
    
    def authorize_request(kind = nil)
        unless kind.include?(current_cc_user.role)
            redirect_to cc_posts_path, notice: "No estás autorizado"
        end
    end

    #Dirección para redirigir al logearse
    def after_sign_in_path_for(resource)
        cc_posts_path
    end
end
