defmodule StateMachineImpl do
  @behaviour :gen_statem

  def start_link, do: :gen_statem.start_link(__MODULE__, [], [])
  def callback_mode, do: :state_functions
  def init([]), do: {:ok, :idle, nil}

  def idle({:call, from}, :advance, data) do
    {:next_state, :active, data, [{:reply, from, :ok}]}
  end

  def active({:call, from}, :ping, data) do
    {:keep_state, data, [{:reply, from, reply()}]}
  end

  def extra_api, do: StateMachineDependency.extra()

  defp reply, do: StateMachineDependency.reply()
end

defmodule StateMachineDependency do
  def reply, do: :pong
  def extra, do: :extra
  def unused, do: :unused
end
