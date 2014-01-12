class DocumentsController < ApplicationController
  
  # GET /documents
  # GET /documents.json
  def index
  
    @documents = Document.page(params[:page]).per_page(14)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @documents }
    end
  
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
  
    @document = Document.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document }
    end
  
  end

  # GET /documents/new
  # GET /documents/new.json
  def new
  
    @document = Document.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @document }
    end
  
  end

  # GET /documents/1/edit
  def edit
  
    @document = Document.find(params[:id])
    
  end

  # POST /documents
  # POST /documents.json
  def create
  
    if params[:jigsaw] == nil
    
      @document = Document.new(params[:document])  
      
      respond_to do |format|
        if @document.save
          format.html { redirect_to new_document_url, notice: 'Documento xerado correctamente' }
          format.json { render json: @document, status: :created, location: @document }
        else
          format.html { render action: "new" }
          format.json { render json: @document.errors, status: :unprocessable_entity }
        end
      end
    
    elsif
    
    @jigsaw = Jigsaw.where(:title => params[:jigsaw][:title]).first
   
    @document = Document.new
    @document.name = params[:document][:name]
    @document.description = params[:document][:description]
    @document.URL = params[:document][:URL]
    @document.resource_type = "Jigsaw"
    @document.resource_id = @jigsaw.id
    
    @jigsaw.phase = "1"
    @jigsaw.save
    
    #@document = @jigsaw.documents.create(params[:document])
    #show: redirect_to @jigsaw
    #redirect_to edit_jigsaw_url(@jigsaw)
    #@document = Document.new(params[:document])

    respond_to do |format|
      if @document.save
        format.html { redirect_to edit_jigsaw_url(@jigsaw), notice: 'Documento engadido correctamente' }
        format.json { render json: @document, status: :created, location: @document }
      else
        format.html { render action: "new" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  
    end
    
  end

  # PUT /documents/1
  # PUT /documents/1.json
  def update
  
    @document = Document.find(params[:id])

    respond_to do |format|
      if @document.update_attributes(params[:document])
        format.html { redirect_to edit_document_path(@document), notice: 'Documento gardado correctamente' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
  
    @document = Document.find(params[:id])
    @document.destroy

    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Documento eliminado correctamente' }
      format.json { head :no_content }
    end
  end

end