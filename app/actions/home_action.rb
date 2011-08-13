class HomeAction < Cramp::Action
  include DebuggerSetup

  def start
    setup_debugger
    render ERB.new(File.read(Enlighten::Application.root('app/views/home.html.erb'))).result(binding)
    finish
  end
end
