class StreamsController < ApplicationController
  load_and_authorize_resource  except: [:lights_on, :lights_off, :bump, :send_left, :send_right]
  # GET /streams
  # GET /streams.json
  
  layout 'application'

  require 'nokogiri'
  require 'open-uri'

  def index
    @streams = nil
    
    if params[:filter] 
      if params[:filter] == 'wildstar'
        @streams = Stream.where(game: 'wildstar')
        @streams.sort! {|a, b| b.rank <=> a.rank }
        @game = 'wildstar'
      end
      if params[:filter] == 'teso'
        @streams = Stream.where(game: 'teso')
        @streams.sort! {|a, b| b.rank <=> a.rank } 
        @game = 'teso'
      end
    end

    @streams ||= Stream.where(game: 'wildstar')
    @streams.sort! {|a, b| b.rank <=> a.rank }
    @game ||= 'wildstar'

    @drop_list = Array.new
    
    Word.all.each do |w|
      @drop_list << w.word
    end
    
    respond_to do |format|
      format.html { render :layout => "main_page" }
      format.json { render json: @streams }
    end
  end

  # GET /streams/1
  # GET /streams/1.json
  def show
    @stream = Stream.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.js
      format.json { render json: @stream }
    end
  end

  # GET /streams/new
  # GET /streams/new.json
  def new
    @stream = Stream.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stream }
    end
  end

  # GET /streams/1/edit
  def edit
    @stream = Stream.find(params[:id])
  end

  # POST /streams
  # POST /streams.json
  def create
    @stream = Stream.new(params[:stream])

    respond_to do |format|
      if @stream.save
        format.html { redirect_to @stream, notice: 'Stream was successfully created.' }
        format.json { render json: @stream, status: :created, location: @stream }
      else
        format.html { render action: "new" }
        format.json { render json: @stream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /streams/1
  # PUT /streams/1.json
  def update
    @stream = Stream.find(params[:id])

    respond_to do |format|
      if @stream.update_attributes(params[:stream])
        format.html { redirect_to @stream, notice: 'Stream was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /streams/1
  # DELETE /streams/1.json
  def destroy
    @stream = Stream.find(params[:id])
    @stream.destroy

    respond_to do |format|
      format.html { redirect_to streams_url }
      format.json { head :no_content }
    end
  end

  def lights_on 
    cookies[:theme]='lights_on'
  end

  def lights_off 
    cookies[:theme]='lights_off'
  end

  def bump
    @stream = Stream.find(params[:id])
    @stream.rank += 1
    @stream.save
  end

  def send_left
    @stream = Stream.find(params[:id])
    if cookies[:order_array]
      order_array = cookies[:order_array].split(",")
    else
      order_array = []
    end
    order_array.insert(0, @stream.id)
    cookies[:order_array] = ""
    order_array.each do |id|
      cookies[:order_array] += "#{id.to_s},"
    end
  end

  def send_right
    @stream = Stream.find(params[:id])
    if cookies[:order_array]
      order_array = cookies[:order_array].split(",")
      order_array[:last] = @stream.id


      cookies[:order_array] = ""
      order_array.each do |id| 
        cookies[:order_array] += "#{id.to_s},"
      end
    end
  end

end













