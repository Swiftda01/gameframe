module Admin
  private
  def authorise_admin
    unless current_user && current_user.is_admin
      redirect_to root_url, notice: "You are not authorised to view this page"
    end
  end
end