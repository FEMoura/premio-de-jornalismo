class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]
  prepend_before_action :logged?, except: [:destroy]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  def logged?
    if !current_user==nil?
      redirect_to restrict_proposals_path
    end
  end

protected
  def after_sign_in_path_for(resource)
    restrict_proposals_url
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
