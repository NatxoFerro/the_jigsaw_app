class GamesController < ApplicationController
  # GET /games
  # GET /games.json
  def index
    
    @user = User.find(params[:user_id])
    @games = @user.jigsaws

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Jigsaw.find(params[:id])
    @documents = @game.documents
    @groups = @game.groups
    @user = @game.user
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/new
  # GET /games/new.json
  def new
    
    @user = User.find(params[:user_id])
    @game = Jigsaw.new
    @game.user = @user
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/1/edit
  def edit
    
    @game = Jigsaw.find(params[:id])
    @user = @game.user
    
  end

  # POST /games
  # POST /games.json
  def create
    
    @user = User.find(params[:user_id])
    @game = Jigsaw.new(params[:jigsaw])
        
    respond_to do |format|
      if @game.save
        format.html { redirect_to user_games_path(@user), notice: 'Xogo xerado correctamente' }
        format.json { render json: @game, status: :created, location: @game }
      else
        format.html { render action: "new" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.json
  def update
    @game = Jigsaw.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:jigsaw])
        format.html { redirect_to edit_game_path(@game), notice: 'Xogo gardado correctamente' }
        format.json { head :no_content }
      else
        format.html { redirect_to edit_game_path(@game), notice: 'Errou a actualizacion do xogo' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # users/:user_id/games/:id
  # eliminar xogo dun usuario
  def destroy
    
    @user = User.find(params[:user_id])
    @game = Jigsaw.find(params[:id])
    
    @user.jigsaws.delete(@game)

    respond_to do |format|
      format.html { redirect_to user_games_path(@user), notice: 'Xogo eliminado' }
      format.json { head :no_content }
    end
    
  end
  
  
  def editdoc
    
  end
  
  
  def del_docs
    
    @game = Jigsaw.find(params[:id])
    @game.documents.clear
    
    redirect_to game_topics_path(@game), notice: 'Documentos eliminados'
    
  end
  
  
  # student/:id/games/:game_id
  # xogar a un determinado xogo
  def play_game
    
  end
  
  
end
