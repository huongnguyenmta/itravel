module ApplicationHelper
  def full_title page_title = ""
    base_title = t "static_pages.itravel"
    page_title.present? ? "#{page_title} | #{base_title}" : base_title
  end

  def menu_for *args
    args.collect do |tab|
      %(
        <li class="#{'active' if tab[:active]}">
          <a href="#{tab[:url]}">
            #{icon_for tab[:action]}
            #{tab[:action].to_s}
          </a>
        </li>
      )
    end.join.html_safe
  end

  def icon_for action
    case action
    when :index
      "<i class='glyphicon glyphicon-th-list'></i>"
    when :new
      "<i class='glyphicon glyphicon-plus'></i>"
    when :show
      "<i class='glyphicon glyphicon-info-sign'></i>"
    when :edit
      "<i class='glyphicon glyphicon-pencil'></i>"
    end
  end
end
