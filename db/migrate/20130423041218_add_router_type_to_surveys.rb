class AddRouterTypeToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :router_type, :integer
  end
end
