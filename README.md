# homebrew-self
My own taps; mostly forks of FOSS projects + small tweaks 

Documentation on Homebrew self taps:
https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap

Documentation on Formulae building:
https://docs.brew.sh/Formula-Cookbook

# Contents of `cmd/`
These are "external" commands, as documented here: [LINK](https://docs.brew.sh/External-Commands)
- They can be any kind of program, so long as there is a valid she-bang line.
- They must be chmod-executable
- They must be of pattern: `./cmd/brew-CMD`, \
... to invoke via: `brew CMD`

Beeftornado/rmtree is a good example of a tap which provides only brew-cmds:
```bash
brew tap beeftornado/rmtree
brew edit brew-rmtree
```

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

# Other notes
* `/usr/local/opt/<formula-name>` ...
    * does not have git repo history
    * has a `./brew` directory, indicating what formula was used to pull the install
    * has a `INSTALL_RECEIPT.json` indicating how it was installed (make options & such)

- brew passes on, to the formula, \*args, for install options

- Formula can be in a dir called Formula/, or just top-level of the tap-repo.
```bash
# Directories named "Formula" (few taps follow this convention)
find -L /usr/local/Homebrew/Library/Taps -type d -path '*Formula*'
# All formula files, including core
find -L /usr/local/Homebrew/Library/Taps -type f -path '*Formula*'
# Just those you've downloaded
find -L /usr/local/opt -type f -name '*.rb*' -path '*.brew/*'
```

- Organization of Homebrew:
    - Symlink-containing dirs:
        - PF/bin -- executables provided by formula
        - PF/opt -- sometimes multiple links pointing at one version in Cellar/
        - PF/lib
    - The Database:
        - PF/Cellar -- all the realpath repos of installs, from formulae
        - PF/Hom
    - The Program:
        - PF/Homebrew

Read: [example case of why you'd want the opt-pointer](https://stackoverflow.com/a/35495902/7601668)
Read: [keg-only dependencies](https://stackoverflow.com/questions/17015285/understand-homebrew-and-keg-only-dependencies)
