module Jekyll

  module Filters
    def textilize(input)
      RedCloth.new(input).to_html
    end
    
    def markdown(input)
        if defined? RDiscount
          RDiscount.new(input || '').to_html 
        else
          #techniclally, during testing this ignores the configuration settings
          #in site.rb, but at runtime it shouldn't be an issue
          Maruku.new(input).to_html
        end
    end    

    def date_to_string(date)
      date.strftime("%d %b %Y")
    end

    def date_to_long_string(date)
      date.strftime("%d %B %Y")
    end

    def date_to_xmlschema(date)
      date.xmlschema
    end

    def xml_escape(input)
      CGI.escapeHTML(input)
    end

    def cgi_escape(input)
      CGI::escape(input)
    end

    def number_of_words(input)
      input.split.length
    end

    def array_to_sentence_string(array)
      connector = "and"
      case array.length
      when 0
        ""
      when 1
        array[0].to_s
      when 2
        "#{array[0]} #{connector} #{array[1]}"
      else
        "#{array[0...-1].join(', ')}, #{connector} #{array[-1]}"
      end
    end

  end
end
