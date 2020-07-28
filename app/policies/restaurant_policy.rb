class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # scope.where(user: user)
    end
  end

  def create?
    # quien puede crear un restaurante?
    true
  end

  def new?
    create?
  end

  def show?
    true
  end

  def update?
    # user - current_user
    # record - el record que mandamos en authorize desde el controlador
    user == record.user || user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    user == record.user || user.admin?
  end
end
