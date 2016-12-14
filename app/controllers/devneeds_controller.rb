class DevneedsController < ApplicationController 
  before_action :set_devneed, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]
  

  #---------SETUP SESSION MODEL with IP as column--------
  #session[:voting_id] = request.remote_ip
  #voter = Session.find_or_create_by_ip(session[:voting_id])
  #voter.likes @thread

  # GET /devneeds
  # GET /devneeds.json
  def index
    @devneeds = Devneed.all
  end

  # GET /devneeds/1
  # GET /devneeds/1.json
  def show
  end

  # GET /devneeds/new
  def new
    @devneed = Devneed.new
  end

  # GET /devneeds/1/edit
  def edit
  end

  # POST /devneeds
  # POST /devneeds.json
  def create
    @devneed = Devneed.new(devneed_params)

    respond_to do |format|
      if @devneed.save
        format.html { redirect_to @devneed, notice: 'Devneed was successfully created.' }
        format.json { render :show, status: :created, location: @devneed }
      else
        format.html { render :new }
        format.json { render json: @devneed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devneeds/1
  # PATCH/PUT /devneeds/1.json
  def update
    respond_to do |format|
      if @devneed.update(devneed_params)
        format.html { redirect_to @devneed, notice: 'Devneed was successfully updated.' }
        format.json { render :show, status: :ok, location: @devneed }
      else
        format.html { render :edit }
        format.json { render json: @devneed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devneeds/1
  # DELETE /devneeds/1.json
  def destroy
    @devneed.destroy
    respond_to do |format|
      format.html { redirect_to devneeds_url }
      format.json { head :no_content }
      flash[:message] = "Issue was successfully destroyed"
    end
  end
#notice: 'Devneed was successfully destroyed.'
  def upvote
    @devneed = Devneed.find(params[:id])
    @devneed.upvote_by current_user
    @devneed.votes_for.size 
    redirect_to :back
  end

  def downvote
    @devneed = Devneed.find(params[:id])
    @devneed.downvote_by current_user
    #flash[:message] = "Thanks for your vote!"
    @devneed.votes_for.size 
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_devneed
      @devneed = Devneed.find(params[:id])
    end



    # Never trust parameters from the scary internet, only allow the white list through.
    def devneed_params
      params.require(:devneed).permit(:title, :description)
    end
end
