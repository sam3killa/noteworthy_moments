class AddUserIdToMoments < ActiveRecord::Migration
  def change
    add_reference :moments, :user, index: true
  end
end
