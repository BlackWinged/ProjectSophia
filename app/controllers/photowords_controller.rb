class PhotowordsController < ApplicationController
  before_action :set_photoword, only: [:show, :edit, :update, :destroy]

  # GET /photowords
  # GET /photowords.json
  def index
    @photowords = Photoword.all
  end

  # GET /photowords/1
  # GET /photowords/1.json
  def show
  end

  # GET /photowords/new
  def new
    @photoword = Photoword.new
  end

  # GET /photowords/1/edit
  def edit
  end

  # POST /photowords
  # POST /photowords.json
  def create
    @photoword = Photoword.new(photoword_params)

    respond_to do |format|
      if @photoword.save
        format.html { redirect_to @photoword, notice: 'Photoword was successfully created.' }
        format.json { render :show, status: :created, location: @photoword }
      else
        format.html { render :new }
        format.json { render json: @photoword.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photowords/1
  # PATCH/PUT /photowords/1.json
  def update
    respond_to do |format|
      if @photoword.update(photoword_params)
        format.html { redirect_to @photoword, notice: 'Photoword was successfully updated.' }
        format.json { render :show, status: :ok, location: @photoword }
      else
        format.html { render :edit }
        format.json { render json: @photoword.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photowords/1
  # DELETE /photowords/1.json
  def destroy
    @photoword.destroy
    respond_to do |format|
      format.html { redirect_to photowords_url, notice: 'Photoword was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photoword
      @photoword = Photoword.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photoword_params
      params.require(:photoword).permit(:caption, :path)
    end
end
