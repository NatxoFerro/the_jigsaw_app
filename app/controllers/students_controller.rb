class StudentsController < ApplicationController
  
  def index
  end


  def new
  end


  # GET /games/:game_id/students/:id/edit
  # Engadir estudante a un grupo
  def edit
    
    @student = User.find(params[:id])
    
    @max_groups = 4
    @saveit  = true
    
    if params[:group_id].nil?
      @game = Jigsaw.find(params[:game_id])
      if @game.groups.empty?
        @group = @game.groups.create()
      end
      @group = @game.groups.last
      if (@game.documents.count <= @group.users.count)
        if (@game.groups.count < @max_groups)
          @group = @game.groups.create()
        else
          @saveit = false  
        end
      end
    else
      @group = Group.find(params[:group_id])
      @game = @group.jigsaw
    end  
      
    if @saveit
      @group.users<<(@student)
      @group.save
      redirect_to game_groups_path(@game), notice: 'Estudante engadido'
    else 
      redirect_to game_groups_path(@game), notice: 'Non se poden engadir mais grupos'
    end
               
  end


  # GET /student/:id
  # Amosar xogos dun estudante
  def show
    
    @student = User.find(params[:id])
    
  end


  # DELETE /groups/:group_id/students/:id
  # Eliminar estudante dun grupo
  def destroy
    
    @group = Group.find(params[:group_id])
    @student = User.find(params[:id])
    @game = @group.jigsaw
    
    @group.users.delete(@student)
    
    if @group.users.empty?
      @group.destroy()
    end
      
    redirect_to game_groups_path(@game), notice: 'Estudante eliminado'
    
  end
  
  
  def create
    @group = Group.find(params[:group_id])
    @student = User.where(params[:user])
    
    redirect_to new_group_student_path
  end
  
  
end
