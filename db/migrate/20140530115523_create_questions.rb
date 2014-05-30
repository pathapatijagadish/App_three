class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :subject
      t.text :content
      t.integer :flayer_id

      t.timestamps
    end
  end
end
