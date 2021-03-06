class ApplicationController < ActionController::API
    include Knock::Authenticable
    include ActionController::Cookies
    include ActionController::RequestForgeryProtection
    protect_from_forgery with: :exception
    before_action :set_csrf_cookie
    skip_before_action :verify_authenticity_token

    private

        def set_csrf_cookie
            cookies["CSRF-TOKEN"] = form_authenticity_token
        end

end
