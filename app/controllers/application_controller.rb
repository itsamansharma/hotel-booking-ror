class ApplicationController < ActionController::Base
    before_action :authenticate_user!, :except => [:index]

	before_action :config_params, if: :devise_controller?


	def after_sign_in_path_for(resource)
       
        if current_user.roles.first.role_name == "customer"
            return allprop_path
        else 
            return properties_path
        end 
    end

	protected
  		def config_params
     		devise_parameter_sanitizer.permit(:sign_up,keys:[:name, :email, :account,:encrypted_password, :role_ids])
  		end

end