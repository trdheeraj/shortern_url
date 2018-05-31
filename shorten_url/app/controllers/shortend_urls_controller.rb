class ShortendUrlsController < ApplicationController
  before_action :set_shortend_url, only: [:show, :destroy, :shortened]

  # GET /shortend_urls
  # GET /shortend_urls.json
  def index
    @shortend_urls = ShortendUrl.all
  end

  # GET /shortend_urls/1
  # GET /shortend_urls/1.json
  def show
  end

  # GET /shortend_urls/new
  def new
    @shortend_url = ShortendUrl.new
  end

  # POST /shortend_urls
  # POST /shortend_urls.json
  def create
    @shortend_url = ShortendUrl.new(shortend_url_params)
    @shortend_url.sanitize
    puts @shortend_url
    if @shortend_url.new_url?
      respond_to do |format|
        if @shortend_url.save
          format.html { redirect_to @shortend_url, notice: 'Shortend url was successfully created.' }
          format.json { render :show, status: :created, location: @shortend_url }
        else
          format.html { render :new }
          format.json { render json: @shortend_url.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:notice] = "A short link for this URL is already in our database"
    end
  end

  # DELETE /shortend_urls/1
  # DELETE /shortend_urls/1.json
  def destroy
    @shortend_url.destroy
    respond_to do |format|
      format.html { redirect_to shortend_urls_url, notice: 'Shortend url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shortend_url
      @shortend_url = ShortendUrl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shortend_url_params
      params.require(:shortend_url).permit(:original_url)
    end
end
