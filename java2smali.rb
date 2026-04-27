class Java2Smali < Formula
  desc "Program to convert java to smali"
  homepage "https://github.com/AbdullahRafsan/homebrew-brewtap"
  url "https://github.com/AbdullahRafsan/homebrew-brewtap/raw/refs/heads/main/j2s.zip"
  version "1.3"
  sha256 "0cb7fc950547501df26a5554a6e3ab3bddc44f431dba1ed161985434477a6f69"
  license "MIT"

  depends_on "openjdk"

  def install
    # Remove unrecognized options if they cause configure to fail
    # https://docs.brew.sh/rubydoc/Formula.html#std_configure_args-instance_method
    # system "./configure", "--disable-silent-rules", *std_configure_args
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    prefix.install "java2smali.jar", "java2smali"
    bin.install_symlink "#{prefix}/java2smali"
  end

  test do
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "java2smali --version"
  end
end
