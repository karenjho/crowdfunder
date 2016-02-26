class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_url

    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])

  @projects = @category.projects.order('projects.created_at DESC').page(params[:page])

  respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @category = Category.find(params[:id])

    end


  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(category_params)
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

end
