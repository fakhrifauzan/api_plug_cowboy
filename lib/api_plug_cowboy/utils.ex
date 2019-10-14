defmodule ApiPlugCowboy.Utils do
  def format_success(body) do
    %{success: true, data: body}
  end

  def format_failure_response(errors) do
    %{errors: Enum.map(errors, &format_error(&1)), success: false}
  end

  def format_failure_response(title, msg), do: format_failure_response([{title, msg}])

  def translate_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
    |> Enum.flat_map(fn {key, values} ->
      Enum.map(values, fn value ->
        {key, "#{key} #{value}"}
      end)
    end)
  end

  defp format_error({title, msg}) do
    %{
      message_title: title,
      message: msg
    }
  end
end