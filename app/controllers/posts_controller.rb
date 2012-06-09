class PostsController < ApplicationController
  before_filter :find_static
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.journal_list.paginate(:page => params[:page])

    @journal_numbers = Post.find_by_sql("SELECT DISTINCT strftime('%Y%m', created_at) created from posts ORDER BY created DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    if params[:short_url]
      @post = Post.find_by_short_url(params[:short_url])
    else
      @post = Post.find(params[:id])
    end

    raise NotFound unless @post

    @posts_side_bar = Post.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html { render layout: "editor" }
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    render layout: "editor"
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_path(@post.short_url), notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new", layout: "editor" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to post_path(@post.short_url), notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", layout: "editor" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private

  def find_static
    @static = Static.find_by_short_url("journal")
  end


end
