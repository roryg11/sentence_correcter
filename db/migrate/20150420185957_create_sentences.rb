class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.text :input_text
      t.timestamps
    end
  end
end
