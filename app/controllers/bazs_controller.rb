class BazsController < ApplicationController
  before_action :set_baz, only: [:show, :edit, :update, :destroy]

  # GET /bazs
  # GET /bazs.json
  def index
    @bazs = Baz.all
  end

  # GET /bazs/1
  # GET /bazs/1.json
  def show
  end

  # GET /bazs/new
  def new
    @baz = Baz.new
  end

  # GET /bazs/1/edit
  def edit
  end

  # POST /bazs
  # POST /bazs.json
  def create
    @baz = Baz.new(baz_params)

    respond_to do |format|
      if @baz.save
        format.html { redirect_to @baz, notice: 'Baz was successfully created.' }
        format.json { render action: 'show', status: :created, location: @baz }
      else
        format.html { render action: 'new' }
        format.json { render json: @baz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bazs/1
  # PATCH/PUT /bazs/1.json
  def update
    respond_to do |format|
      if @baz.update(baz_params)
        format.html { redirect_to @baz, notice: 'Baz was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @baz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bazs/1
  # DELETE /bazs/1.json
  def destroy
    @baz.destroy
    respond_to do |format|
      format.html { redirect_to bazs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_baz
      @baz = Baz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def baz_params
      params.require(:baz).permit(:name, :bar_id)
    end
end
