defmodule Cog.Chat.Slack.Templates.Embedded.AliasCreateTest do
  use Cog.TemplateCase

  test "alias-create template" do
    data = %{"results" => [%{"name" => "awesome_alias",
                             "visibility" => "user"}]}
    expected = "Created alias 'user:awesome_alias'"
    assert_rendered_template(:slack, :embedded, "alias-create", data, expected)
  end

  test "alias-create with multiple inputs" do
    data = %{"results" => [%{"name" => "awesome_alias",
                             "visibility" => "user"},
                           %{"name" => "another_awesome_alias",
                             "visibility" => "user"},
                           %{"name" => "wow_neat",
                             "visibility" => "user"}]}
    expected = """
    Created alias 'user:awesome_alias'
    Created alias 'user:another_awesome_alias'
    Created alias 'user:wow_neat'
    """ |> String.strip

    assert_rendered_template(:slack, :embedded, "alias-create", data, expected)
  end
end
