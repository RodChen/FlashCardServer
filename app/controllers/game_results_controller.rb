class GameResultsController < ApplicationController
  before_action :set_game_result, only: [:show, :edit, :update, :destroy]

  # GET /game_results
  # GET /game_results.json
  def index
    @game_results = GameResult.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @game_results }
    end
  end

  # GET /game_results/1
  # GET /game_results/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game_result }
    end
  end

  # GET /game_results/new
  def new
    @game_result = GameResult.new
  end

  # GET /game_results/1/edit
  def edit
  end

  # POST /game_results
  # POST /game_results.json
  def create
    @game_result = GameResult.new()
    @game_result.game_id = game_result_params[:game_id]
    @game_result.user_id = game_result_params[:user_id]  # TODO: use client's user id
    @game_result.result = game_result_params[:result].to_json

    respond_to do |format|
      # TODO: wait rival's result and return
      if @game_result.save
        format.html { redirect_to @game_result, notice: 'Game result was successfully created.' }
        format.json { render json: @game_result.result, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @game_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_results/1
  # PATCH/PUT /game_results/1.json
  def update
    respond_to do |format|
      if @game_result.update(game_result_params)
        format.html { redirect_to @game_result, notice: 'Game result was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @game_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_results/1
  # DELETE /game_results/1.json
  def destroy
    @game_result.destroy
    respond_to do |format|
      format.html { redirect_to game_results_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_result
      @game_result = GameResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_result_params
      # params.require(:game_result).permit(:game_id, :user_id, :problem_id, :correct, :consumed_time)
      params.require(:game_result).permit(:game_id, :user_id, result: [:problem_id, :correct, :consumed_time])
    end
end
