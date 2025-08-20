class RdsTunnel < Formula
  desc "Python package for creating a secure tunnel to an AWS RDS instance"
  homepage "https://github.com/sbekx/rds-tunnel/"
  # Sourcing directly from a GitHub Release archive
  # IMPORTANT: You must create a release (e.g., with tag v1.0.2rc1) on your GitHub repo
  # for this URL to be valid. The SHA256 will also change.
  url "https://github.com/sbekx/rds-tunnel/archive/refs/tags/v1.0.2rc1.tar.gz"
  sha256 "8a7e49ffea0d893ad8154fae1407e84743955daa05256343483da751059b7407" # This will be different from PyPI's SHA256
  license "Apache-2.0"

  depends_on "python@3.12"

  # Define resources for all Python dependencies.
  # These URLs will still point to PyPI, as dependencies are typically from PyPI.
  resource "bcrypt" do
    url "https://files.pythonhosted.org/packages/bb/5d/6d7433e0f3cd46ce0b43cd65e1db465ea024dbb8216fb2404e919c2ad77b/bcrypt-4.3.0.tar.gz"
    sha256 "3a3fd2204178b6d2adcf09cb4f6426ffef54762577a7c9b54c159008cb288c18"
  end

  resource "boto3" do
    url "https://files.pythonhosted.org/packages/1c/92/3ffa75ed0594ef289dde3dde9e1d62a496515313f11caee499a5dfd2241d/boto3-1.40.11.tar.gz"
    sha256 "0c03da130467d51c6b940d19be295c56314e14ce0f0464cc86145e98d3c9e983"
  end

  resource "botocore" do
    url "https://files.pythonhosted.org/packages/34/b2/23e4dc97d941dad612959664029f2eb843fd65ce58cc7b3c02f996b6357c/botocore-1.40.11.tar.gz"
    sha256 "95af22e1b2230bdd5faa9d1c87e8b147028b14b531770a1148bf495967ccba5e"
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/fc/97/c783634659c2920c3fc70419e3af40972dbaf758daa229a7d6ea6135c90d/cffi-1.17.1.tar.gz"
    sha256 "1c39c6016c32bc48dd54561950ebd6836e1670f2ae46128f67cf49e789c52824"
  end

  resource "cryptography" do
    url "https://files.pythonhosted.org/packages/d6/0d/d13399c94234ee8f3df384819dc67e0c5ce215fb751d567a55a1f4b028c7/cryptography-45.0.6.tar.gz"
    sha256 "5c966c732cf6e4a276ce83b6e4c729edda2df6929083a952cc7da973c539c719"
  end

  resource "jmespath" do
    url "https://files.pythonhosted.org/packages/00/2a/e867e8531cf3e36b41201936b7fa7ba7b5702dbef42922193f05c8976cd6/jmespath-1.0.1.tar.gz"
    sha256 "90261b206d6defd58fdd5e85f478bf633a2901798906be2ad389150c5c60edbe"
  end

  resource "mysql-connector-python" do
    url "https://files.pythonhosted.org/packages/02/77/2b45e6460d05b1f1b7a4c8eb79a50440b4417971973bb78c9ef6cad630a6/mysql_connector_python-9.4.0.tar.gz"
    sha256 "d111360332ae78933daf3d48ff497b70739aa292ab0017791a33e826234e743b"
  end

  resource "paramiko" do
    url "https://files.pythonhosted.org/packages/1d/08/3b8d8f1b4ec212c17429c2f3ff55b7f2237a1ad0c954972e39c8f0ac394c/paramiko-2.11.0.tar.gz"
    sha256 "003e6bee7c034c21fbb051bf83dc0a9ee4106204dd3c53054c71452cc4ec3938"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/1d/b2/31537cf4b1ca988837256c910a668b553fceb8f069bedc4b1c826024b52c/pycparser-2.22.tar.gz"
    sha256 "491c8be9c040f5390f5bf44a5b07752bd07f56edf992381b05c701439eec10f6"
  end

  resource "PyNaCl" do
    url "https://files.pythonhosted.org/packages/a7/22/27582568be639dfe22ddb3902225f91f2f17ceff88ce80e4db396c8986da/PyNaCl-1.5.0.tar.gz"
    sha256 "8ac7448f09ab85811607bdd21ec2464495ac8b7c66d146bf545b0f08fb9220ba"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/66/c0/0c8b6ad9f17a802ee498c46e004a0eb49bc148f2fd230864601a86dcf6db/python-dateutil-2.9.0.post0.tar.gz"
    sha256 "37dd54208da7e1cd875388217d5e00ebd4179249f90fb72437e91a35459a0ad3"
  end

  resource "s3transfer" do
    url "https://files.pythonhosted.org/packages/6d/05/d52bf1e65044b4e5e27d4e63e8d1579dbdec54fce685908ae09bc3720030/s3transfer-0.13.1.tar.gz"
    sha256 "c3fdba22ba1bd367922f27ec8032d6a1cf5f10c934fb5d68cf60fd5a23d936cf"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/94/e7/b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2/six-1.17.0.tar.gz"
    sha256 "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
  end

  resource "sshtunnel" do
    url "https://files.pythonhosted.org/packages/8d/ad/4c587adf79865be268ee0b6bd52cfaa7a75d827a23ced072dc5ab554b4af/sshtunnel-0.4.0.tar.gz"
    sha256 "e7cb0ea774db81bf91844db22de72a40aae8f7b0f9bb9ba0f666d474ef6bf9fc"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/15/22/9ee70a2574a4f4599c47dd506532914ce044817c7752a79b6a51286319bc/urllib3-2.5.0.tar.gz"
    sha256 "3fc47733c7e419d4bc3f6b3dc2b4f890bb743906a30d56ba4a5bfa4bbff92760"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/rdst --help")
  end
end
