# 自社Q&Aチャットボットアプリ データベース設計

このアプリは、ユーザーの質問に対して自社Q&Aデータベースから自動回答を返すシンプルなチャットボットです。

---

## テーブル一覧

### 1. question_answers テーブル（Q&Aデータ格納）

| カラム名   | 型       | 制約               | 説明                     |
|------------|----------|--------------------|--------------------------|
| id         | integer  | 主キー、自動採番   | レコードの一意ID         |
| question   | text     | null: false        | ユーザーが質問する内容   |
| answer     | text     | null: false        | その質問に対する回答     |
| created_at | datetime | null: false        | レコード作成日時         |
| updated_at | datetime | null: false        | レコード更新日時         |

---

### 2. messages テーブル（チャットメッセージ履歴）

| カラム名   | 型       | 制約               | 説明                               |
|------------|----------|--------------------|----------------------------------|
| id         | integer  | 主キー、自動採番   | レコードの一意ID                   |
| user       | string   | null: false        | 発言者名（例: "User" / "Bot"）    |
| content    | text     | null: false        | 発言内容                           |
| created_at | datetime | null: false        | レコード作成日時                   |
| updated_at | datetime | null: false        | レコード更新日時                   |

---

## ER図（エンティティ・リレーション）

