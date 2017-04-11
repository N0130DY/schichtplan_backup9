class MitarbeitersController < ApplicationController
  before_action :set_mitarbeiter, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]
  before_action :userlogin

  # GET /mitarbeiters
  # GET /mitarbeiters.json
  def index
    @mitarbeiters = Mitarbeiter.all
  end

  # GET /mitarbeiters/1
  # GET /mitarbeiters/1.json
  def show
  end

  # GET /mitarbeiters/new
  def new
    @mitarbeiter = Mitarbeiter.new
  end

  # GET /mitarbeiters/1/edit
  def edit
  end

  # POST /mitarbeiters
  # POST /mitarbeiters.json
  def create
    @mitarbeiter = Mitarbeiter.new(mitarbeiter_params)

    respond_to do |format|
      if @mitarbeiter.save
        format.html { redirect_to @mitarbeiter, notice: 'Mitarbeiter was successfully created.' }
        format.json { render :show, status: :created, location: @mitarbeiter }
      else
        format.html { render :new }
        format.json { render json: @mitarbeiter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mitarbeiters/1
  # PATCH/PUT /mitarbeiters/1.json
  def update
    respond_to do |format|
      if @mitarbeiter.update(mitarbeiter_params)
        format.html { redirect_to @mitarbeiter, notice: 'Mitarbeiter was successfully updated.' }
        format.json { render :show, status: :ok, location: @mitarbeiter }
      else
        format.html { render :edit }
        format.json { render json: @mitarbeiter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mitarbeiters/1
  # DELETE /mitarbeiters/1.json
  def destroy
    @mitarbeiter.destroy
    respond_to do |format|
      format.html { redirect_to mitarbeiters_url, notice: 'Mitarbeiter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mitarbeiter
      @mitarbeiter = Mitarbeiter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mitarbeiter_params
      params.require(:mitarbeiter).permit(:text, :start_date, :duration, :parent, :status, :user, :user_id)
    end
end
