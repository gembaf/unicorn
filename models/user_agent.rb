class UserAgent
  ANDROID = %w(Android)
  IOS = %w(iPhone iPad iPod)

  def initialize(user_agent)
    @ua = user_agent
  end

  def android?
    ANDROID.any? { |s| @ua.include?(s) }
  end

  def ios?
    !android? && IOS.any? { |s| @ua.include?(s) }
  end

  def mobile?
    android? || ios?
  end
end

