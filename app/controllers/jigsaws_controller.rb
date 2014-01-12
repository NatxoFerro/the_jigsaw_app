class JigsawsController < ApplicationController
  
  
  # GET /jigsaws
  # Lista de xogos
  def index
    
    @jigsaws = Jigsaw.page(params[:page]).per_page(14)
    
    @students_count = 0
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jigsaws }
    end
    
  end


  # GET /jigsaws/:id
  # Mostrar atributos dun xogos
  def show
    
    @jigsaw = Jigsaw.find(params[:id])
    @documents = @jigsaw.documents.all
    @groups = @jigsaw.groups.all
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @jigsaw }
    end
    
  end


  # GET /jigsaws/new
  # Engadir un xogo
  def new
    
    @jigsaw = Jigsaw.new
    @user = User.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @jigsaw }
    end
    
  end


  # GET /jigsaws/:id/edit
  # Actualizar info dun xogo
  def edit
    
    @jigsaw = Jigsaw.find(params[:id])
    
    if @jigsaw.user.blank?
      @user = User.new 
    else
      @user = @jigsaw.user 
    end
    
    respond_to do |format|
      format.html # edit.html.erb
      format.json { render json: @jigsaw }
    end
    
  end
   
   
  # POST /jigsaws
  # Engadir un xogo
  def create
    
    @jigsaw = Jigsaw.new(params[:jigsaw])
    
    if params[:user][:name].blank?
      @jigsaw.user = nil
    else
      @jigsaw.user = User.where(:name => params[:user][:name]).first  
    end
    
    respond_to do |format|
      if @jigsaw.save
        format.html { redirect_to jigsaws_url, notice: 'O xogo xerouse correctamente.' }
        format.json { render json: @jigsaw, status: :created, location: @jigsaw }
      else
        @user = User.new
        format.html { render action: "new" }
        format.json { render json: @jigsaw.errors, status: :unprocessable_entity }
      end
    end
    
  end


  # PUT /jigsaws/:id
  # Actualizar info dun xogo
  def update
    
    @jigsaw = Jigsaw.find(params[:id])
    @jigsaw.update_attributes(params[:jigsaw])
    
    if params[:user][:name].blank?
      @jigsaw.user = nil
    else
      @jigsaw.user = User.where(:name => params[:user][:name]).first  
    end
    
    respond_to do |format|
      if @jigsaw.save
        format.html { redirect_to edit_jigsaw_url, notice: 'O xogo actualizouse correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @jigsaw.errors, status: :unprocessable_entity }
      end
    end
    
  end


  # DELETE /jigsaws/:id
  # Eliminar un xogo
  def destroy
    
    @jigsaw = Jigsaw.find(params[:id])
    
    if @jigsaw.user.blank?
      @jigsaw.destroy
    elsif User.find(@jigsaw.user).valid?
      @user = User.find(@jigsaw.user)
      @user.jigsaws.delete(@jigsaw)
    else
      @jigsaw.destroy  
    end  
    
    respond_to do |format|
      format.html { redirect_to jigsaws_url, notice: 'O xogo eliminouse correctamente' }
      format.json { head :no_content }
    end
    
  end
  
  
end
