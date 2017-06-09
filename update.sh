#!/bin/sh

if [ ! hash brew 2>/dev/null ]; then
  echo "Please install brew: https://brew.sh"
fi

brew remove qt
brew install --build-bottle qt --with-qtwebkit
brew bottle qt

brew cat qt > Formula/qt.rb

echo
echo "#### IMPORTANT INFORMATION FOLLOWING! "
echo "##"
echo "## $(sha256sum --tag $(ls -t qt* | head -n 1)) "
echo "##"
echo "#### See below on how to use this."
echo

cat <<EOF
Update the 'bottle' section in 'Formula/qt.rb' like so, but with the correct sha256sum (see above) and the correct version (again, see above)

  bottle do
    root_url "https://github.com/ninech/homebrew-qt/releases/download/vX.X.X_1"
    rebuild 1
    sha256 "2d54c0c0db8548e63134250950f9ac69d9ae52c101e397a1c1230d31bf3731ef" => :sierra
  end

Now commit the formula and push it to Github.
Then create a new release [1] with the correct name (so that the URL above becomes valid!).
Finally, upload the created tar.gz file to the release.

[1] https://github.com/ninech/homebrew-qt/releases/new
EOF
