class ChatsController < ApplicationController
  # return all the responses for the response type chosen and user's stress reason and response type
  def index
    if not session[:response_type] or not session[:stress_reason]
      flash[:messages] = []
      flash[:messages].push({ 'status' => 'error', 'text' => "Please select stress reason and response type"}) 
      return redirect_to "/"
    end

    @triggers = Sensitivity.find(session[:response_type]).triggers
    @responses = Sensitivity.find(session[:response_type]).responses_given.select("content")
    @responses = @responses.map { |r| r.content }

    print "\nresponses: ", @responses, "\n\n"

    @stress_reason = Reason.where(id: session[:stress_reason].to_i).select("stress_reason").first.stress_reason
    @response_type = Sensitivity.where(id: session[:response_type]).select("level").first.level
  end

  # return a response from db associated with trigger input
  def create
    input_trigger = params[:response][:request]

    trigger = Trigger.where(content: input_trigger).first
    if trigger.present?
      json_message = { :status => "success", :message => "Response from trigger" }
    else
      json_message = { :status => "error", :message => "I do not have a response for your request. Sorry!" }
    end

    render json: json_message
  end
end
