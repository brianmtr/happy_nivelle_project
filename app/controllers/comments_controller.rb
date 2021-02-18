class CommentsController < ApplicationController
    before_action :set_comment, only: %i[ show edit update destroy ]

    def index
        
        @comments = Comment.all
      end

def show
end

# GET /homes/new
def new
    @comment = Comment.new
  end

  # GET /homes/1/edit
  def edit
  end

  # POST /homes or /homes.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homes/1 or /homes/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def accepted
    @comment = Comment.find(params[:id])
    @comment.accepted = true
    @comment.save
    redirect_to '/admin', notice: "l'évenement a bien été accepté."
  end



  # DELETE /homes/1 or /homes/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to home_index_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_comment
        @comment = Comment.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def comment_params
        params.require(:comment).permit(:title, :description)
      end
end
