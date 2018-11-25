class String
  def self.header(title)
    @chars = 81 - title.size
    line + title + line
  end

  def self.line
    "-"*(@chars/2)
  end
end
