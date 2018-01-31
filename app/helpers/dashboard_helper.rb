module DashboardHelper
  def tab_data(tab)
    if tab == "repositories"
      render "dashboard/repositories"
    elsif tab == "stars"
      render "dashboard/stars"
    elsif tab == "followers"
      render "dashboard/followers"
    elsif tab == "following"
      render "dashboard/following"
    else
      render "dashboard/overview"
    end
  end

  def tab_select(this_tab)
    if @presenter.tab == this_tab
      true
    elsif @presenter.tab.nil? && this_tab == "overview"
      true
    end
  end
end
