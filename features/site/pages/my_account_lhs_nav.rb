class MyAccountLhsNav < SitePrism::Page

  element :page_heading, "h1.ama-page-heading"

  def navigate_to(nav_link_text)
    find("span", :text => nav_link_text).click

    #wait until the target page's title renders
    title_loaded = false
    until (title_loaded)
      if page_heading.text == nav_link_text then title_loaded = true end
      sleep 1
    end

  end

end