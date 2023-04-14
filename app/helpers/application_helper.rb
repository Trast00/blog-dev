module ApplicationHelper
  def flash_error
    html = ''
    html += content_tag(:span, flash[:error], class: 'error-message') if flash[:error].present?
    html.html_safe
  end

  def flash_success
    html = ''
    html += content_tag(:span, flash.now[:success], class: 'success-message') if flash.now[:success].present?
    html.html_safe
  end
end
