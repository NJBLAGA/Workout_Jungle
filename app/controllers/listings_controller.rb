class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  #User must be logged in
  before_action :authenticate_user!

  # GET /listings or /listings.json
  def index
    if(params.has_key?(:listing_type))
      @listings = Listing.where(listing_type: params[:listing_type]).order("created_at desc")
    else
      @listings = Listing.all.order("created_at desc")
    end
  end

    # GET /listings or /listings.json

def own
  #Current_user from devise
  if(params.has_key?(:listing_type))
    @listings = current_user.listings.where(listing_type: params[:listing_type]).order("created_at desc")
  else
    @listings = current_user.listings
  end
end

  # GET /listings/1 or /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    #current_user from devise
    @listing = current_user.listings.build
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings or /listings.json
  def create
    #Builds listing
    @listing = current_user.listings.build(listing_params)
    #Current_user from devise
    @listing.user = current_user
    #Listing has attached image
    @listing.image.attach(params[:listing][:image])

    respond_to do |format|
      #If listing is successfully and meets all requirements, save listing and direct user to all listing page
      if @listing.save
        format.html { redirect_to @listing, notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        #If listing is not successfully created, provide error to user
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    respond_to do |format|
      #If listing is successfully update, redirect user to my listing page
      if @listing.update(listing_params)
        format.html { redirect_to own_listing_path, notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
         #If listing is not successfully updated, provide error to user
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      #If user is signed in and admin, redirect them to all listings page
      if user_signed_in? && current_user.admin
        format.html { redirect_to @listing, notice: "Listing was successfully destroyed." }
        format.json { head :no_content }
      else 
        #If user is signed in but not an admin, redirect them to my listings page
        format.html { redirect_to own_listing_path, notice: "Listing was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    #Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    #Only allow a list of trusted parameters through.
    def listing_params
      #Appended image to form and listing
      params.require(:listing).permit(:title, :description, :price, :listing_type, :condition, :image)
    end
end
