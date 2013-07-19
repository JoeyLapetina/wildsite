class StreamItemsController < ApplicationController
  load_and_authorize_resource
  # GET /stream_items
  # GET /stream_items.json
  layout :compute_layout

  def index
    @stream_items = StreamItem.all
    @stream_items = @stream_items.sort! {|a, b| a.created_at <=> b.created_at}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stream_items }
    end
  end

  # GET /stream_items/1
  # GET /stream_items/1.json
  def show
    @stream_item = StreamItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stream_item }
    end
  end

  def hide
    @stream_item = StreamItem.find(params[:id])
    @stream_item.hide_stream_item = true
    @stream_item.save

    redirect_to :back
  end

  # GET /stream_items/new
  # GET /stream_items/new.json
  def new
    @stream_item = StreamItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stream_item }
    end
  end

  # GET /stream_items/1/edit
  def edit
    @stream_item = StreamItem.find(params[:id])
  end

  # POST /stream_items
  # POST /stream_items.json
  def create
    @stream_item = StreamItem.new(params[:stream_item])

    respond_to do |format|
      if @stream_item.save
        format.html { redirect_to @stream_item, notice: 'Stream item was successfully created.' }
        format.json { render json: @stream_item, status: :created, location: @stream_item }
      else
        format.html { render action: "new" }
        format.json { render json: @stream_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stream_items/1
  # PUT /stream_items/1.json
  def update
    @stream_item = StreamItem.find(params[:id])

    respond_to do |format|
      if @stream_item.update_attributes(params[:stream_item])
        format.html { redirect_to @stream_item, notice: 'Stream item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stream_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stream_items/1
  # DELETE /stream_items/1.json
  def destroy
    @stream_item = StreamItem.find(params[:id])
    @stream_item.destroy

    respond_to do |format|
      format.html { redirect_to stream_items_url }
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
