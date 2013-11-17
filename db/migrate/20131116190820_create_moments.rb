class CreateMoments < ActiveRecord::Migration
  def change
    create_table :moments do |t|
      t.string :title
      t.string :image
      t.text :blog
      t.string :song

      t.timestamps
    end
  end
end
