module ApplicationHelper
  def submit_button
      '<input type="submit" value="Submit">'.html_safe
  end

  def form_auth
    '<input type="hidden" name="authenticity_token" value="#{form_authenticity_token}">'.html_safe
  end

  def p_(value)
    "<p>#{value}</p>".html_safe
  end

  def li_(value)
    "<li>#{value}</li>".html_safe
  end

  def h2_(value)
    "<h2>#{value}</h2>".html_safe
  end

  def user_link_(user)
    script = <<-HTML
    <a href="#{user_url(user)}">#{user.username}</a>
    HTML
    script.html_safe
  end
end
