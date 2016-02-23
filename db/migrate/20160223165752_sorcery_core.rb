class SorceryCore < ActiveRecord::Migration
  def change
    add_column :users, :crypted_password, :string
    add_column :users, :salt, :string
    remove_column :users, :password_digest, :string
  end
end
