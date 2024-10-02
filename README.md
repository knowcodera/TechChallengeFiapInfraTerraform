# Escolha do Banco de dados

Neste projeto, optei por utilizar o SQL Server como banco de dados devido à sua robustez, segurança e integração nativa com o Azure, que é a plataforma escolhida para hospedar nossa infraestrutura.
A modelagem de dados foi estruturada para atender os principais componentes da aplicação: Produtos, Categorias, Pedidos. Cada entidade foi cuidadosamente projetada para refletir os relacionamentos entre esses componentes. Por exemplo, um Produto pertence a uma Categoria, enquanto um Pedido pode conter vários Produtos e está associado a um Pagamento.

## A escolha pelo SQL Server se deu por várias razões:

- Integração fácil com Azure, facilitando a gestão e escalabilidade do banco.
- Escalabilidade, que nos permite ajustar os recursos conforme o crescimento da aplicação.
- Utilizei Terraform para provisionar e gerenciar a infraestrutura do banco, garantindo que tudo esteja em conformidade com as melhores práticas de cloud e permitindo ajustes ágeis conforme a demanda do projeto.

Essa abordagem nos dá flexibilidade e segurança, sem comprometer a performance, sendo ideal para o escopo do sistema.

## Tecnologias Utilizadas
- Terraform: Ferramenta de IaC para criação e gerenciamento de infraestrutura.
- Microsoft Azure: Provedor de nuvem escolhido para hospedar a solução.
- SQL Server Gerenciado no Azure: Banco de dados utilizado para armazenar informações dos usuários e da aplicação.

## Recursos Utilizados
 ```hcl
resource "azurerm_resource_group" "rg" {
  name     = "MyResourceGroup"
  location = "eastus"
}

resource "azurerm_mssql_server" "sql_server" {
  name                         = var.db_name
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = var.db_admin_user
  administrator_login_password = var.db_admin_password
}

resource "azurerm_mssql_database" "sql_db" {
  name                = var.db_name
  server_id    = azurerm_mssql_server.sql_server.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb  = 2
  sku_name     = "Basic"
}

resource "azurerm_mssql_firewall_rule" "allow_azure_access" {
  name                = "AllowAzureServices"
  server_id    = azurerm_mssql_server.sql_server.id
  start_ip_address    = var.my_ip_address
  end_ip_address      = var.my_ip_address
}
```

## Consulta Realizada com SQL Server no Azure
![image](https://github.com/user-attachments/assets/510b1794-33a2-4f78-9a2a-68fd40a2d629)

## Licença
Este projeto está licenciado sob a licença MIT. Consulte o arquivo LICENSE para obter mais detalhes.
