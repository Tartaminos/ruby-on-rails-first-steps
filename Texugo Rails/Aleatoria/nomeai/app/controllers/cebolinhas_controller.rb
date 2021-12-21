class CebolinhasController < ApplicationController
  # GET /cebolinhas
  # GET /cebolinhas.json
  def index
    @cebolinhas = Cebolinha.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cebolinhas }
    end
  end

  # GET /cebolinhas/1
  # GET /cebolinhas/1.json
  def show
    @cebolinha = Cebolinha.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cebolinha }
    end
  end

  # GET /cebolinhas/new
  # GET /cebolinhas/new.json
  def new
    @cebolinha = Cebolinha.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cebolinha }
    end
  end

  # GET /cebolinhas/1/edit
  def edit
    @cebolinha = Cebolinha.find(params[:id])
  end

  # POST /cebolinhas
  # POST /cebolinhas.json
  def create
    @cebolinha = Cebolinha.new(params[:cebolinha])

    respond_to do |format|
      if @cebolinha.save
        format.html { redirect_to @cebolinha, notice: 'Cebolinha was successfully created.' }
        format.json { render json: @cebolinha, status: :created, location: @cebolinha }
      else
        format.html { render action: "new" }
        format.json { render json: @cebolinha.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cebolinhas/1
  # PUT /cebolinhas/1.json
  def update
    @cebolinha = Cebolinha.find(params[:id])

    respond_to do |format|
      if @cebolinha.update_attributes(params[:cebolinha])
        format.html { redirect_to @cebolinha, notice: 'Cebolinha was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cebolinha.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cebolinhas/1
  # DELETE /cebolinhas/1.json
  def destroy
    @cebolinha = Cebolinha.find(params[:id])
    @cebolinha.destroy

    respond_to do |format|
      format.html { redirect_to cebolinhas_url }
      format.json { head :no_content }
    end
  end
end
