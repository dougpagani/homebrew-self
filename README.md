# homebrew-self
My own taps; mostly forks of FOSS projects + small tweaks 

Documentation on Homebrew self taps:
https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap

# Contents of cmd/
These are "external" commands, as documented here: [LINK](https://docs.brew.sh/External-Commands)
- They can be any kind of program, so long as there is a valid she-bang line.

# Setup & Install

To register the tap with brew:
```bash
brew tap dougpagani/self
```

brew tap square/self:
```bash
brew install <formulaname>
```

If it conflicts with a core-tap:
```bash
brew install user/repo/<formulaname>
```

To see an example tap:
/usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/ghi.rb
