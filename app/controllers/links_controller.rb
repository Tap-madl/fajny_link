# -*- coding: utf-8 -*-
class LinksController < ApplicationController
helper_method :sort_column, :sort_direction # +
  
  before_filter :authorize_user_read, :except => [:show, :index, :new, :create]  
  before_filter :authenticate_user!, :only => [:new, :create]

  def index
    #@links = Link.all
    @links = Link.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page]) # +
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

  protected

  def authorize_user_read
    @link = Link.find(params[:id])
    if @link.user != current_user
      redirect_to links_url
      flash[:notice] = "Brak uprawnień."
    end
  end

  private # +
  
  def sort_column # +
     Link.column_names.include?(params[:sort]) ? params[:sort] : "title" # +
  end # +
    
  def sort_direction # +
     %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc" # +
  end # +



end
