class LineItemsController < ApplicationController
  #User must be logged in
  before_action :authenticate_user!
  #Helper found in app/models/concerns/current_cart.rb
  include CurrentCart
  #Set line item
  before_action :set_line_item, only: %i[ show edit update destroy ]
  #then set cart(wish list)
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
    #Find listings of params id
    listing = Listing.find(params[:listing_id])
    #Add listing to wish list (cart model)
    #Add_listing found in wish list (cart model)
    @line_item = @cart.add_listing(listing)

    respond_to do |format|
      if @line_item.save
        #Redirects user to wish list and renders message that it was successfully added
        format.html { redirect_to @line_item.cart, notice: "Listing was successfully added." }
        format.json { render :show, status: :created, location: @line_item }
      else
        #Redirects user to new wish list 
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
    #Look into user session (cookie)
    #When remove item is used and item > 1
    #Decrease listing quantity by 1
    @cart = Cart.find(session[:cart_id])
    if @line_item.quantity > 1 
       @line_item.quantity-=1
       @line_item.save
    else
    #If item = 1, then remove listing from wish list
      @line_item.destroy
    end
    respond_to do |format|
      #Redirects user to wish list page and renders message
      format.html { redirect_to cart_path(@cart), notice: "Listing was successfully removed." }
      format.json { head :no_content }
    end
  end

  private
    #Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    #Only allow a list of trusted parameters through.
    def line_item_params
      params.require(:line_item).permit(:listing_id)
    end
end
