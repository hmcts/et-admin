class DiversityResponsePolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end

  end
  def index?
    user.is_admin? || user.permission_names.include?('read_diversity_responses')
  end

  def show?
    user.is_admin? || user.permission_names.include?('read_diversity_responses')
  end

  def update?
    user.is_admin? || user.permission_names.include?('update_diversity_responses')
  end

  def destroy
    user.is_admin? || user.permission_names.include?('delete_diversity_responses')
  end
end
