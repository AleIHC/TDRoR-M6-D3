class CcCommentsController < ApplicationController
  before_action :set_cc_comment, only: %i[ show edit update destroy ]

  # GET /cc_comments or /cc_comments.json
  def index
    @cc_comments = CcComment.all
  end

  # GET /cc_comments/1 or /cc_comments/1.json
  def show
  end

  # GET /cc_comments/new
  def new
    @cc_comment = CcComment.new
  end

  # GET /cc_comments/1/edit
  def edit
  end

  # POST /cc_comments or /cc_comments.json
  def create
    @cc_comment = CcComment.new(cc_comment_params)
    @cc_post = CcPost.find(params[:cc_comment][:cc_post_id])

    # Para hacer opcional que el usuario esté logeado para la creación de un comentario
    if cc_user_signed_in?
      @cc_comment.cc_user = current_cc_user
    end

    respond_to do |format|
      if @cc_comment.save
        format.html { redirect_to cc_post_path(@cc_post.id), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @cc_comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cc_comment.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # PATCH/PUT /cc_comments/1 or /cc_comments/1.json
  def update
    respond_to do |format|
      if @cc_comment.update(cc_comment_params)
        format.html { redirect_to cc_comment_url(@cc_comment), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @cc_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cc_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cc_comments/1 or /cc_comments/1.json
  def destroy
    @cc_comment.destroy

    respond_to do |format|
      format.html { redirect_to cc_comments_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cc_comment
      @cc_comment = CcComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cc_comment_params
      params.require(:cc_comment).permit(:content, :cc_post_id)
    end
end
