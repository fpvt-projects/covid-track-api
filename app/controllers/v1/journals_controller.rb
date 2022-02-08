class V1::JournalsController < ApplicationController
  before_action :set_journal, only: %i[ show update destroy ]
  before_action :authenticate_user

  # GET /journals
  #only show the journals connected to the user
  def index
    @journals = Journal.where(user_id: params[:user_id])

    if @journals == nil 
      flash[:notice] ="No entry"
    else
      render json: @journals
    end
    
  end

  # GET /journals/1
  # def show
  #   render json: @journal
  # end

  # POST /journals
  def create
    @journal = Journal.new(journal_params)

    if @journal.save
      render json: @journal, status: :created
    else
      render json: @journal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /journals/1
  def update
    if @journal.update(journal_params)
      render json: @journal
    else
      render json: @journal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /journals/1
  def destroy
    @journal.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journal
      @journal = Journal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def journal_params
      params.require(:journal).permit(:title, :content, :user_id)
    end
end
