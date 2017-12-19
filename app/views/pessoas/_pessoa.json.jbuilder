json.extract! pessoa, :id, :nome, :telefone, :dataNasc, :endereco, :user_name, :email, :senha, :rk_ninja_id, :tp_user_id, :mediaAv, :created_at, :updated_at
json.url pessoa_url(pessoa, format: :json)
