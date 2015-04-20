class AddCorrectedTextToSentence < ActiveRecord::Migration
  def change
    add_column :sentences, :corrected_text, :string
    add_column :sentences, :deletions, :string
    add_column :sentences, :additions, :string
  end
end
