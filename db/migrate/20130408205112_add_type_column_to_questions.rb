class AddTypeColumnToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :type, :integer
  end
end
