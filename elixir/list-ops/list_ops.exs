defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    case l do
      [head | rest] -> 1 + count(rest)
      [head]        -> 1
      []            -> 0
    end
  end

  @spec reverse(list) :: list
  def reverse(l) do
    reduce(l, [], fn (x, acc) -> [x | acc] end)
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    l |> reverse |> reduce([], fn (x, acc) -> [f.(x) | acc] end)
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    processor = fn x, acc ->
      case f.(x) do
        true -> [ x | acc]
        false -> acc
      end
    end
    l |> reverse |> reduce([], processor)
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    case l do
      [head | rest]  -> memo = f.(head, acc)
                        reduce(rest, memo, f)
      [head]         -> f.(head, acc)
      []             -> acc
    end
  end

  @spec append(list, list) :: list
  def append(a, b) do
    processor = fn x, acc ->
      [x | acc]
    end
    reduce(b, reverse(a), processor) |> reverse
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    reduce(ll, [], fn (l, acc) ->
      reduce(l, acc, fn (v, acc2) -> [v | acc2] end)
    end) |> reverse
    # Enum.flat_map(ll, fn(x) -> x end)
  end
end