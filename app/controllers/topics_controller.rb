class TopicsController < ApplicationController
  
  def index
    
    @game = Jigsaw.find(params[:game_id])
    @documents = @game.documents
    @user = User.find(@game.user)
    @document = Document.new
    @document.resource = @game
    
  end


  def edit
    
    @game = Jigsaw.find(params[:game_id])
    @document = Document.find(params[:id])
    
  end


  def show
    
    @game = Jigsaw.find(params[:game_id])
    @document = Document.find(params[:id])
    
  end


  def destroy
  
    @game = Jigsaw.find(params[:game_id])
    @document = Document.find(params[:id])
    @document.destroy

    redirect_to game_topics_path(@game), notice: 'Documento eliminado correctamente'
    
  end

  
  def create
    
    @game = Jigsaw.find(params[:game_id])
    @document = Document.new(params[:document])
      
    respond_to do |format|
      if @document.save
        format.html { redirect_to game_topics_url(@game), notice: 'Documento engadido correctamente' }
        format.json { render json: @jigsaw, status: :created, location: @jigsaw }
      else
        format.html { render action: "new" }
        format.json { render json: @jigsaw.errors, status: :unprocessable_entity }
      end
    end
      
  end
  
  
  def update
  
    @game = Jigsaw.find(params[:game_id])
    @document = Document.find(params[:id])

    respond_to do |format|
      if @document.update_attributes(params[:document])
        format.html { redirect_to edit_game_topic_url(@game, @document), notice: 'Documento gardado' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  
  end
  
end
