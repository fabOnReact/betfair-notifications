class Array
  def flat_structure
    output = []
    self.each do |hash|
      output << hash.event_format if hash["marketCount"]
      output << hash.catalog_format if hash["runners"]
    end
    output
  end

  def filter_by id
    select{|hash| hash["selectionId"] == id}.first
  end

  def maximum
    map {|hash| hash["price"] }.max
  end
end
