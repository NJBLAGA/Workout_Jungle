class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_line_item, only: %i[ show edit update destroy ]
  before_action :set_cart, only: [:create]
  # GET /line_items or /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1 or /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items or /line_items.json
  def create
    listing = Listing.find(params[:listing_id])
    @line_item = @cart.add_listing(listing)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart, notice: "Listing was successfully added." }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1 or /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item.cart, notice: "Listing added to Wish List." }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1 or /line_items/1.json
  def destroy
    @cart = Cart.find(session[:cart_id])
    if @line_item.quantity > 1 
       @line_item.quantity-=1
       @line_item.save
    else
      @line_item.destroy
    end
    respond_to do |format|
      format.html { redirect_to cart_path(@cart), notice: "Listing was successfully removed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def line_item_params
      params.require(:line_item).permit(:listing_id)
    end
end
