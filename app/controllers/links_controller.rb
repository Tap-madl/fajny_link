class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(params[:link])
    @link.user = current_user
    if @link.save
      flash[:notice] = "Successfully created link."
      redirect_to @link
    else
      render :action => 'new'
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(params[:link])
      flash[:notice] = "Successfully updated link."
      redirect_to @link
    else
      render :action => 'edit'
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    flash[:notice] = "Successfully destroyed link."
    redirect_to links_url
  end
end
