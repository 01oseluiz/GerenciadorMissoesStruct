json.extract! pessoa, :id, :nome, :telefone, :dataNasc, :endereco, :user_name, :email, :senha, :ID_Rk, :ID_tp, :mediaAv, :created_at, :updated_at
json.url pessoa_url(pessoa, format: :json)
