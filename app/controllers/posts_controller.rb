class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]
  before_action :checkpost_owner, only: [:destroy]

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # POST /posts
  # POST /posts.json
  def create
    params = post_params
    params[:user_id] = current_user.id
    @post = Post.new(params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to root_path }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Post was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def checkpost_owner
      if !mypost? && !current_user.admin
        redirect_to root_path
        @post = nil
      end
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.fetch(:post, {}).permit!
    end
end
