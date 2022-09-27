# frozen_string_literal: true

# class NilClassPolicy < ApplicationPolicy
class NilClassPolicy < ApplicationPolicy
  # class NilClassPolicy::Scope < ApplicationPolicy::Scope
  class Scope < Scope
    def resolve
      raise Pundit::NotDefinedError, 'Cannot scope NilClass'
    end
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end
end
