class UsersController < ApplicationController
  
  http_basic_authenticate_with name: "root", password: "root", only: [:index]
  
    
  # GET /users
  # Lista de usuarios
  def index
    
    @users = User.page(params[:page]).per_page(14)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
    
  end


  # GET /users/:id/admin
  # Lista de opcións para administradores
  def admin
    
  end
  
  
  # GET /users/:id
  # Páxina principal de usuario
  def show
    
    @user = User.find(params[:id])
    @jigsaws = @user.jigsaws
    @groups = @user.groups
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
    
  end

  # GET /users/new
  # Engadir usuario á plataforma
  def new
    
    @user = User.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
    
  end


  # GET /users/1/edit
  # Editar información do usuario
  def edit
    
    @user = User.find(params[:id])
    
  end

  # POST /users
  # Engadir usuario á plataforma
  def create
    
    @user = User.new(params[:user])
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to new_user_path, notice: 'Usuario engadido correctamente' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PUT /users/1
  # Editar información do usuario
  def update
    
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to edit_user_path(@user), notice: 'Usuario gardado correctamente' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    
  end


  # DELETE /users/1
  # Eliminar usuario
  def destroy
    
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Usuario eliminado correctamente' }
      format.json { head :no_content }
    end
    
  end
  
end
