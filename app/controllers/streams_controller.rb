class StreamsController < ApplicationController
  load_and_authorize_resource  except: [:lights_on, :lights_off, :bump, :send_left, :send_right]
  # GET /streams
  # GET /streams.json
  
  layout :compute_layout

  require 'nokogiri'
  require 'open-uri'

  def index
    @streams = nil

    cookies[:filter] = 'wildstar' if params[:filter] && params[:filter] == 'wildstar'
    cookies[:filter] = 'tera' if params[:filter] && params[:filter] == 'tera'
    cookies[:filter] = 'neverwinter' if params[:filter] && params[:filter] == 'neverwinter'
    cookies[:filter] = 'teso' if params[:filter] && params[:filter] == 'teso' || params[:filter] == 'eso'
    cookies[:filter] = 'all' if params[:filter] && params[:filter] == 'all'
    
    if params[:filter] || cookies[:filter]
      if params[:filter] == 'wildstar' || cookies[:filter] == 'wildstar'
        @streams = Stream.where(game: 'wildstar', active: true)
        @streams.sort! {|a, b| b.rank <=> a.rank }
        @game = 'wildstar'
        cookies[:filter]='wildstar'
      end
      if params[:filter] == 'teso' || cookies[:filter] == 'teso' || cookies[:filter] == 'eso'
        @streams = Stream.where(game: 'teso', active: true)
        @streams.sort! {|a, b| b.rank <=> a.rank } 
        @game = 'teso'
        cookies[:filter]='teso'
      end
      if params[:filter] == 'tera' || cookies[:filter] == 'tera'
        @streams = Stream.where(game: 'tera', active: true)
        @streams.sort! {|a, b| b.rank <=> a.rank } 
        @game = 'tera'
        cookies[:filter]='tera'
      end
      if params[:filter] == 'neverwinter' || cookies[:filter] == 'neverwinter'
        @streams = Stream.where(game: 'neverwinter', active: true)
        @streams.sort! {|a, b| b.rank <=> a.rank } 
        @game = 'neverwinter'
        cookies[:filter]='neverwinter'
      end
      if params[:filter] == 'all' || cookies[:filter] == 'all'
        @streams = Stream.where(active: true)
        @streams.sort! {|a, b| b.rank <=> a.rank } 
        @game = 'all'
        cookies[:filter]='all'
      end
      @game_streams = @streams
    else
      @streams ||= Stream.where(game: 'wildstar', active: true)
      @streams.sort! {|a, b| b.rank <=> a.rank }
      @game ||= 'wildstar'
      @game_streams = @streams
    end

    @all_streams = Stream.where(game: @game)
    @all_streams += Stream.where(game: nil)

    @drop_list = Array.new
    
    Word.all.each do |w|
      @drop_list << w.word
    end

    if cookies[:top] && cookies[:top] == 'on'
      @top = true
    elsif cookies[:top] && cookies[:top] == 'off'
      @top = false
    else
      @top = false
    end

    if params[:category]
      @category = params[:category]

      if @category == 'others'
        @streams = @streams.each.select {|s| s.category.nil? || s.category.empty? } 
      elsif @category == 'jb_says_top'
        @top = true
        @category = nil
        cookies[:top]='on'
      elsif @category == 'joey_says_bottom'
        @top = false
        @category = nil
        cookies[:top]='off'
      else 
        @streams = @streams.each.select {|s| s.category.split(" ").include? @category.singularize}
      end
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
    @game = @stream.game
    cookies[:filter]=@game

    if params[:category]
      @category = params[:category]

      if @category == 'others'
        @streams = @streams.each.select {|s| s.category.nil? || s.category.empty? } 
      elsif @category == 'jb_says_top'
        @top = true
        @category = nil
        cookies[:top]='on'
      elsif @category == 'joey_says_bottom'
        @top = false
        @category = nil
        cookies[:top]='off'
      else 
        @streams = @streams.each.select {|s| s.category.split(" ").include? @category.singularize}
      end
    end

    if cookies[:top] && cookies[:top] == 'on'
      @top = true
    elsif cookies[:top] && cookies[:top] == 'off'
      @top = false
    else
      @top = false
    end


    @streams = Stream.where(game: @game, active: true)
    @game_streams = @streams
    if current_user && current_user.admin
      @streams << @stream
    end

    @streams.sort! {|a, b| b.rank <=> a.rank }
    @all_streams = Stream.all

    if request.xhr?
      # respond to Ajax request
    else
      if cookies["big_bump#{@stream.id}"]
        var = cookies["big_bump#{@stream.id}"]
      else 
        cookies["big_bump#{@stream.id}"] = { value: "#{@stream.id}", expires: 1.hour.from_now }
        #bump_it(@stream, 2)
        @stream = Stream.find(params[:id])
      end
    end

    respond_to do |format|
      format.html
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
    cookies["bump#{@stream.id}"] = { value: "#{@stream.id}", expires: 1.hour.from_now }
    
    if cookies["bump#{@stream.id}"]
      if params[:featured]
        bump_it(@stream.id, 3)
      else
        bump_it(@stream.id, 1)
      end
    end

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

  def compute_layout
    if params[:action] == "edit"
      "application"
    elsif params[:action] == "new"
      'application'
    else
      'main_page'
    end
  end
end













