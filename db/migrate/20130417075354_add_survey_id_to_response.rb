class AddSurveyIdToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :survey_id, :integer
  end
end
