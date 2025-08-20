class RdsTunnel < Formula
  desc "Python package for creating a secure tunnel to an AWS RDS instance"
  homepage "https://github.com/sbekx/rds-tunnel/"
  # Sourcing directly from a GitHub Release archive
  # IMPORTANT: You must create a release (e.g., with tag v1.0.2rc1) on your GitHub repo
  # for this URL to be valid. The SHA256 will also change.
  url "https://github.com/sbekx/rds-tunnel/releases/download/1.0.2/rds_tunnel-1.0.2.tar.gz"
  sha256 "8a7e49ffea0d893ad8154fae1407e84743955daa05256343483da751059b7407"
  license "Apache-2.0"

  depends_on "python@3.12"

    # The `install` method defines the steps to build and install the software.
  def install
    # Create a Python virtual environment within the formula's `libexec` directory.
    # This isolates the tool and its dependencies from other Python packages on the system.
    # We specify which python executable to use for creating the venv.
    venv = virtualenv_create(libexec, "python3.12")

    # Use the pip from the virtual environment to install the package.
    # `pip install .` reads the `pyproject.toml` file, resolves all dependencies
    # listed there (like boto3, paramiko, etc.), and installs them from PyPI.
    system venv.pip, "install", "."

    # After installation, the executables (`rds-tunnel` and `rdst`) are in the
    # virtual environment's bin directory. This command creates symlinks to them
    # in Homebrew's standard `bin` directory (`/usr/local/bin` or `/opt/homebrew/bin`),
    # making them accessible from the user's shell.
    bin.install_symlink Dir[libexec/"bin/*"]
  end

  # The `test` block defines a simple test to run after installation (`brew test rds-tunnel`).
  # This helps verify that the installation was successful.
  test do
    # We execute the `rds-tunnel --version` command and check if its output
    # contains the correct version string. This confirms the executable is in the PATH
    # and running correctly. The `#{version}` variable is automatically populated
    # from the formula's version, which is derived from the `url`.
    assert_match "rds-tunnel #{version}", shell_output("#{bin}/rds-tunnel --version")
  end
end