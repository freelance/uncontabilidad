class TransactionsController < ApplicationController
  layout "administracion"
  before_filter :get_account

  # GET /transactions
  # GET /transactions.xml
  def index
    @transactions = @account.history

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transactions }
    end
  end

  # GET /transactions/1
  # GET /transactions/1.xml
  def show
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      format.xml  { render :xml => @transaction }
    end
  end

  # GET /transactions/new
  # GET /transactions/new.xml
  def new
    @transaction = Transaction.new
    @transaction.from = @account

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transaction }
    end
  end

  # GET /transactions/1/edit
  def edit
    @transaction = Transaction.find(params[:id])
  end

  # POST /transactions
  # POST /transactions.xml
  def create
    @transaction = Transaction.new(params[:transaction])

    respond_to do |format|
      begin
        @transaction.save!
      rescue Account::BalanceException => e
        logger.error e
        flash[:error] = e.message
        
        format.html { render :action => "new" }
        format.xml  {
          xml = Builder::XmlMarkup.new
          xml.instruct!
          xml.errors{|e|e.error(e.message)}
          render :xml => xml, :status => :unprocessable_entity
        }
      rescue Exception => e
        logger.error e
        format.html { render :action => "new" }
        format.xml  { render :xml => @transaction.errors, :status => :unprocessable_entity }
      else
        flash[:notice] = 'Transaction was successfully created.'
        format.html { redirect_to(account_transactions_path(@account)) }
        format.xml  { render :xml => @transaction, :status => :created, :location => @transaction }
      end
    end
  end

  # PUT /transactions/1
  # PUT /transactions/1.xml
  def update
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      if @transaction.update_attributes(params[:transaction])
        flash[:notice] = 'Transaction was successfully updated.'
        format.html { redirect_to(account_transactions_path(@account)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.xml
  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to(account_transactions_path(@account)) }
      format.xml  { head :ok }
    end
  end

  private
  def get_account
    @account = Account.find(params[:account_id])
  end
end
