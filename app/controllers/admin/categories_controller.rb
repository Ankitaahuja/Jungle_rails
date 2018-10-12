class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with :name => ENV['MY_USER'], :password => ENV['MY_PASS']

  def index
    @category = Category.order(id: :desc).all
  end

  def new
    @categories = Category.new
  end

  def create 
    @categories = Category.new(categories_params)

    if @categories.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def categories_params
    params.require(:categories).permit(
      :name,
      :created_at,
      :updated_at,
    )
  end
end
