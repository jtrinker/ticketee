class RemoveUserIdFromTickets < ActiveRecord::Migration
  def change
  	remove_column :tickets, :user_id
  end
end
