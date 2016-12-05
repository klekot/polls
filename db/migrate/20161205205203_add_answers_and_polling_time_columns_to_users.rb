class AddAnswersAndPollingTimeColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :answers, :string
    add_column :users, :polling_time, :string
  end
end
