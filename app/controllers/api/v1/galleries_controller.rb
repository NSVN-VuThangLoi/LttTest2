module Api
module V1
class GalleriesController < ApplicationController
respond_to :json
  def index
    respond_with Gallery.all

  end

  def show
     respond_with Gallery.find(params[:id])
    
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(params[:gallery])
respond_to do |format|
    if @gallery.save
     format.html { redirect_to @gallery, notice: 'Gallery was successfully created.' }
format.json { render json: @gallery, status: :created, location: @gallery }
else 
format.html {render action: "new" }
format.json {render json: @gallery.errors, status: :unprocessable_entity }
end
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update_attributes(params[:gallery])
      flash[:notice] = "Successfully updated gallery."
      redirect_to gallery_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    flash[:notice] = "Successfully destroyed gallery."
    redirect_to galleries_url
  end
end
end
end
