# frozen_string_literal: true

# class ApplicationController < ActionController::Base
class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = t :not_authorized
    redirect_to(request.referer || root_path)
  end
end
