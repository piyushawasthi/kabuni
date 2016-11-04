class LinksController < ApplicationController
  before_action :authenticate_user!
  before_filter :shorten_url_params, :only => [:create]

  def index
    @links = current_user.links
  end

  def show
    @link = Link.includes(:visits).find_by(:id => params[:id], :user_id => current_user.id)

    unless @link
      flash[:warning] = "Link not found"
      redirect_to links_path
    end
  end

  def new
    @link = Link.new
  end

  def create
    if @link.save
      @link.generate_shorten
      flash[:success] = "Link created successfully"
      redirect_to links_path
    else
      render 'new'
    end
  end

  def edit
    @link = Link.find_by(:id => params[:id], :user_id => current_user.id)
    
    unless @link
      flash[:warning] = "Link not found"
      redirect_to links_path
    end
  end

  def update
    @link = Link.find_by(:id => params[:id], :user_id => current_user.id)

    if @link && @link.update(:shorten => params[:shorten], :target_url => params[:target_url])
      @link.standardize_target_url!
      flash[:success] = "Link created successfully"
      redirect_to links_path
    else
      render 'edit'
    end
  end

  def destroy
    @link = Link.find_by(:id => params[:id], :user_id => current_user.id)

    if @link && @link.destroy
      flash[:success] = "Link destroyed successfully"
      redirect_to links_path
    else
      flash[:warning] = "Unsuccessful"
      redirect_to links_path
    end
  end
  
  #############################################################################################
  # PRIVATE METHODS
  #############################################################################################

  private

  def shorten_url_params
    @link = Link.new(:target_url => params[:target_url], :user_id => current_user.id)
    @link.standardize_target_url!
  end
end
