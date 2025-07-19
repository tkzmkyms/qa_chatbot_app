class ChatController < ApplicationController
  def index
    session[:chat_history] ||= []
    Rails.logger.debug "💬 セッション内容: #{session[:chat_history].inspect}"
    @messages = session[:chat_history]
  end

  def create
    question = params[:question]

    matched_qa = QuestionAnswer.find_by("question LIKE ?", "%#{question}%")
    answer = matched_qa ? matched_qa.answer : "すみません、その質問にはまだ対応していません。"

    session[:chat_history] ||= []
    session[:chat_history] << { user: "User", content: question }
    session[:chat_history] << { user: "Bot", content: answer }

    redirect_to root_path
  end
end
