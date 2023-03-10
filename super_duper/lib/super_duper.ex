defmodule SuperDuper do
  @moduledoc """
  Documentation for `SuperDuper`.
  """
  alias SuperDuper.Server

  @app __MODULE__.DynamicSupervisor

  def add_character(name, says) do
    DynamicSupervisor.start_child(@app, Server.child_spec({name, says}))
  end

  def remove_character(name) do
    DynamicSupervisor.terminate_child(@app, name)
  end

  def say(character) do
    Server.say(character)
  end

  def die(character) do
    Server.die(character)
  end
end
