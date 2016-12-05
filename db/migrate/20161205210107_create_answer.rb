class CreateAnswer < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.text :answer
      t.boolean :correct
      t.references :question, foreign_key: true
    end
  end
end
