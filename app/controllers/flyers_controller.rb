class FlyersController < ApplicationController
  # GET /flyers
  # GET /flyers.json
  def index
    @flyers = Flyer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @flyers }
    end
  end

  # GET /flyers/1
  # GET /flyers/1.json
  def show
    @flyer = Flyer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @flyer }
    end
  end

  # GET /flyers/new
  # GET /flyers/new.json
  def new
    @flyer = Flyer.new
  end

  # GET /flyers/1/edit
  def edit
    @flyer = Flyer.find(params[:id])
  end

  # POST /flyers
  # POST /flyers.json
  def create
    @flyer = Flyer.new(params[:flyer])
    #respond_to do |format|
    respond_to do |format| 
      if @flyer.save
        kit = IMGKit.new(render_to_string(:partial => 'form', :layout => false,:locals => {:flyer => @flyer}))
        #render :text=>params and return false
        #kit.stylesheets << "#{Rails.root.to_s}/app/assets/stylesheets/ImgKit.css" #its apply the give css to the converted image 
        t = kit.to_img(:png) # convert image to specific format
        file = kit.to_file(Rails.root + "public/assets/" + "screenshot.png")#storing path of converted file

        format.html { redirect_to @flyer, notice: 'Flyer was successfully created.' }
        format.json { render json: @flyer, status: :created, location: @flyer }
      else
        format.html { render action: "new" }
        format.json { render json: @flyer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /flyers/1
  # PUT /flyers/1.json
  def update
    @flyer = Flyer.find(params[:id])

    respond_to do |format|
      if @flyer.update_attributes(params[:flyer])
        format.html { redirect_to @flyer, notice: 'Flyer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @flyer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flyers/1
  # DELETE /flyers/1.json
  def destroy
    @flyer = Flyer.find(params[:id])
    @flyer.destroy

    respond_to do |format|
      format.html { redirect_to flyers_url }
      format.json { head :no_content }
    end
  end
end
