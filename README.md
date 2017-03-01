# homebrew-qt
`brew install qt5 --with-qtwebkit` as bottle

## Why?

There are some tools, e.g. 'capybara-webkit', that require you to have Qt5 with webkit.
On macOs you had to run `brew install qt5 --with-qtwebkit` until now.
It would have started to compile Qt on your machine which would have taken hours to complete
even on brand new hardware, because Qt is just huge.

## How to use it?

What we did is compiling qt5 with webkit, build a 'homebrew bottle' out of it, and share it with you.
All you need to do now is:

    brew uninstall qt5
    brew install ninech/qt/qt5

And you're good to go.

## Troubleshooting

### It can't find `cmake`

You did not read the homebrew caveats then. Run `brew info qt5` to read them again.

## Updating the bottle

Clone this repository and run `./update.sh`.
It will tell you what to do.
