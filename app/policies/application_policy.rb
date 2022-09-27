# frozen_string_literal: true

# class ApplicationPolicy
class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    raise Pundit::NotAuthorizedError, 'must be logged in' unless user

    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    @user == record.user
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    @user == record.user
  end

  def edit?
    update?
  end

  def destroy?
    @user == record.user
  end

  # class ApplicationPolicy::Scope
  class Scope
    def initialize(user, scope)
      raise Pundit::NotAuthorizedError, 'must be logged in' unless user

      @user = user
      @scope = scope
    end

    def resolve
      @scope.where(user: @user)
    end

    private

    attr_reader :user, :scope
  end
end
