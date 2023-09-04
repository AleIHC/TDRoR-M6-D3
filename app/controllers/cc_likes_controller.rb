class CcLikesController < ApplicationController
    before_action :find_cc_like, only: [:destroy]
    before_action :authenticate_cc_user!, only: [ :create ]
    before_action :authenticate_cc_user!, except: %i[ index show ]

    # Método para crear nueva reacción
    def new_cc_user_cc_like
        @cc_user = current_cc_user
        @like_type = params[:like_type]
        @cc_post = CcPost.find(params[:cc_post_id]) if params[:cc_post_id]
        @cc_comment = CcComment.find(params[:cc_comment_id]) if params[:cc_comment_id]
        @kind = params[:kind]

        respond_to do |format|
            cc_user_cc_like = nil

            (@like_type == "cc_comment") ? cc_user_cc_like = CcLike.find_by(cc_user_id: @cc_user, cc_comment_id: @cc_comment.id) : cc_user_cc_like = CcLike.find_by(cc_user_id: @cc_user.id, cc_post_id: @cc_post.id)

            if already_reacted?
                format.html { redirect_to cc_post_path(@cc_post), notice: 'Ya has reaccionado a esta publicación'}
            else 
                (@like_type == "cc_post") ? @cc_like = CcLike.new(cc_user_id: @cc_user.id, cc_post_id: @cc_post&.id, like_type: @like_type, kind: @kind) : @cc_like = CcLike.new(cc_user_id: @cc_user.id, cc_comment_id: @cc_comment&.id, like_type: @like_type, kind: @kind)
                if @cc_like.save!
                    format.html {
                        redirect_to cc_post_path(@cc_post), notice: 'Gracias por reaccionar'
                    }
                else
                    format.html {
                        redirect_to cc_post_path(@cc_post), notice: 'Algo salió mal'
                    }
                end
            end
        end
    end

    def already_reacted?
        CcLike.where(cc_user_id: current_cc_user.id, cc_post_id: params[:cc_post_id]).exists?
    end

    def destroy
        if !(cc_user_cc_like)
        end
    end

    def find_cc_like
        @cc_like = @cc_post.cc_likes.find(params[:id])
    end
end
