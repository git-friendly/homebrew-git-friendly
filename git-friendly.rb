# /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/git-friendly.rb
# ```
# brew install --verbose --debug git-friendly
# brew audit --new-formula git-friendly
# brew test --verbose --debug git-friendly
# ```
class GitFriendly < Formula
  desc "Streamline your git workflow: `pull`, `branch`, `merge`, `push`"
  homepage "https://github.com/git-friendly/git-friendly"
  url "https://github.com/git-friendly/git-friendly/archive/1.0.8.tar.gz"
  version "1.0.8"
  sha256 "34febcd8a50c272cce3432978d14b6254c788601fd014f63ce4b482d854c3317"

  def install
    %w[push pull branch merge stash].each do |file|
      bin.install file
    end
  end

  test do
    # This doesn't test `push`, but runs through every other command we provide
    # FIXME `pull` won't work without a remote; ideally we'd have one set
    #       maybe we should use the Homebrew git repo? could be dangerous
    system "mkdir -p /tmp/git-friendly && cd /tmp/git-friendly && \
        git init && touch untracked-file && \
        stash && \
        branch test && \
        branch test2 && git commit --allow-empty -m 'Test' && \
        branch test && merge test2 && branch -d test2 && \
        branch master && branch -D test && \
        rm -rf /tmp/git-friendly"
    # stash pop && \
  end
end
