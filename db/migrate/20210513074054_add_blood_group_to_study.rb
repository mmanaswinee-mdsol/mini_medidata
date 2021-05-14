class AddBloodGroupToStudy < ActiveRecord::Migration[6.1]
  def change
    add_column :studies, :blood_group, :string, default: [].to_yaml ,array: true
  end
end
