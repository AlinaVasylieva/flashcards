class SorceryCore < ActiveRecord::Migration
  def change
     add_column :users, :crypted_password, :string
     add_column :users, :salt, :string
     add_column :users, :provider, :string
     add_column :users, :uid, :string
     add_column :users, :name, :string
     add_column :users, :avatar_url, :string
     remove_column :users, :password
  end
end
