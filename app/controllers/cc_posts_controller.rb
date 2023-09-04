class CcPostsController < ApplicationController
  before_action :set_cc_post, only: %i[ show edit update destroy ]
  before_action :authenticate_cc_user!, except: %i[ index show ]
  # Autorizar a borrar sólo a usuarios admin
  before_action only: [:new, :create, :destroy, :update] do
    authorize_request(["cc_normal_user", "cc_admin"])
  end



  # GET /cc_posts or /cc_posts.json
  def index
    @cc_posts = CcPost.all
  end

  # GET /cc_posts/1 or /cc_posts/1.json
  def show
    @cc_post = CcPost.find(params[:id])
    @cc_comments = @cc_post.cc_comments
    @cc_comment = CcComment.new
    
  end

  # GET /cc_posts/new
  def new
    @cc_post = CcPost.new
  end

  # GET /cc_posts/1/edit
  def edit
  end

  # POST /cc_posts or /cc_posts.json
  def create
    @cc_post = CcPost.new(cc_post_params)

    respond_to do |format|
      if @cc_post.save
        format.html { redirect_to cc_post_url(@cc_post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @cc_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cc_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cc_posts/1 or /cc_posts/1.json
  def update
    respond_to do |format|
      if @cc_post.update(cc_post_params)
        format.html { redirect_to cc_post_url(@cc_post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @cc_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cc_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cc_posts/1 or /cc_posts/1.json
  def destroy
    @cc_post.destroy

    respond_to do |format|
      format.html { redirect_to cc_posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cc_post
      @cc_post = CcPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cc_post_params
      params.require(:cc_post).permit(:image, :title, :content, :cc_user_id)
    end
end
