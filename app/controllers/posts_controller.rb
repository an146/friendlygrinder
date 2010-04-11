class PostsController < ApplicationController
  before_filter :login_required, :except => %w[ index show ]
  before_filter :should_be_owner_or_admin, :only => [:edit, :update, :destroy]

  def should_be_owner_or_admin
    if !current_user.can_edit?(Post.find(params[:id]))
      redirect_to :action => :index
    end
  end

  # GET /posts
  # GET /posts.xml
  def index
    @posts = Post.find(:all, :order => 'created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new( :post => @post, :user => current_user )

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = current_user.posts.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = current_user.posts.new(params[:post])

    process_uploads(@post) if params[:attachment]

    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to(@post) }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Post was successfully updated.'
        format.html { redirect_to(@post) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end

  protected

  def process_uploads(post)
    i = 0
    while true
      f = params[:attachment]['file_' + i.to_s]
      break if f == "" || f.nil?
      post.assets.build :attachment => f
      i += 1
    end
  end
end
