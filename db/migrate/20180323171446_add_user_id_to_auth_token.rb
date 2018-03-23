class AddUserIdToAuthToken < ActiveRecord::Migration[5.1]
  def change
    add_reference :auth_tokens, :user, index: true
  end
end
