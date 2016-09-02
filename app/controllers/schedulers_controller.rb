class SchedulersController < ApplicationController
  before_action :set_secheduler, only: [:show, :edit, :update, :destroy]
  require 'rubygems'
  require 'rufus-scheduler'



  # GET /schedulers
   def index
    # scheduler = Rufus::Scheduler.new
    # scheduler.every '5s' do
    #    Scheduler.reminder


  end

  # def index
  #   @schedulers = Scheduler.all
  #   if @schedulers.length == 0
  #     flash[:alert] = "You have no reminders. Create one now to get started."
  #   end
  # end

  # GET /schedulers/1
  def show
  end

  # GET /schedulers/new
  def new
    @scheduler = Scheduler.new
    @min_date = DateTime.now
  end

  # GET /schedulers/1/edit
  def edit
  end

  # POST /schedulers
  def create
    flash[:messages] =[]
    @scheduler = Scheduler.new(scheduler_params)
      if @scheduler.save
        flash[:messages].push({ 'status' => 'success', 'text' => "Reminder was successfully created!"  })
        redirect_to :back
      else
      errors = @scheduler.errors.full_messages
      errors.each do |error|
        flash[:messages].push({ 'status' => 'error', 'text' => error })
      end
      redirect_to :back
    end
  end

  def schedule


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # See above ---> before_action :set_secheduler, only: [:show, :edit, :update, :destroy]
    def set_secheduler
      @scheduler = scheduler.find(params[:id])
    end


    def scheduler_params
      params.require(:scheduler).permit(:phone, :frequency)
    end
end
