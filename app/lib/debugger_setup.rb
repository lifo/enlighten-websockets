# Fibers!!!
# TCPSocket = EventMachine::Synchrony::TCPSocket

module DebuggerSetup
  def setup_debugger
    if Enlighten::Application.debugger.nil?
      Enlighten::Application.debugger = Enlighten::Debugger.new(TCPSocket.new("localhost", 8989))
      Enlighten::Application.debugger.socket_response # get to first prompt
    end

  rescue Errno::ECONNREFUSED, SocketError => e
    Enlighten::Application.debugger = nil
  ensure
    @debugger = Enlighten::Application.debugger
  end

  def close_debugger
    Enlighten::Application.debugger.close if Enlighten::Application.debugger
  end
end
