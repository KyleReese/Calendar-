class EventclassesController < ApplicationController
  before_action :set_eventclass, only: [:show, :edit, :update, :destroy]

  # GET /eventclasses
  def index
  end

  # GET /eventclasses/1
  def show
    @eventclass = Eventclass(params[:id])
  end

  # GET /eventclasses/new
  def new
    @eventclass = Eventclass.new
  end

  # GET /eventclasses/1/edit
  def edit
  end

  # POST /eventclasses
  def create
    @eventclass = Eventclass.new(eventclass_params)
    @eventclass.save
  end

  # PATCH/PUT /eventclasses/1
  def update
    @eventclass.update(eventclass_params)
  end

  # DELETE /eventclasses/1
  def destroy
    @eventclass.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eventclass
      @eventclass = Eventclass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eventclass_params
      params.fetch(:eventclass, {})
    end
end
