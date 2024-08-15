class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
      @product = Product.friendly.find(params[:product_id])
      @comment = @product.comments.create(comment_params)
      @comment.user = current_user

      if @comment&.save
        flash[:notice] = "Comment has been created"
        redirect_to product_path(@product)
      else
        flash[:alert] = 'Comment has not been created'
        redirect_to product_path(@product)
      end
    end

    def edit
      @product = Product.friendly.find(params[:id])
      @comment = @product.comments.find(params[:product_id])
    end

    def update
      respond_to do |format|
        @product = Product.friendly.find(params[:id])
        @comment = @product.comments.find(params[:product_id])
        if @comment.update(comment_params)
          format.html { redirect_to product_path(@product), notice: "Comment hs been Updated" }
          format.json { render :show, status: :ok, location: @comment }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    def destroy
        @product = Product.friendly.find(params[:id])
        @comment = @product.comments.find(params[:product_id])
        @comment.destroy
        redirect_to product_path(@product)
    end
    
    private

    def comment_params
        params.require(:comment).permit(:body)
    end
end
