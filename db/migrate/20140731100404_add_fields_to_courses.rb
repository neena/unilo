class AddFieldsToCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :salary_6m
    add_column :courses, :salary_6m_raw, :integer
    add_column :courses, :salary_6m, :float

    remove_column :courses, :fee
    add_column :courses, :fee_raw, :integer
    add_column :courses, :fee, :float

    add_column :courses, :work_study, :float
    add_column :courses, :ucas, :string

    # NSS results
    add_column :courses, :explanation_quality, :float
    add_column :courses, :interesting, :float
    add_column :courses, :enthusiastic, :float
    add_column :courses, :intellectually_stimulating, :float
    add_column :courses, :prompt_feedback, :float
    add_column :courses, :library, :float
    add_column :courses, :accessible_it, :float
    add_column :courses, :accessible_equipment, :float
    add_column :courses, :confidence, :float 

    add_column :courses, :supervised_time, :float
    add_column :courses, :assessment_by_cw, :float
  end
end
