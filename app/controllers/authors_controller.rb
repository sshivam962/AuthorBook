class AuthorsController < ApplicationController

  def index
    @authors = Author.all # Fetch all Authors from database
  end

  def new
    @author = Author.new
  end

  #========== Create new Author =========== #
  def create
    @author = Author.create(author_params)

    if @author.save
      redirect_to root_path
    else
      render :new
    end
  end

  #========== Show Author Details =========== #
  def show
    @author = Author.find(params[:id])
  end

  def edit
    @author = Author.find(params[:id])
  end

  #========== Update Author Details =========== #
  def update
    @author = Author.find(params[:id])

    if @author.update(author_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  #========== Delete an Author =========== #
  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    redirect_to root_path
  end

  private
  #========== Author's Params =========== #
  def author_params
    params.require(:author).permit(:first_name, :last_name, :dob)
  end

end