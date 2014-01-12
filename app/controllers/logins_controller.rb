class LoginsController < ApplicationController
  
  # GET /logins
  # GET /logins.json
  def index
    @logins = Login.page(params[:page]).per_page(14)
    @user = User.new
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @logins }
    end
  end

  # GET /logins/1
  # GET /logins/1.json
  def show
    @login = Login.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @login }
    end
  end

  # GET /logins/new
  # GET /logins/new.json
  def new
    @login = Login.new
    @user = User.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @login }
    end
  end

  # GET /logins/1/edit
  def edit
    @login = Login.find(params[:id])
  end

  # POST /logins
  # POST /logins.json
  def create
    
    @user = User.where(:nick => params[:user][:nick], :password => params[:user][:password]).first
    
    if @user
      
    end
    
    respond_to do |format|  
      if @user
        Login.create(:user => @user.id)
        if @user.tipe == 0
          format.html { redirect_to user_admin_path, notice: 'Benvido!!' }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { redirect_to @user, notice: 'Benvido!!' }
          format.json { render json: @user, status: :created, location: @user }
        end
      else
        format.html { redirect_to new_login_url, notice: 'O usuario non existe na Base de Datos' }
        format.json { head :no_content }
      end
    end 
     
  end

  # PUT /logins/1
  # PUT /logins/1.json
  def update
    @login = Login.find(params[:id])

    respond_to do |format|
      if @login.update_attributes(params[:login])
        format.html { redirect_to edit_login_path(@login), notice: 'Gardado!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @login.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logins/1
  # DELETE /logins/1.json
  def destroy
    @login = Login.find(params[:id])
    @login.destroy

    respond_to do |format|
      format.html { redirect_to logins_url, notice: 'Acceso eliminado' }
      format.json { head :no_content }
    end
  end
  
end
