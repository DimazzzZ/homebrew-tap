# DimazzzZ Homebrew Tap

Homebrew casks for my apps.

## Install

```sh
brew install --cask dimazzzz/tap/namehold
```

## Casks

| Cask | App |
|------|-----|
| `namehold` | [Namehold](https://github.com/DimazzzZ/namehold-wallet), a non-custodial Handshake (HNS) wallet and TLD manager |

## Updating a cask after a release

```sh
brew bump-cask-pr --version <new-version> dimazzzz/tap/namehold
```

Or edit `version` and `sha256` in `Casks/namehold.rb` by hand; the checksum is in the release's `SHA256SUMS`.
