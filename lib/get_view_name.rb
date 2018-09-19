require "get_view_name/version"

module GetViewName
  def render_template(template, layout_name = nil, locals = nil)
    @view.instance_variable_set(:@view_name, extract_file_name(template.identifier))
    @view.define_singleton_method(:view_name) { instance_variable_get(:@view_name) }
    super(template, layout_name, locals)
  end

  def extract_file_name(fullpath)
    fullpath.split('/').last.split('.').first
  end
end

ActionView::TemplateRenderer.class_eval do
  prepend GetViewName
end
