class GroupsController < ApplicationController
  
  # games/:game_id/groups
  # listar grupos/estudantes dun xogo
  def index
    
    @game = Jigsaw.find(params[:game_id])
    @groups = @game.groups
    @user = User.find(@game.user)
    @users = User.where(:tipe => 2).page(params[:page]).per_page(10)
    @group = @groups.last
    @groups_count = 0
    @max_groups = 4
    @groups_countbis = 0
    
    @students = 0
    @number_of_students_error = 0
    @groups.each do |group|
      @students += group.users.count
      if @game.documents.count != group.users.count
        @number_of_students_error = 1
      end
    end
    
  end
  
  
  def create
    
    @game = Jigsaw.find(params[:jigsaw_id])
    @group = @game.groups.create(params[:group])

    redirect_to post_path(@game)
    
  end
  
  
  # groups/:id
  # eliminar grupo dun xogo
  def destroy
    
    @group = Group.find(params[:id])
    @game = @group.jigsaw
    
    @group.destroy

    redirect_to game_groups_path(@game), notice: 'Grupo eliminado correctamente' 
    
  end
  
  
  # game/:game_id/groups/:id/new
  # xerar grupo de xogo
  def new
    
    @game = Jigsaw.find(params[:game_id])
    @group = @game.groups.create()
    
    redirect_to game_groups_path(@game), notice: 'Grupo engadido correctamente'
    
  end
  
end
