# homebrew-git-friendly

The [Homebrew](https://brew.sh) formula for [git-friendly](https://github.com/git-friendly/git-friendly).
Installs `branch`, `merge`, `pull`, `push`, and `stash`.

## Install

```sh
brew install git-friendly/git-friendly/git-friendly
```

## Development

Edit `Formula/git-friendly.rb` in your local tap:

```sh
brew tap git-friendly/git-friendly
brew trust --formula git-friendly/git-friendly/git-friendly
cd "$(brew --repository git-friendly/git-friendly)"
```

Check changes before submitting:

```sh
brew style git-friendly/git-friendly
brew reinstall --build-from-source git-friendly/git-friendly/git-friendly
brew audit --strict --online git-friendly/git-friendly/git-friendly
brew test --verbose git-friendly/git-friendly/git-friendly
brew livecheck git-friendly/git-friendly/git-friendly
```

Tests use temporary repositories and a local remote. CI checks macOS and Linux.

## Updating

1. Update the release URL and SHA-256 in `Formula/git-friendly.rb`; Homebrew infers the version.
2. Calculate the checksum with `curl --fail --location RELEASE_URL | shasum -a 256`.
3. Update `bin.install` if upstream commands change.
4. Run the checks above.

Please send patches!
