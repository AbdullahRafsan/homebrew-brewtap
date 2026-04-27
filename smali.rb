class Smali < Formula
  desc "Program to disassemble Android dex code"
  homepage "https://github.com/AbdullahRafsan/homebrew-brewtap"
  url "https://github.com/AbdullahRafsan/homebrew-brewtap/raw/refs/heads/main/smali.zip"
  version "2.5.2"
  sha256 "c86181c84ec6844aa8a4331d667313f39b12040fd6f99a15a0871e8ecfb7a03b"
  license "MIT"

  depends_on "openjdk"

  def install
    # Remove unrecognized options if they cause configure to fail
    # https://docs.brew.sh/rubydoc/Formula.html#std_configure_args-instance_method
    # system "./configure", "--disable-silent-rules", *std_configure_args
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    prefix.install "smali", "baksmali", "smali.jar", "baksmali.jar"
    bin.install_symlink "#{prefix}/smali"
    bin.install_symlink "#{prefix}/baksmali"
  end

  test do
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "smali -v"
    system "baksmali -v"
  end
end
