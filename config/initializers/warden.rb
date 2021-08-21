Rails.application.config.middleware.use Warden::Manager do |manager|
  manager.default_strategies :password_form
end

Warden::Strategies.add(:password_form) do
  def authenticate!
    auth = AuthenticationService.new(params)

    if auth.authenticated?
      success! auth.user
    else
      fail! "Invalid email or password"
    end
  end
end

Warden::Manager.after_set_user do |user, auth|
  auth.cookies.signed.permanent[:auth_token] = user.auth_token
  Current.user = user
end

Warden::Manager.before_logout do |_user, auth|
  auth.cookies.delete(:auth_token)
  Current.user = nil
end

module Warden
  class SessionSerializer
    def serialize(user)
      [user.class.name, user.auth_token]
    end

    def deserialize(key)
      klass, auth_token = key
      klass = case klass
              when Class
                klass
              when String, Symbol
                klass.to_s.classify.constantize
              end

      klass.find_by(auth_token: auth_token)
    end
  end

  module Mixins
    module Common
      def request
        @request ||= ActionDispatch::Request.new(env)
      end

      def reset_session!
        request.reset_session
      end

      def cookies
        request.cookie_jar
      end
    end
  end
end
