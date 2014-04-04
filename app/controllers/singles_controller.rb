class SinglesController < ApplicationController
  before_action :set_single, only: [:show, :edit, :update, :destroy]

  # GET /singles
  # GET /singles.json
  def index
    @singles = Single.all

    if @singles.empty?
      respond_to do |format|
        format.json { render json: { message: "SORRY" }, status: :error }
        return
      end
    end


    respond_to do |format|
      format.html { @foo = 'bar'}
      format.json { render json: @singles, status: :ok }
      format.xml { render xml: { msg: "sorry" }, status: :bad_request }
    end
  end

  # GET /singles/1
  # GET /singles/1.json
  def show
    response = { title:  @single.title,
                 artist: @single.artist,
                 release_date: @single.release_date }

    respond_to do |format|
      format.html {}
      format.json { render json: response }
      format.xml { render xml: response }
    end
  end

  # GET /singles/new
  def new
    @single = Single.new
  end

  # GET /singles/1/edit
  def edit
  end

  # POST /singles
  # POST /singles.json
  def create
    @single = Single.new(single_params)

    respond_to do |format|
      if @single.save
        format.html { redirect_to @single, notice: 'Single was successfully created.' }
        format.json { render action: 'show', status: :created, location: @single }
      else
        format.html { render action: 'new' }
        format.json { render json: @single.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /singles/1
  # PATCH/PUT /singles/1.json
  def update
    respond_to do |format|
      if @single.update(single_params)
        format.html { redirect_to @single, notice: 'Single was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @single.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /singles/1
  # DELETE /singles/1.json
  def destroy
    @single.destroy
    respond_to do |format|
      format.html { redirect_to singles_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_single
    @single = Single.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def single_params
    params.require(:single).permit(:title, :artist, :length, :release_date, :lyrics)
  end
end
