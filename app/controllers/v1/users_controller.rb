class V1::UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  # authenticate in all except when creating user
  before_action :authenticate_user, only: %i[ show index update destroy]
  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.save
    if @user
      render json: @user, status: :created
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:lastname, :middlename, :firstname, :address, :region, :cellnumber, :birthdate, :gender, :account_id)
    end
end
