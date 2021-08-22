ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Marketplace.Repo, :manual)
defmodule TestHelper do
  defmacro __using__(_opts) do
    quote do
      import ExUnit.Assertions, only: [assert: 1]

      # we can name this whatever we'd like,
      # but "is" makes sense to me in most cases
      # 👇
      def is(result, expectation) do
        assert result == expectation
        result # 👈 allows us to continue chaining assertions in a pipeline
      end

      # this one allows us to make more complex assertions
      # e.g., asserting that a nested key is of a particular value
      def has(result, assertion) when is_function(assertion) do
        assert assertion.(result) == true
        result
      end
    end
  end
end
