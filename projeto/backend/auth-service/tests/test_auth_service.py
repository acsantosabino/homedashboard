from projeto.backend.auth_service.src.app import AuthService


def test_register_returns_created_status():
    service = AuthService()
    result = service.register({"email": "maria@test.com", "senha": "SenhaSegura123", "nome": "Maria"})

    assert result["statusCode"] == 201
    assert result["body"]["user"]["email"] == "maria@test.com"


def test_login_returns_200_for_valid_payload():
    service = AuthService()
    result = service.login({"email": "maria@test.com", "senha": "SenhaSegura123"})

    assert result["statusCode"] == 200
    assert "token" in result["body"]


def test_password_reset_requires_email():
    service = AuthService()
    result = service.password_reset({})

    assert result["statusCode"] == 400


def test_enable_2fa_requires_user_id():
    service = AuthService()
    result = service.enable_2fa({})

    assert result["statusCode"] == 400
