class PostsController < ApplicationController

  def show
    @post = Post.find_by({"id" => params["id"]})
    @place = Place.find_by({"id" => @post["place_id"]})
  end 

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post["title"]= params["post"]["title"]
    @post["posted_on"]=params["post"]["posted_on"]
    @post["description"]=params["post"]["description"]
    @post.save
    redirect_to "places/#{@post["place_id"]}"
  end


end