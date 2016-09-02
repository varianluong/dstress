class StressesController < ApplicationController
  before_action :require_login, only: [:index, :create]

  def index
    @reasons = Reason.all
    @sensitivities = Sensitivity.all
  end

  # save the stress reason and response type in session
  def create
    flash[:messages] = []
    puts "create"

    if params[:stress][:reason].present? and params[:stress][:response_type].present?
        session[:stress_reason] = params[:stress][:reason]
        session[:response_type] = params[:stress][:response_type]

        redirect_to "/solutions"
    else
      if not params[:stress][:reason].present?
        flash[:messages].push({ 'status' => 'error', 'text' => 'Reason cannot be blank.' })
      end
      if not params[:stress][:response_type].present?
        flash[:messages].push({ 'status' => 'error', 'text' => 'Response type cannot be blank.' })
      end
      redirect_to "/"
    end
  end

  def emergency
    @url ="http://maps.googleapis.com/maps/api/js?key=#{Figaro.env.GOOGLE_HOTLINE_KEY}&v=3.exp&libraries=places"
  end
  
  private

  # sanitize parameters
  def stress_params
    params.require(:stress).permit(:reason, :response_type)
  end
end
