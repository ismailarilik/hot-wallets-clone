# frozen_string_literal: true

# class TransactionsController
class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show edit update destroy]
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: %i[index show edit update destroy]

  # GET /transactions or /transactions.json
  def index
    @transactions = policy_scope(Transaction)
  end

  # GET /transactions/1 or /transactions/1.json
  def show
    authorize @transaction
  end

  # GET /transactions/new
  def new
    @transaction = new_transaction
  end

  # GET /transactions/1/edit
  def edit
    authorize @transaction
  end

  # POST /transactions or /transactions.json
  def create
    @transaction = new_transaction(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to transaction_url(@transaction), notice: t('.success') }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    authorize @transaction

    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to transaction_url(@transaction), notice: t('.success') }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    authorize @transaction

    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to transactions_url, notice: t('.success') }
      format.json { head :no_content }
    end
  end

  private

  def new_transaction(transaction_params = {})
    @transaction = Transaction.new({ **transaction_params, user: current_user })
    authorize @transaction
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = policy_scope(Transaction).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:transaction).permit(:name, :category_id, :price, :wallet_id)
  end
end
