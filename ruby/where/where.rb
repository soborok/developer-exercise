class Array
  def where(args)
    matching_keys = args.keys
    matching_values = args.values

    all_elements = self.dup

    matching_keys.each do |key|
      all_elements.delete_if do |element| 
       if args[key].class == Regexp
          !element[key].match args[key] 
        else
          element[key] != args[key] 
        end
      end
    end
    all_elements
  end
end
