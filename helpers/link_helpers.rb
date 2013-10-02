module LinkHelpers
  
  def build_path(*args)
     [*args].map{ |a| a.name.parameterize }.unshift('').join('/') + '.html'
  end

  def link_to_composer(composer, &block)
    text = block_given? ? capture_html(&block) : composer.name
    link_to text, build_path(composer)
  end

  def link_to_opera(opera, &block)
    text = block_given? ? capture_html(&block) : opera.name
    composer = composer_of_opera(opera)
    link_to text, build_path(composer, opera)
  end
  
  def link_to_aria(aria, &block)
    text = block_given? ? capture_html(&block) : aria.name
    opera = opera_of_aria(aria)
    composer = composer_of_opera(opera)
    link_to text, build_path(composer, opera, aria)
  end
  
  def breadcrumb(*args)
    
    crumbs = []
    args.each_with_index do |arg, index|
      current = args.length - 1 == index
      path = build_path(*args[0..index])
      
      crumbs << content_tag(:li, link_to(arg.name, path), :class => ('current' if current))
      
    end
    
    content_tag :ul, crumbs.join(''), :class => 'breadcrumbs' 
    
  end
  
  def render_callouts(*args)
    
    rows = ''
    
    path_components = args[0..-2]
    items = args[-1]
    
    while items.any?
      rows << partial('partials/callout_row', :locals => { :items => items[0...4], :path_components => path_components })
      items.slice!(0, 4)
    end
    
    rows
    
  end
  
end