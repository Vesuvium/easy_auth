defmodule SimpleAuthTest do
  use ExUnit.Case
  doctest SimpleAuth

  test "greets the world" do
    assert SimpleAuth.hello() == :world
  end
end
