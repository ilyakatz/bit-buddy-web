module NavHelper

  def nav_item(params, &block)
    content_tag :a, class: "tab-item", href: params[:href] do
      yield block
    end
  end

end
