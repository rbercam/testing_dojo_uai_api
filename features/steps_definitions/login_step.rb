Quando("realizar a requisição para logar na API") do
    pp $payload = @login.post_login
    $token = $payload['data']['attributes']['auth-token']
end

Então("o sistema retorna o código {int}") do |status_code|
    pp expect($payload.code).to eq(status_code)
end

Então("o token da url é gerado criando a sessão") do
    pp expect($payload['data']['attributes']).to have_key("auth-token")
end

Quando("realizar a requisição para fazer logout na API") do
    pp $payload = @login.delete_logout($token)
end
  