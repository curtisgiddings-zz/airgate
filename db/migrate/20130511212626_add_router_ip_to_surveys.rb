class AddRouterIpToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :router_ip, :string
  end
end
