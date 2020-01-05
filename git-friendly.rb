# /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/git-friendly.rb
# ```
# brew install --verbose --debug git-friendly
# brew audit --new-formula git-friendly
# brew test --verbose --debug git-friendly
# ```
class GitFriendly < Formula
  desc "Streamline your git workflow: `pull`, `branch`, `merge`, `push`"
  homepage "https://github.com/jamiew/git-friendly"
  url "https://github.com/jamiew/git-friendly/archive/1.0.tar.gz"
  sha256 "8a010c7c7cfb5c76f6e89e88ca7d7003e8fadd56938e2b4d0ebaac9785a0f6c9"

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

