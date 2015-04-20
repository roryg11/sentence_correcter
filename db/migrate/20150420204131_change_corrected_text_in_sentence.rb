class ChangeCorrectedTextInSentence < ActiveRecord::Migration
  def change
    change_column :sentences, :corrected_text, :text
  end
end
