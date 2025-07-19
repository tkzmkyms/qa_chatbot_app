class CreateQuestionAnswers < ActiveRecord::Migration[8.0]
  def change
    create_table :question_answers do |t|
      t.text :question
      t.text :answer

      t.timestamps
    end
  end
end
