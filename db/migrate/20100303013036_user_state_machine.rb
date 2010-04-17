class UserStateMachine < ActiveRecord::Migration
  # this guy allows us to access the User model, even if it gets erased in the future! fancy!
  # we need to do this in order to set the new :user_state column to active for old users created 
  # before this existed
  class User < ActiveRecord::Base
  end
  
  def self.up
    add_column :users, :user_state, :string, :null => false, :precision => 50
    User.update_all(:user_state => "active")
  end

  def self.down
    remove_column :users, :user_state
  end
end
