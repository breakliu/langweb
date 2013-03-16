class TypesController < ApplicationController
  before_filter :authenticate_user!, except: [:show]
  # GET /types
  # GET /types.json
  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @types = Type.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @types }
    end
  end

  # GET /types/1
  # GET /types/1.json
  def show
    #authorize! :show, @user, :message => 'Not authorized as an administrator.'
    @type = Type.find(params[:id])
    @posts = @type.posts.page params[:page]

    respond_to do |format|
      format.html { render layout: 'type_layout' }# show.html.erb
      format.json { render json: @type }
    end
  end

  # GET /types/new
  # GET /types/new.json
  def new
    authorize! :new, @user, :message => 'Not authorized as an administrator.'
    @type = Type.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @type }
    end
  end

  # GET /types/1/edit
  def edit
    authorize! :edit, @user, :message => 'Not authorized as an administrator.'
    @type = Type.find(params[:id])
  end

  # POST /types
  # POST /types.json
  def create
    authorize! :create, @user, :message => 'Not authorized as an administrator.'
    @type = Type.new(params[:type])

    respond_to do |format|
      if @type.save
        format.html { redirect_to @type, notice: 'Type was successfully created.' }
        format.json { render json: @type, status: :created, location: @type }
      else
        format.html { render action: "new" }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /types/1
  # PUT /types/1.json
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @type = Type.find(params[:id])

    respond_to do |format|
      if @type.update_attributes(params[:type])
        format.html { redirect_to @type, notice: 'Type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /types/1
  # DELETE /types/1.json
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    @type = Type.find(params[:id])
    @type.destroy

    respond_to do |format|
      format.html { redirect_to types_url }
      format.json { head :no_content }
    end
  end
end
