def count(string, substring, ticker = 0)
  if string.include?(substring)
    string.sub!(substring, "")
    ticker += 1
    ticker = count(string, substring, ticker)
  end
  ticker
end
