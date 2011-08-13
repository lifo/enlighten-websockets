class DebuggingAction < Cramp::Websocket
  include DebuggerSetup

  on_start :setup_debugger
  on_data :received_data

  def received_data(data)
    result = @debugger.respond_to?(data) ? @debugger.send(data) : @debugger.eval_code(data)
    render result
  end

end
