class RdsTunnel < Formula
  desc "Python package for creating a secure tunnel to an AWS RDS instance"
  homepage "https://github.com/sbekx/rds-tunnel/"
  # Sourcing directly from a GitHub Release archive
  # IMPORTANT: You must create a release (e.g., with tag v1.0.2rc1) on your GitHub repo
  # for this URL to be valid. The SHA256 will also change.
  url "https://github.com/sbekx/rds-tunnel/releases/download/1.0.2/rds_tunnel-1.0.2.tar.gz"
  sha256 "8a7e49ffea0d893ad8154fae1407e84743955daa05256343483da751059b7407"
  license "Apache-2.0"

  depends_on "python@3.13"
  # Include the Homebrew Python virtual environment module
  # This provides the `virtualenv_create` helper method.
 depends_on "uv"

  def install
    # Change to the extracted source directory where your pyproject.toml resides.
    # `buildpath` is where Homebrew unpacks the tarball.
    cd buildpath

    # Use `uv` to build the source distribution (sdist).
    # This will typically create a .tar.gz file in a 'dist/' subdirectory.
    system "uv", "build"

    # Locate the built source distribution file.
    # We assume 'uv build' produces a .tar.gz file.
    sdist_file = Dir["dist/*.whl"].first

    # If no sdist file is found, raise an error.
    odie "No sdist found in dist/ after uv build. Check your uv build process." unless sdist_file

    # Install the built package using Homebrew's managed Python and pip.
    # This command will install the package and its Python dependencies
    # into Homebrew's Python site-packages, and place console scripts (like 'rdst')
    # directly into Homebrew's main bin directory (e.g., /opt/homebrew/bin/).
    system "pip", "install", sdist_file, "--user", "--break-system-packages"
  end

  test do
    # Verify that the 'rdst' command-line tool works.
    # This test runs 'rdst --help' and checks for "Usage:".
    # Because 'pip install' handles console scripts, 'rdst' should be in Homebrew's bin.
    assert_match "Usage:", shell_output("#{bin}/rdst --help")
  end
end