module OperaHelpers
  
  def composers
    data.composers.sort_by(&:surname).map do |composer|
      
      def composer.image_src
        "/images/composers/#{self.name.parameterize}.jpg"
      end
      
      composer
      
    end
  end
  
  def operas(composer = nil)
    operas = composer ? operas_by_composer(composer) : data.operas
    operas.sort_by(&:sort_key).map do |opera|
      
      def opera.image_src
        "/images/operas/#{self.name.parameterize}.jpg"
      end
      
      opera
      
    end
  end

  def arias(opera = nil)
    arias = opera ? arias_in_opera(opera) : data.arias
    arias.sort_by(&:sort_key).map do |aria|

      def aria.libretto?
        !(libretto || '').empty?
      end

      def aria.libretto_english?
        !(libretto_english || '').empty?
      end

      def aria.image_src
        "/images/arias/#{self.name.parameterize}.jpg"
      end
      
      aria
      
    end
  end
  
  def operas_by_composer(composer)
    data.operas.select{ |o| o.composer_name == composer.name }
  end

  def composer_of_opera(opera)
    data.composers.find{ |c| c.name == opera.composer_name }
  end
  
  def arias_in_opera(opera)
    data.arias.select{ |a| a.opera_name == opera.name  }
  end

  def opera_of_aria(aria)
    data.operas.find{ |o| o.name == aria.opera_name }
  end
  
  def libretti_of_aria(aria)
    
    libretti = []
    libretti << { :text => aria.libretto, :is_english => false, :has_english => aria.libretto_english?  } if aria.libretto?
    libretti << { :text => aria.libretto_english, :is_english => true, :has_english => aria.libretto_english? } if aria.libretto_english?
    libretti.each{ |l| l[:text].gsub!(/\n/, "  \n")  }
    libretti
    
  end
  
  def headliners
    
    headliners = []
    hash_builder = lambda{ |*args|
      {
        :name      => args.last.name, 
        :url       => build_path(*args)[1..-1], 
        :image_src => args.last.image_src[1..-1]
      }
    }
    
    composers.each do |composer|
      headliners << hash_builder.call(composer)
    end
    
    operas.each do |opera|
      composer = composer_of_opera(opera)
      headliners << hash_builder.call(composer, opera)
    end

    arias.each do |aria|
      opera = opera_of_aria(aria)
      composer = composer_of_opera(opera)
      headliners << hash_builder.call(composer, opera, aria)
    end
    
    headliners
    
  end
  
end