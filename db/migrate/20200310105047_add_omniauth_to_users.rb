class AddOmniauthToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :name, :string
    add_column :users, :username, :string
    add_column :users, :avatar_url, :string
    add_column :users, :profile_url, :string
    add_column :users, :token, :string
    add_column :users, :secret, :string
  end
end
