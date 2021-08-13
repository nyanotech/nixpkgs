{ lib, stdenv
, fetchurl
, aspell
, pkg-config
, glib
, hunspell
, hspell
, unittest-cpp
}:

stdenv.mkDerivation rec {
  pname = "enchant";
  version = "2.3.1";

  outputs = [ "out" "dev" ];

  src = fetchurl {
    url = "https://github.com/AbiWord/${pname}/releases/download/v${version}/${pname}-${version}.tar.gz";
    sha256 = "sha256-e0sa/PLNi/ppHe6mGIQE0zfyMXS7w5ucKt0r80Bzbpw=";
  };

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    glib
    hunspell
  ];

  checkInputs = [
    unittest-cpp
  ];

  # libtool puts these to .la files
  propagatedBuildInputs = [
    hspell
    aspell
  ];

  enableParallelBuilding = true;

  doCheck = true;

  configureFlags = [
    "--enable-relocatable" # needed for tests
  ];

  meta = with lib; {
    description = "Generic spell checking library";
    homepage = "https://abiword.github.io/enchant/";
    license = licenses.lgpl21Plus; # with extra provision for non-free checkers
    maintainers = with maintainers; [ jtojnar ];
    platforms = platforms.unix;
  };
}
