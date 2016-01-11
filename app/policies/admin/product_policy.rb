# class Admin::ProductPolicy < ApplicationPolicy
#   attr_reader :current_user, :target

#   def initialize(current_user, target=nil)
#     @current_user = current_user
#     @target = target
#   end

#   def new?
#     @current_user.admin?
#   end

#   def create?
#     @current_user.admin?
#   end

#   def index?
#     @current_user.admin?
#   end

#   def show?
#     @current_user.admin?
#     # scope.where(:id => target.id).exists?
#   end

#   def modify?
#     @current_user.admin?
#   end

#   alias_method :update?,  :modify?
#   alias_method :edit?,    :modify?
#   alias_method :destroy?, :modify?
