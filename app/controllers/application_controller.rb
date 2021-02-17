class ApplicationController < ActionController::Base
    
    before_action :configure_devise_parameters, if: :devise_controller?
    around_action :switch_locale

    def configure_devise_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:firstname, :lastname, :email, :password, :password_confirmation) }
    end    

    
    def switch_locale(&action)
        locale = params[:locale] || I18n.default_locale
        I18n.with_locale(locale, &action)
    end

    def default_url_options
        { locale: I18n.locale }
    end

end
