class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :summary
      t.string :content

      t.timestamps
    end
  end
end
