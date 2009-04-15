class DoctiposController < ApplicationController
  layout "administracion"
  # GET /doctipos
  # GET /doctipos.xml
  def index
    @doctipos = Doctipo.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @doctipos }
    end
  end

  # GET /doctipos/1
  # GET /doctipos/1.xml
  def show
    @doctipo = Doctipo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @doctipo }
    end
  end

  # GET /doctipos/new
  # GET /doctipos/new.xml
  def new
    @doctipo = Doctipo.new
    
     flash[:back] = request.referer
     
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @doctipo }
    end
  end

  # GET /doctipos/1/edit
  def edit
    @doctipo = Doctipo.find(params[:id])
  end

  # POST /doctipos
  # POST /doctipos.xml
  def create
    @doctipo = Doctipo.new(params[:doctipo])
  

    respond_to do |format|
      if @doctipo.save
      
       flash[:notice] = 'EL tipo d edocumento fue creado exitosamente.'
        format.html { redirect_to(flash[:back] || @doctipo) }
        format.xml  { render :xml => @doctipo, :status => :created, :location => @doctipo }

      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @doctipo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /doctipos/1
  # PUT /doctipos/1.xml
  def update
    @doctipo = Doctipo.find(params[:id])

    respond_to do |format|
      if @doctipo.update_attributes(params[:doctipo])
        flash[:notice] = 'Doctipo was successfully updated.'
        format.html { redirect_to(@doctipo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @doctipo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /doctipos/1
  # DELETE /doctipos/1.xml
  def destroy
    @doctipo = Doctipo.find(params[:id])
    @doctipo.destroy

    respond_to do |format|
      format.html { redirect_to(doctipos_url) }
      format.xml  { head :ok }
    end
  end
end
