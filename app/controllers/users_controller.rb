class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :followings, :followers]
  before_action :checkuser, only: [:update, :destroy]

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def followings
  end

  def followers
  end

  # POST /users
  # POST /users.json
  def create
    params = user_params
    params[:admin] = false
    @user = User.new(params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to "/#{@user.username}", notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(username: params[:username])
    end

    def checkuser
      if !user_me?
        redirect_to root_path
      end
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {}).permit!
    end
end
