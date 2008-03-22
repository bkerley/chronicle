class PostsController < ApplicationController
	before_filter :login_required, :only => [ :new, :create, :destroy, :edit, :update ]
	caches_page :index
	cache_sweeper :post_sweeper, :only => [:create, :update, :destroy]
	
	# GET /posts
	# GET /posts.xml
	def index
		# do the finding in the per-format code
		# I don't want an atom feed with 200 entries
		respond_to do |format|
			format.html do
				@posts = Post.find(:all, :order=>'created_at desc')
				render
			end
			format.xml do
				@posts = Post.find(:all, :order=>'created_at desc', :limit=>15)
				render :xml => @posts
			end
			format.atom do
				@posts = Post.find(:all, :order=>'created_at desc', :limit=>15)
				render
			end
		end
	end

	# GET /posts/1
	# GET /posts/1.xml
	def show
		@post = Post.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.json { render :json => @post }
			format.xml  { render :xml => @post }
		end
	end

	# GET /posts/new
	# GET /posts/new.xml
	def new
		@post = Post.new

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
		@post = Post.new(params[:post])
		
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
				format.json { render :json => @post.to_json(:methods=>:tag_string) }
				format.xml  { head :xml => @post }
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
end
