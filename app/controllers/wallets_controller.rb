# frozen_string_literal: true

# class WalletsController
class WalletsController < ApplicationController
  before_action :set_wallet, only: %i[show edit update destroy]
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: %i[index show edit update destroy]

  # GET /wallets or /wallets.json
  def index
    @wallets = policy_scope(Wallet)
  end

  # GET /wallets/1 or /wallets/1.json
  def show
    authorize @wallet
  end

  # GET /wallets/new
  def new
    @wallet = new_wallet
  end

  # GET /wallets/1/edit
  def edit
    authorize @wallet
  end

  # POST /wallets or /wallets.json
  def create
    @wallet = new_wallet(wallet_params)

    respond_to do |format|
      if @wallet.save
        format.html { redirect_to wallet_url(@wallet), notice: t('.success') }
        format.json { render :show, status: :created, location: @wallet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wallets/1 or /wallets/1.json
  def update
    authorize @wallet

    respond_to do |format|
      if @wallet.update(wallet_params)
        format.html { redirect_to wallet_url(@wallet), notice: t('.success') }
        format.json { render :show, status: :ok, location: @wallet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wallets/1 or /wallets/1.json
  def destroy
    authorize @wallet

    @wallet.destroy

    respond_to do |format|
      format.html { redirect_to wallets_url, notice: t('.success') }
      format.json { head :no_content }
    end
  end

  private

  def new_wallet(wallet_params = {})
    @wallet = Wallet.new({ **wallet_params, user: current_user })
    authorize @wallet
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_wallet
    @wallet = policy_scope(Wallet).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def wallet_params
    params.require(:wallet).permit(:name)
  end
end
