class Dictionary
  attr_accessor :entries, :keywords

  def initialize
    @entries = {}
    @keywords = []
  end

  def add(entry)

    case entry
    when String
      @entries[entry] = nil
      keywords << entry
    when Hash
      entry.each do |key, value|
        @entries[key] = value
        keywords << key
      end
    end
  end


end