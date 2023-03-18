class ChangeGenderColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :students, :gender, :pronouns
  end
end
