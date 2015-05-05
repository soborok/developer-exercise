class Array
  def where(args)
    matching_key = args.keys.first
    matching_value = args.values.first

    if matching_value.class == Regexp
      self.map { |element| element if element[matching_key].match matching_value }.compact
    else
      self.map { |element| element if element[matching_key] == matching_value }.compact
    end
 end
end
