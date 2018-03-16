class PagesController < ApplicationController

before_action :set_i18n_locale_from_params

layout "pages.html.erb"

def show
render template: "pages/#{params[:page]}"
end

def about
end


 before_action :authorize
# ...
protected

    def authorize
        unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please log in"
        end
    end

    def set_i18n_locale_from_params
        if params[:locale]
        if I18n.available_locales.map(&:to_s).include?(params[:locale])
            I18n.locale = params[:locale]
        else
            flash.now[:notice] =
            "#{params[:locale]} translation not available"
            logger.error flash.now[:notice]
        end
        end
    end    


  private
  def set_date_loaded
    @date_loaded = Time.now
  end
end