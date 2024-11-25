defmodule SyntaxesTest do
  use ExUnit.Case
  doctest Syntaxes

  test "greets the world" do
    assert Syntaxes.hello() == :world
  end
end
