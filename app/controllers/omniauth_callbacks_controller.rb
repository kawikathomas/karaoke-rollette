class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    user = User.from_omniaauth.env["omniauth.auth"]
  end

  alias_method :facebook, :all
end
