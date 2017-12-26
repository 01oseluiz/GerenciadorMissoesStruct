module ApplicationHelper
  def flash_mensagem
    messages = ""
    [:notice, :info, :warning, :error].each do |type|
      if flash[type]
        messages += "<p id= #{type} class= #{type}>#{flash[type]}</p>"
      end
    end

    messages.html_safe
  end
end
