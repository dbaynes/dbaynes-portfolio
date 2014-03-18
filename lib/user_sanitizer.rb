class User::ParameterSanitizer < Devise::ParameterSanitizer
    private
    def account_update
        default_params.permit(:email, :password, :role, :password_confirmation, :current_password)
    end
    def account_create
        default_params.permit(:email, :password, :role, :password_confirmation, :current_password)
    end

end