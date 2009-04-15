class AccountsController < ApplicationController
  layout 'administracion'
   before_filter :login_required
 require_role "admin", :for => :destroy # don't allow contractors to destroy
 

  def show
    @account = Account.find(params[:id])
    redirect_to( account_transactions_path(@account))
  end

  def index
    @accounts = Account.all( :order => :code )
  end

  def list
    @all_accounts = Account.find(:all, :order => "name")
  end

  def new
    @account = Account.new
  end
  
# GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
  end

  def create
    @account = Account.new(params[:account])

    respond_to do |format|
      if @account.save
        flash[:notice] = 'account was successfully.'        
        format.html { redirect_to accounts_url }
        #format.html { redirect_to account_path(@account) }
        format.js
      else
        format.html { render :action => "new" }
      end
    end
  end

 # PUT /departamentos/1
  # PUT /departamentos/1.xml
  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        flash[:notice] = 'Cuentas fue actualizado correctamente.'
        #format.html { redirect_to(@account) }
        format.html { redirect_to(@account) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url }
      format.xml  { head :ok }
    end
  end
end
