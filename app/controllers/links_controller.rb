class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def show
    @link = Link.find( params[:id] )
  end

  def new
  end

  def create
    @link = Link.new( link_params )

    if @link.save
      flash[:notice] = "Link saved successfully!"
      redirect_to root_path
    else
      flash[:error] = "Error saving link."
      redirect_to new_link_path
    end
  end

  private
    def link_params
      params.require(:link).permit(:title, :link, :description)
    end
end
