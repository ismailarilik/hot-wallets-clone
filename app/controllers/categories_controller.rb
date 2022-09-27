# frozen_string_literal: true

# class CategoriesController
class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: %i[index show edit update destroy]

  # GET /categories or /categories.json
  def index
    @categories = policy_scope(Category)
  end

  # GET /categories/1 or /categories/1.json
  def show
    authorize @category
  end

  # GET /categories/new
  def new
    @category = new_category
  end

  # GET /categories/1/edit
  def edit
    authorize @category
  end

  # POST /categories or /categories.json
  def create
    @category = new_category(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to category_url(@category), notice: t('.success') }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    authorize @category

    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: t('.success') }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    authorize @category

    respond_to do |format|
      if @category.destroy
        format.html { redirect_to categories_url, notice: t('.success') }
        format.json { head :no_content }
      else
        format.html { render :show, status: :precondition_failed }
        format.json { render json: @category.errors, status: :precondition_failed }
      end
    end
  end

  private

  def new_category(category_params = {})
    @category = Category.new({ **category_params, user: current_user })
    authorize @category
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = policy_scope(Category).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :context, :icon)
  end
end
