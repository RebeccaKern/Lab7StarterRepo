class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.active.alphabetical.paginate(:page => params[:page]).per_page(10)
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :active)
  end

  def set_author
    @author = Author.find(params[:id])
  end

end
