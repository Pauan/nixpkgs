{ lib
, buildPythonPackage
, fetchPypi
, flask
, pyjwt
, pytestCheckHook
, python-dateutil
, pythonOlder
, werkzeug
}:

buildPythonPackage rec {
  pname = "flask-jwt-extended";
  version = "4.4.4";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    pname = "Flask-JWT-Extended";
    inherit version;
    hash = "sha256-YrUh11SUwpCmRq6KzHcSNyHkNkeQ8eZK8AONgjlh+/A=";
  };

  propagatedBuildInputs = [
    flask
    pyjwt
    python-dateutil
    werkzeug
  ];

  checkInputs = [
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "flask_jwt_extended"
  ];

  meta = with lib; {
    description = "JWT extension for Flask";
    homepage = "https://flask-jwt-extended.readthedocs.io/";
    license = licenses.mit;
    maintainers = with maintainers; [ gerschtli ];
  };
}
