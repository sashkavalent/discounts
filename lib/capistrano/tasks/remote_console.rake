namespace :rails do
  desc "Open the rails console on each of the remote servers"
  task :console do
    task_rails_console(nil)
  end

  desc "Open the rails console on each of the remote servers in sandbox mode"
  task :sconsole do
    task_rails_console('--sandbox')
  end

  def task_rails_console(flags)
    on roles(:app), primary: true do |host|
      rails_env = fetch(:stage)
      execute_interactively host, "console #{rails_env} #{flags}"
    end
  end

  desc "Open the rails dbconsole on each of the remote servers"
  task :dbconsole do
    on roles(:app), primary: true do |host|
      rails_env = fetch(:stage)
      execute_interactively host, "dbconsole #{rails_env}"
    end
  end

  def execute_interactively(host, command)
    command = "cd #{fetch(:deploy_to)}/current && #{SSHKit.config.command_map[:bundle]} exec rails #{command}"
    puts command if fetch(:log_level) == :debug
    exec "ssh -l #{host.user} #{host.hostname} -p #{host.port || 22} -t '#{command}'"
  end
end
