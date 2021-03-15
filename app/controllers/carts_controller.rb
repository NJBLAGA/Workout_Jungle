class CartsController < ApplicationController
  #Error handling to check if there is a invalid wish list, provides error and rescue
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  before_action :set_cart, only: %i[ show edit update destroy ]

  # GET /carts or /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1 or /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      #Saves cart variable if listing is successfully added to the wish list
      if @cart.save
        #Redirects user to wish list page and provides message
        format.html { redirect_to @cart, notice: "Wish List was successfully created." }
        format.json { render :show, status: :created, location: @cart }
      else
        #Renders error message to user if wish list was not successful
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: "Wish List was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    #Looking into user session (cookie)
    #Destroy the wish list(clear it out to nil)
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      #Redirects user back to root/home page with message
      format.html { redirect_to root_path, notice: "Wish List is now empty." }
      format.json { head :no_content }
    end
  end

  private
    #Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    #Only allow a list of trusted parameters through.
    def cart_params
      params.fetch(:cart, {})
    end

    def invalid_cart
      #Using log, provide user with message that the current wish list id is invalid or not for them
      logger.error "Attempt to access invalid cart #{paramas[:id]}"
      #Redirects user back to home page/root and displays error message
      redirect_to root_path, notice: "That Cart does not exist"
    end
end
