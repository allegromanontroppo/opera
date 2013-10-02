module TitleHelpers
  
  def title(*args)
    [*args].map(&:name).unshift('Access All Arias').reverse.join(' - ')
  end
  
end