defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
  	sentence
  	|> String.downcase
  	|> String.replace(~r{[:,!&@\$%\^]}, "")
  	|> String.replace("_", " ")
  	|> String.split
  	|> Enum.reduce(%{}, fn(word, memo) ->
			v = memo[word]
  		v = v || 0
  		v = v + 1
  		Map.put(memo, word, v)
  	end)

  end
end