class DebuggingAction < Cramp::Websocket
  include DebuggerSetup

  on_start :setup_debugger
  on_data :received_data

  def received_data(data)
    render @debugger.eval_code(data)
  end

end
