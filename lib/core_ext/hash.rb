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
  def message; "selection id #{self['selectionId']}"; end
  def lay_prices; self['ex']['availableToLay']; end
end
