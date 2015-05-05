class Array
  def where(args)
    matching_key = args.keys.first
    matching_value = args.values.first

    all_elements = self.dup

    all_elements.delete_if do |element| 
     if matching_value.class == Regexp
        !element[matching_key].match args[matching_key] 
      else
        element[matching_key] != args[matching_key] 
      end
    end
  end
end
