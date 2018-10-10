Dado("que o cliente esteja logado na API") do
    puts $payload = @login.post_login
    $token = $payload['data']['attributes']['auth-token']
end

Quando("realizar a requisição para cadastrar uma nova tarefa") do
   $payload = @tarefa.post_task($token,@body)
   $id = $payload["data"]["id"]
end

Então("o corpo da resposta da tarefa") do
    puts $payload
end

Quando("realizar a requisição para consultar tarefas") do
    $payload = @tarefa.get_task($token, $id)
end