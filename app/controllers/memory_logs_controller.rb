class MemoryLogsController < ApplicationController
  before_action :set_memory_log, only: [:show, :edit, :update, :destroy]

  # GET /memory_logs
  # GET /memory_logs.json
  def index
    currUserId = session[:currentUser]
    if !currUserId
      redirect_to users_login_path 
    end 
    @memory_logs = MemoryLog.where(user_id: currUserId)
  end

  # GET /memory_logs/1
  # GET /memory_logs/1.json
  def show
  end

  # GET /memory_logs/new
  def new
    @memory_log = MemoryLog.new
  end

  # GET /memory_logs/1/edit
  def edit
  end

  # POST /memory_logs
  # POST /memory_logs.json
  def create
    @memory_log = MemoryLog.new(memory_log_params)

    respond_to do |format|
      if @memory_log.save
        format.html { redirect_to @memory_log, notice: 'Memory log was successfully created.' }
        format.json { render :show, status: :created, location: @memory_log }
      else
        format.html { render :new }
        format.json { render json: @memory_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memory_logs/1
  # PATCH/PUT /memory_logs/1.json
  def update
    respond_to do |format|
      if @memory_log.update(memory_log_params)
        format.html { redirect_to @memory_log, notice: 'Memory log was successfully updated.' }
        format.json { render :show, status: :ok, location: @memory_log }
      else
        format.html { render :edit }
        format.json { render json: @memory_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memory_logs/1
  # DELETE /memory_logs/1.json
  def destroy
    @memory_log.destroy
    respond_to do |format|
      format.html { redirect_to memory_logs_url, notice: 'Memory log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_memory_log
      @memory_log = MemoryLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def memory_log_params
      params.require(:memory_log).permit(:timestamp, :description, :user)
    end
end
