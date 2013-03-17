# My RAFFLER application worked correctly like the screencast.

class EntriesController < ApplicationController
  def admin
    @entries = Entry.all

    render action: 'index', template: 'entries/admin'
  end

  # GET /entries
  # GET /entries.json
  def index
    @entry = Entry.new
    @entries = Entry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entries }
    end
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
    @entry = Entry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/new
  # GET /entries/new.json
  def new
    @entry = Entry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/1/edit
  def edit
    @entry = Entry.find(params[:id])
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(params[:entry])

    respond_to do |format|
      if @entry.save
        format.html { redirect_to entries_path, notice: @entry.name + ' entry was successfully created.' }
        format.json { render json: @entry, status: :created, location: @entry }
      else
        format.html { render action: "new" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.json
  def update
    @entry = Entry.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to entries_url }
      format.json { head :no_content }
    end
  end

  def winner
    Entry.update_all(:winner => false)
    @entry = Entry.find(:all, :order => 'Random()').first
    @entry[:winner] = true
 
    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to entries_path, notice: @entry.name + ' is a winner.' }
        format.json { render json: @entry, status: :created, location: @entry }
      else
        format.html { redirect_to entries_path, notice: @entry.name + ' entry was unable to be made a winner.' }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end
end
