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
  depends_on "uv"

  def install
    # Create a virtual environment using uv
    system "uv", "venv", libexec, "--python", Formula["python@3.13"].opt_bin/"python3.13"

    # Build the wheel using uv
    system "uv", "build", "--out", "dist"
    whl_file = Dir["dist/*.whl"].first
    odie "No wheel found in dist/ after uv build." unless whl_file

    # Install the wheel into the virtual environment using uv
    system libexec/"bin/uv", "pip", "install", whl_file

    # Symlink the executables from the virtual environment
    bin.install_symlink Dir[libexec/"bin/*"]
  end

  test do
    # Verify that the 'rdst' command-line tool works.
    # This test runs 'rdst --help' and checks for "Usage:".
    # Because 'pip install' handles console scripts, 'rdst' should be in Homebrew's bin.
    assert_match "Usage:", shell_output("#{bin}/rdst --help")
  end
end
