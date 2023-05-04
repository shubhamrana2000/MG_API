class UserprofilesController < ApplicationController
  before_action :set_userprofile, only: %i[ show edit update destroy ]

  # GET /userprofiles or /userprofiles.json
  def index
    @userprofiles = Userprofile.all
  end

  # GET /userprofiles/1 or /userprofiles/1.json
  def show
  end

  # GET /userprofiles/new
  def new
    @userprofile = Userprofile.new
  end

  # GET /userprofiles/1/edit
  def edit
  end

  # POST /userprofiles or /userprofiles.json
  def create
    @userprofile = Userprofile.new(userprofile_params)

    respond_to do |format|
      if @userprofile.save
        format.html { redirect_to userprofile_url(@userprofile), notice: "Userprofile was successfully created." }
        format.json { render :show, status: :created, location: @userprofile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @userprofile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userprofiles/1 or /userprofiles/1.json
  def update
    respond_to do |format|
      if @userprofile.update(userprofile_params)
        format.html { redirect_to userprofile_url(@userprofile), notice: "Userprofile was successfully updated." }
        format.json { render :show, status: :ok, location: @userprofile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @userprofile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userprofiles/1 or /userprofiles/1.json
  def destroy
    @userprofile.destroy

    respond_to do |format|
      format.html { redirect_to userprofiles_url, notice: "Userprofile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userprofile
      @userprofile = Userprofile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def userprofile_params
      params.require(:userprofile).permit(:userEmail, :userName, :phoneNumber, :Address, :DOB, :Occupation, :Gender, :profilePic)
    end
end
