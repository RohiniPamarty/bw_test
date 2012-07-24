class PostsController < ApplicationController


def index
@token=params[:format]
@posts=Post.all
end
def create
@token=params[:token]
@post = Post.new(params[:post])
@post.save
me = FbGraph::User.me(@token)

@path = ((@post.photo.url).split('?'))[0]

#string.split('original/')[1]
me.feed!(
:message => @post.note,
:picture => open("#{Rails.public_path}#{((@post.photo.url).split('?'))[0]}"),
:link => "http://localhost:3000/posts/#{@post.id}",
:name => 'Test',
:description => @post.photo.url
)


redirect_to posts_url
end

def new
@token=params[:token]
@post=Post.new
end
def edit
end
def update
end
end
