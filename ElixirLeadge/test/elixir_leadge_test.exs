defmodule ElixirLeadgeTest do
  use ExUnit.Case
  doctest ElixirLeadge

  test "greets the world" do
    assert ElixirLeadge.hello() == :world
  end
end
