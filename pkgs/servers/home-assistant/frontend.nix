{ lib, fetchPypi, buildPythonPackage }:

buildPythonPackage rec {
  # the frontend version corresponding to a specific home-assistant version can be found here
  # https://github.com/home-assistant/home-assistant/blob/master/homeassistant/components/frontend/manifest.json
  pname = "home-assistant-frontend";
  version = "20230411.1";
  format = "wheel";

  src = fetchPypi {
    inherit version format;
    pname = "home_assistant_frontend";
    dist = "py3";
    python = "py3";
    hash = "sha256-SV1SglO9XqkxfUD/jUyFgdJIWgKgnPNNQR94MHTYew0=";
  };

  # there is nothing to strip in this package
  dontStrip = true;

  # no Python tests implemented
  doCheck = false;

  meta = with lib; {
    description = "Polymer frontend for Home Assistant";
    homepage = "https://github.com/home-assistant/home-assistant-polymer";
    license = licenses.asl20;
    maintainers = teams.home-assistant.members;
  };
}
