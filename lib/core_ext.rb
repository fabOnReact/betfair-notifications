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
    select{|hash| hash["selectionId"] == id}
  end

  def maximum_price
    map {|hash| hash[:price] }.max
  end
end

class Hash
  def event_format
    row = self["event"] 
    row["marketCount"] = self["marketCount"] if self["marketCount"]
    row
  end

  def catalog_format
    self.delete("runners")
    eventName = self.delete("event")["name"]
    self["eventName"] = eventName
    self
  end

  def merge_projections!
    merge!({:priceProjection => {:priceData => ['EX_BEST_OFFERS']}})
  end
  def lay_prices; self['ex']['availableToLay']; end
end

class String
  def self.line(title)
    "----------------------#{title}--------------------" 
  end
end






  # def lay_hash
  #   to_lay.present? ? to_lay : {'price' => 0, 'size' => 0}
  # end
  # def lay_amount; lay_hash['size']; end
  # def lay_price; lay_hash['price']; end
  # def runners_format
  #   # {a:1, runners: [{b:1},{b:2}]}
  #   runners = self.delete("runners").each_with_index do |runner, index| 
  #     self.merge! runner.filter_fields(index+1) 
  #   end
  #   self
  # end

  # def filter_fields index
  #   {"runnerId#{index}": self['selectionId'], "layPrice#{index}": lay_price, "laySize#{index}": lay_amount }
  # end
  
