defmodule ApiPlugCowboy.Utils do
  def format_success(body) do
    %{success: true, data: body}
  end

  def format_failed_response(errors) do
    %{success: false, errors: translate_errors(errors)}
  end

  # ref : https://hexdocs.pm/ecto/Ecto.Changeset.html#traverse_errors/2
  def translate_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end
end