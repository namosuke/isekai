class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    if params[:type] == 'village' then
      @posts = Post.where(village_id: params[:id]).order(id: 'DESC')
    elsif params[:type] == 'job'
      @posts = Post.where(job_id: params[:id]).order(id: 'DESC')
    end
    @post = Post.new
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to request.referer }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  #def update
  #  respond_to do |format|
  #    if @post.update(post_params)
  #      format.html { redirect_to @post, notice: 'Post was successfully updated.' }
  #      format.json { render :show, status: :ok, location: @post }
  #    else
  #      format.html { render :edit }
  #      format.json { render json: @post.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to request.referer, notice: '神さま「あなたの過去が消えたよ！おめでとう！」' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      output = params.require(:post).permit(:content)
      output["user_id"] = current_user.id
      output["village_id"] = current_user.village_id
      output["job_id"] = current_user.job_id
      return output
    end
end
