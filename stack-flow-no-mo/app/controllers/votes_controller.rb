class VotesController < ApplicationController
  def q_upvote
    @question = Question.find(params[:question_id])
    if voted?(@question)
      vote = @question.votes.find_by(user: current_user)
      vote.update_attributes(value: 1)
    else
      @question.votes.create(user: current_user, value: 1)
    end
    redirect_to :back
  end

  def q_downvote
    @question = Question.find(params[:question_id])
    if voted?(@question)
      vote = @question.votes.find_by(user: current_user)
      vote.update_attributes(value: -1)
    else
      @question.votes.create(user: current_user, value: -1)
    end
    redirect_to :back
  end

  def a_upvote
    @answer = Answer.find(params[:answer_id])
    if voted?(@answer)
      vote = @answer.votes.find_by(user: current_user)
      vote.update_attributes(value: 1)
    else
      @answer.votes.create(user: current_user, value: 1)
    end
    redirect_to :back
  end

  def a_downvote
    @answer = Answer.find(params[:answer_id])
    if voted?(@answer)
      vote = @answer.votes.find_by(user: current_user)
      vote.update_attributes(value: -1)
    else
      @answer.votes.create(user: current_user, value: -1)
    end
    redirect_to :back
  end

  private
  def voted?(votable)
    votable.votes.pluck(:user_id).include?(current_user.id)
  end

end
