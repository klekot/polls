class CreateQuestion < ActiveRecord::Migration[5.0]
  def change
    create_table :question do |t|
      t.text :question
    end
  end
end
