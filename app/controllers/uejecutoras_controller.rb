class UejecutorasController < ApplicationController
   layout 'administracion'
   before_filter :login_required
  # GET /uejecutoras
  # GET /uejecutoras.xml
  def index
    @uejecutoras = Uejecutora.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @uejecutoras }
    end
  end

  # GET /uejecutoras/1
  # GET /uejecutoras/1.xml
  def show
    @uejecutora = Uejecutora.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @uejecutora }
    end
  end

  # GET /uejecutoras/new
  # GET /uejecutoras/new.xml
  def new
    @uejecutora = Uejecutora.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @uejecutora }
    end
  end

  # GET /uejecutoras/1/edit
  def edit
    @uejecutora = Uejecutora.find(params[:id])
  end

  # POST /uejecutoras
  # POST /uejecutoras.xml
  def create
    @uejecutora = Uejecutora.new(params[:uejecutora])

    respond_to do |format|
      if @uejecutora.save
        flash[:notice] = 'Uejecutora was successfully created.'
        format.html { redirect_to(@uejecutora) }
        format.xml  { render :xml => @uejecutora, :status => :created, :location => @uejecutora }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @uejecutora.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /uejecutoras/1
  # PUT /uejecutoras/1.xml
  def update
    @uejecutora = Uejecutora.find(params[:id])

    respond_to do |format|
      if @uejecutora.update_attributes(params[:uejecutora])
        flash[:notice] = 'Uejecutora was successfully updated.'
        format.html { redirect_to(@uejecutora) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @uejecutora.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /uejecutoras/1
  # DELETE /uejecutoras/1.xml
  def destroy
    @uejecutora = Uejecutora.find(params[:id])
    @uejecutora.destroy

    respond_to do |format|
      format.html { redirect_to(uejecutoras_url) }
      format.xml  { head :ok }
    end
  end
end
