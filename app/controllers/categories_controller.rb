class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:name])
    if @category.save
      redirect_to categories_url
    else
      render:new
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
