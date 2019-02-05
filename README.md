# homebrew-self
My own taps; mostly forks of FOSS projects + small tweaks 

Documentation on Homebrew self taps:
https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap

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

# Forks: Updating wrt upstream, using this repo's formulae as the worklist

```bash
# TODO
```

# Formulae: editing & building

Nice way to see all installed formula, for relevant examples of how to compose a homebrew-formula:
```bash
# ^C twice quickly to stop looking at formulae, since there will be ~200 depending
find -L /usr/local/opt -type f -name '*.rb*' -path '*.brew/*' \
    | parallel -n10 --tty vim -p
```

Other diagnostic pieces:
``` bash
# See the list, de-duplicated from the opt-prefix
find -L /usr/local/opt -type f  -path '*.brew/*' | uniq
# (is the same, b/c only the formula exists in this .dir
find -L /usr/local/opt -type f  -path '*.brew/*' | uniq
# view the pointers:
find -L /usr/local/opt -type f -name '*.rb*' -path '*.brew/*' | parallel 'printf "{} -> "; realpath {}'
```

View all the install receipts, for auditing install parameters
``` bash
find -L  . -name INSTALL_RECEIPT.json \
    | parallel --files jq .used_options \
    | vipe \
    | parallel -n100 --tty 'vim -p -c "tabdo setlocal ft=json"' 
```

Documentation on Formulae building:
https://docs.brew.sh/Formula-Cookbook

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

- Organization of Homebrew: [https://docs.brew.sh/Formula-Cookbook#homebrew-terminology](terminology)
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

# Where is stuff?
- Main directory: (with all the code executed)
/usr/local/Homebrew/Library/Homebrew -- homebrew ruby executables
- Homebrew taps, including external:
/usr/local/Homebrew/Library/Taps
- homebrew-core taps
/usr/local/Homebrew/Library/Taps/homebrew

- Homebrew data in /usr/local/opt/<formula>/.brew/<filename>.rb
-? ~/Library/Homebrew/Cache
- Good docs:
/usr/local/Homebrew/docs

# Unsorted Pieces I thought I needed for one reason or another:
- brew create -- for the fork workflow?
- Completion, for how to jerry-rig your own
/usr/local/Homebrew/completions/bash/brew
- apparently separately installed completions: (probably when the vendor is too lazy to do it themselves)
/usr/local/Homebrew/Library/Taps/homebrew/homebrew-completions/tap_migrations.json

# Unsorted pieces for building formulae
- install symlinks
- manpages
- completion

# Formula Database is inside git-repo:
@ /usr/local/Homebrew [master@cbf049]
> git ignored
Would skip repository Library/Taps/beeftornado/homebrew-rmtree
Would skip repository Library/Taps/dougpagani/homebrew-self
Would skip repository Library/Taps/eddieantonio/homebrew-eddieantonio
Would skip repository Library/Taps/homebrew/homebrew-bundle
Would skip repository Library/Taps/homebrew/homebrew-cask
Would skip repository Library/Taps/homebrew/homebrew-completions
Would skip repository Library/Taps/homebrew/homebrew-core
Would skip repository Library/Taps/homebrew/homebrew-science
Would skip repository Library/Taps/homebrew/homebrew-services
Would skip repository Library/Taps/sachaos/homebrew-todoist
Would remove Library/Taps/caskroom

- The repo is active, so homebrew must use git to copy-itself

- A view of a brew library
https://formulae.brew.sh/formula/pcre

- later, could query f/ the cli analytics for any pkgs that *I* make & distro

- Seems to be some stuff for, for-example, brew-fork
https://docs.brew.sh/How-To-Open-a-Homebrew-Pull-Request

- gitbatch, buggy for go
https://www.reddit.com/r/github/comments/aijs78/gitbatch_manage_multiple_git_repositories_in_one/
https://asciinema.org/a/lxoZT6Z8fSliIEebWSPVIY8ct
