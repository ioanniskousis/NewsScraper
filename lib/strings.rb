class String
  def uni_flat
    str = gsub('&#x2019;', '\'')
    str = str.gsub('</span>', '')
    str = str.gsub('<span>', '')
    str
  end
end
