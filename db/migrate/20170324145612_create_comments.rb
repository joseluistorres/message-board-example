class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
