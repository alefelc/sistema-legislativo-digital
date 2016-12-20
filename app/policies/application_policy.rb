class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def user_activities
    return [] if @user.blank?
    if @user.admin?
      Role.select(:activities).distinct.map(&:activities).flatten
    else
      @user.roles.select(:activities).distinct.map(&:activities).flatten
    end
  end

  def inferred_activity(method)
    if @record.class == Class || @record.class == Symbol
      "#{@record.to_s.downcase}:#{method}"
    else
      "#{@record.class.name.downcase}:#{method}"
    end
  end

  def method_missing(name,*args)
    name = name.to_s
    name.last == '?' ? user_activities.include?(inferred_activity(name.delete('?'))) : super
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end
end
