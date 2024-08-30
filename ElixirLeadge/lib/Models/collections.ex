defmodule Collections do
  def creating_inserting() do
    # ordered, duplicates allowed, mixed types
    mixed_list = [
      1, "Mixed descript",:simple,
      3.51, 3.51,  %{name: "Sarah"},
      []
    ]
    simple_list = [12, 5]
    put_on_first = [12.5 | simple_list]
    put_on_end = put_on_first ++ [:last_element]
    [head | tail] = put_on_first
    check_member = Enum.member?(mixed_list, 1)
    position_element = Enum.at(simple_list, 0)
    IO.inspect(put_on_first, label: "Add on head")
    IO.inspect(put_on_end, label: "Add on tail")
    IO.inspect({head, tail}, label: "Head and rest split")
    IO.inspect(check_member, label: "Does #{1} in mixed_list")
    IO.inspect(simple_list, label: "Simple list ")
    IO.inspect(position_element, label: "Element on position 0 is ")
    put_on_end
  end

  def operations() do
      # Filtering whether conditions
      list = [1,2,3,4,5]
      even_numbs = Enum.filter(
          list,
          fn numb -> rem(numb, 2) == 0  end
      )
      IO.inspect(even_numbs, label: "Even numbers: ")
      # mapping list elements
      mapped_list = Enum.map(list,
          fn
            numb when rem(numb, 2) == 0 -> numb * 2
            numb -> numb + 12.5
          end
      )
      IO.inspect(mapped_list, label: "Mapped list: ")
      # Spliting list by seperator
      seperator = 3
      {left, right} = Enum.split(list, seperator)
      IO.inspect(left, label: "Splited list by #{seperator} left side: ")
      IO.inspect(right, label: "Splited list by #{seperator} right side : ")

      # reduce list
      accumulator = 0
      reduced_list = Enum.reduce( list, accumulator, fn acc, next -> acc + next end )
      IO.inspect(reduced_list, label: "Reduced list: ")

  end
end
