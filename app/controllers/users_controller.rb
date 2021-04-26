class UsersController < ApplicationController
  before_action :set_user, only: %i[ show  ]

  # GET /users/1 or /users/1.json
  def show
    id = session[:current_user_id].to_s
    if id == params[:id]
      @user = User.find(id)
    else
      @user = User.new
      render 'session_form'
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
        session[:current_user_id] = @user.id
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def new_session
    @user = User.new
    render 'session_form'
  end

  def create_session
    @user = User.find_by_username(params[:username]);
    #@user = User.new(username: params[:username])
    if @user.nil?
      render 'session_form'

    else
      session[:current_user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit([:username])
    end
end
