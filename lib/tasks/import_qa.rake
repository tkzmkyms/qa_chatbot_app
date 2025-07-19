namespace :import do
  desc "Q&AデータをCSVからインポートするタスク"
  task qa: :environment do
    require "csv"

    # CSVファイルのパス（lib/assets/qa.csvを想定）
    file_path = Rails.root.join("lib/assets/qa.csv")

    puts "📥 CSVインポート開始: #{file_path}"

    # CSVファイルをヘッダー付きで1行ずつ読み込み
    CSV.foreach(file_path, headers: true, encoding: "UTF-8") do |row|
      # 1行ごとにQuestionAnswerモデルに登録
      QuestionAnswer.create!(
        question: row["question"].strip,
        answer: row["answer"].strip
      )
    end

    puts "✅ CSVインポートが完了しました！"
  end
end
