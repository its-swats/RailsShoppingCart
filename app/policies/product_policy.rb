class ProductPolicy < ApplicationPolicy
  attr_reader :current_user, :target

  def initialize(current_user, target=nil)
    @current_user = current_user
    @target = target
  end


# In order for Pundit to work by creating an admin, you must Namespace controllers and views, HOWEVER, you can not create a namespaced policy.  For policy, we had to be very explicit in our naming as seen below.  The first two methods are public pages for non-admin users.  The rest are renamed with admin in the title (e.g. admin_index?).  In the namespaced products controller (Admin::ProductsController in policies/admin/product_policy), the methods contain 'authorize Product' followed by the admin route.  Originally, we had a before do statement with authorize Product, but this did not distinguish between admin and regular user.
# helpful link: http://stackoverflow.com/questions/21255020/using-pundit-with-namespace


#### Public Pages
  def index?
    true
  end

  def show?
    true
    # scope.where(:id => target.id).exists?
  end

#### Admin Only Pages

  def require_admin
    @current_user.admin?
  end

  alias_method :admin_show?,          :require_admin
  alias_method :admin_index?,         :require_admin
  alias_method :admin_create?,        :require_admin
  alias_method :admin_new?,           :require_admin
  alias_method :admin_update?,        :require_admin
  alias_method :admin_edit?,          :require_admin
  alias_method :admin_destroy?,       :require_admin

end
