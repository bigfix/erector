ActionController::Base.class_eval do
  def render_widget(widget_class, assigns=nil, options={})
    render :text => Erector::Rails.render(widget_class, self, assigns, options)
  end

  def render_with_erector_widget(*options, &block)
    if options.first.is_a?(Hash) && widget = options.first.delete(:widget)
      render_widget widget, @assigns, options.first
    else
      render_without_erector_widget *options, &block
    end
  end
  alias_method_chain :render, :erector_widget
end
