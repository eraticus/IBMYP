# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def blooms_choices
    [["1 Remembering", 1],["2 Understanding", 2],["3 Applying", 3],["4 Analyzing", 4],["5 Evaluating", 5],["6 Creating", 6]]
  end

  def blooms_text(num)
    entry=blooms_choices.detect{|x| x[1]==num.to_i}
    entry[0] if entry
  end


end
