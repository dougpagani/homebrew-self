class RepoUpdateHooksWatcher < Formula
  desc "Simple fswatch wrapper that allows for repo-based build processes to kick-off"
  homepage "https://github.com/dougpagani"
  url "https://github.com/dougpagani/repo-update-hooks-watcher/archive/refs/tags/1.0.0.tar.gz"
  sha256 "99945e6664bedde2c9c207b775dda77bbfa8bdac6b4ee80818cf082b095f8c61"
  license ""

  depends_on "fswatch"
  depends_on :macos

  def install
    if File.file?("#{bin}/repo-update-hooks-watcher.sh")
      system "rm", "#{bin}/repo-update-hooks.sh"
      system "rm", "#{bin}/repo-update-hooks-watcher.sh"
    end
    bin.install 'repo-update-hooks.sh'
    bin.install 'repo-update-hooks-watcher.sh'
  end

  test do
    # system "#{bin}/repo-update-hooks-watcher.sh"
    # system "#{bin}/repo-update-hooks.sh"
    system "true"
  end

  service do
    run [opt_sbin/"sleepwatcher", "-V", "-s", "#{ENV["HOME"]}/.sleep", "-w", "#{ENV["HOME"]}/.wakeup"]
    run_type :immediate
    keep_alive true
  end

  def caveats
    <<~EOS
      For SleepWatcher to work, you will need to write sleep and
      wakeup scripts, located here when using brew services:

        ~/.sleep
        ~/.wakeup
    EOS
  end
end
