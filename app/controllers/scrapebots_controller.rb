class ScrapebotsController < ApplicationController
  load_and_authorize_resource

  #has_mobile_fu
  # GET /stream_items
  # GET /stream_items.json
  layout 'awesome'

  def index
    @scrapebots = Scrapebot.all
    @stream_items = StreamItem.all
    @stream_items = @stream_items.sort! {|a, b| a.created_at <=> b.created_at}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scrapebots }
    end
  end

  # GET /scrapebots/1
  # GET /scrapebots/1.json
  def show
    @scrapebot = Scrapebot.all.select {|s| s.game == params[:game]}.first
    unless @scrapebot.nil?
      @stream_items = StreamItem.all.select {|a| a.stream.game == @scrapebot.game }
      @stream_items = @stream_items.sort! {|a, b| a.created_at <=> b.created_at}

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @scrapebot }
      end

    else
      redirect_to root_path
    end

    
  end

  # GET /scrapebots/new
  # GET /scrapebots/new.json
  def new
    @scrapebot = Scrapebot.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @scrapebot }
    end
  end

  # GET /scrapebots/1/edit
  def edit
    @scrapebot = Scrapebot.find(params[:id])
  end

  # POST /scrapebots
  # POST /scrapebots.json
  def create
    @scrapebot = Scrapebot.new(params[:scrapebot])

    respond_to do |format|
      if @scrapebot.save
        format.html { redirect_to @scrapebot, notice: 'Scrapebot was successfully created.' }
        format.json { render json: @scrapebot, status: :created, location: @scrapebot }
      else
        format.html { render action: "new" }
        format.json { render json: @scrapebot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /scrapebots/1
  # PUT /scrapebots/1.json
  def update
    @scrapebot = Scrapebot.find(params[:id])

    respond_to do |format|
      if @scrapebot.update_attributes(params[:scrapebot])
        format.html { redirect_to @scrapebot, notice: 'Scrapebot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scrapebot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scrapebots/1
  # DELETE /scrapebots/1.json
  def destroy
    @scrapebot = Scrapebot.find(params[:id])
    @scrapebot.destroy

    respond_to do |format|
      format.html { redirect_to scrapebots_url }
      format.json { head :no_content }
    end
  end

  def compute_layout
    if params[:action] == "edit"
      "application"
    elsif params[:action] == "new"
      'application'
    else
      'application'
    end
  end

end
