class XmlDocument
  def initialize(indent = false)
    @indent = indent
  end

  def method_missing(method_name, *args, &block)
    indent_level = 0
    @xmldoc = ""
    @xmldoc += "<#{method_name}"
    add_attributes(args)
    if block_given? # tag has content
      @xmldoc += ">"
      @xmldoc += yield
      @xmldoc += "</#{method_name}>"
    else
      @xmldoc += "/>"
    end
  end

  private

  def add_attributes(args)
    if args.count > 0
      @xmldoc += " "
      args.each do |hash|
        hash.each do |key, value|
          @xmldoc += "#{key}='#{value}'"
        end
      end
    end
  end
end