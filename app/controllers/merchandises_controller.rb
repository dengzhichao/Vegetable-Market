class MerchandisesController < ApplicationController
  before_action :set_merchandise, only: [:show, :edit, :update, :destroy]

  # GET /merchandises
  # GET /merchandises.json
  def index
    if current_user
      if !current_user.role_id
        current_user.role_id = 3
        current_user.handle = "No Name"
        current_user.save
        redirect_to :controller => "users", action => "edit",
              :id => current_user.id
        return
      end
    end
    @merchandises = Merchandise.all
    if current_user
      @carts = Cart.where( user_id: current_user.id ).all
    end
  end

  # GET /merchandises/1
  # GET /merchandises/1.json
  def show
  end

  # GET /merchandises/new
  def new
    @merchandise = Merchandise.new
  end

  # GET /merchandises/1/edit
  def edit
  end

  # POST /merchandises
  # POST /merchandises.json
  def create
    if params[:merchandise][:photo]
      @file = params[:merchandise][:photo]
      @stat = @file.tempfile.stat
      @merchandise = Merchandise.new(
        :category => params[:merchandise][:category],
        :name => params[:merchandise][:name],
        :price => params[:merchandise][:price],
        :max_order => params[:merchandise][:max_order],
        :file_name => @file.original_filename,
        :file_type => @file.content_type,
        :photo => @file.read
        )
        respond_to do |format|
          if @merchandise.save
            format.html { redirect_to @merchandise, notice: 'Merchandise was successfully created.' }
            format.json { render action: 'show', status: :created, location: @merchandise }
          else
            format.html { render action: 'new' }
            format.json { render json: @merchandise.errors, status: :unprocessable_entity }
          end
        end
      else
        respond_to do |format|
          format.html{render action: 'new', notice: 'Photo is not attached.'}
          format.json{render json: @merchandise.errors, status: :unprocessable_entity}
        end
     end
  end

  # PATCH/PUT /merchandises/1
  # PATCH/PUT /merchandises/1.json
  def update
    if params[:merchandise][:photo]
      @file = params[:merchandise][:photo] 
      @stat = @file.tempfile.stat
      respond_to do |format|
        if @merchandise.update_attributes(
          :category => params[:merchandise][:category], 
          :name => params[:merchandise][:name],
          :price => params[:merchandise][:price], 
          :max_order => params[:merchandise][:max_order], 
          :file_name => @file.original_filename,
          :file_type => @file.content_type,
          :photo => @file.read
         )
          format.html { redirect_to @merchandise, notice: 'Merchandise was successfully updated.' } 
          format.json { head :no_content }
         else
          format.html { render action: 'edit' }
          format.json { render json: @merchandise.errors, status: :unprocessable_entity }
         end 
      end
    else
      respond_to do |format|
        format.html { render action: 'edit', notice: 'Photo is not attached.' }
        format.json { render json: @merchandise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merchandises/1
  # DELETE /merchandises/1.json
  def destroy
    @merchandise.destroy
    respond_to do |format|
      format.html { redirect_to merchandises_url }
      format.json { head :no_content }
    end
  end
  
  def photo
    @merchandise = Merchandise.find(params[:id])
    send_data @merchandise.photo,
        :filename =>
    @merchandise.file_name, :type => @merchandise.file_type
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merchandise
      @merchandise = Merchandise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def merchandise_params
      params.require(:merchandise).permit(:category, :name, :price, :max_order, :photo)
    end
end
