class Date
  def to_s(format = nil)
    if format == :db
      strftime("%Y-%m-%d")
    else
      super()
    end
  end
end
