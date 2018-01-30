module DashboardHelper
  def tab_selection
    if @tab == "repositories"
      render "dashboard/repositories"
    elsif @tab == "stars"
      render "dashboard/stars"
    elsif @tab == "followers"
      render "dashboard/followers"
    elsif @tab == "following"
      render "dashboard/following"
    else
      render "dashboard/overview"
    end
  end
end
