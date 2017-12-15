rails generate scaffold RKNinja rank:string --no-migration
rails generate scaffold TpUser tipo:string --no-migration
rails generate scaffold Avaliaco avaliacao:integer ID_avaliado:integer ID_avaliador:integer --no-migration
rails generate scaffold Comentario cometario:string ID_missao:integer ID_pessoa:integer --no-migration
rails generate scaffold Equipe nomeEq:string mediaEq:integer mb_1:integer mb_2:integer mb_3:integer mb_S:integer --no-migration
rails generate scaffold Misso nome:string local:string ID_nv:integer ID_equipe:integer ID_pessoa:integer preco:float --no-migration
rails generate scaffold NvDific nivel:string preco:float --no-migration
rails generate scaffold Pessoa nome:string telefone:integer dataNasc:string endereco:string user_name:string email:string senha:string ID_Rk:integer ID_tp:integer mediaAv:integer --no-migration
