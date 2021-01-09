class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :content
      t.integer :user_id
      t.integer :village_id
      t.integer :job_id

      t.timestamps
    end
  end
end
