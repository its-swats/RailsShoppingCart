class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :target

  def initialize(current_user, target=nil)
    @current_user = current_user
    @target = target
  end

  def new?
    true
  end

  def create?
    true
  end

  def index?
    @current_user.admin?
  end

  def show?
    true
    # scope.where(:id => target.id).exists?
  end

  def modify?
    @current_user == @target || @current_user.admin?
  end

  alias_method :update?,  :modify?
  alias_method :edit?,    :modify?
  alias_method :destroy?, :modify?
  # This delegate method for rails will cut the need to use the following three methods.
  # def update?
  #   modify?
  # end

  # def edit?
  #   modify?
  # end

  # def destroy?
  #   modify?
  # end




end
