class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.column :name, :string
      t.column :admin, :integer
      t.column :login,                     :string
      t.column :email,                     :string
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string
      t.column :remember_token_expires_at, :datetime
      
      
    end
    
     User.create(:name => "Daniel ", :admin => 1, :login => "dgonzalez",
    :email => "dgznet@gmail.com", :password => "dgonzalez",
    :password_confirmation => "dgonzalez").save
    
    User.create(:name => "Adrian", :admin => 1, :login => "aortiz",
    :email => "aortiz@crub.uncoma.edu.ar", :password => "aortiz",
    :password_confirmation => "aortiz").save
    
     User.create(:name => "Jorge", :admin => 1, :login => "jlopez",
    :email => "jlopez@crub.uncoma.edu.ar", :password => "jlopez",
    :password_confirmation => "jlopez").save
    
    User.create(:name => "Contador", :admin => 0, :login => "contador",
    :email => "contador@crub.uncoma.edu.ar", :password => "contador",
    :password_confirmation => "contador").save
    
    
  end

  def self.down
    drop_table "users"
  end
end
