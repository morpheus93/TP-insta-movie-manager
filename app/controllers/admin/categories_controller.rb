class Admin::CategoriesController < ApplicationController
	before_action :authenticate_user! # User need to be authenticated
	before_action :check_user_rights # User need to be admin
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
	  @categories = Category.page(params['page']).per(24)
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_categories_path, notice: 'Category was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to admin_categories_path, notice: 'Category was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to admin_categories_path, notice: 'Category was successfully destroyed.' }
    end
  end

  private
    def set_category
      @category = Category.friendly.find(params[:slug])
    end

    def category_params
      params.require(:category).permit(:name, :picture_url)
    end

  private
  def check_user_rights
    if current_user && !current_user.admin?
      redirect_to root_path
    end
  end
end
