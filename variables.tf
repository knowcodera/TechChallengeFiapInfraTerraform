variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

variable "db_admin_user" {
  description = "Nome do administrador do SQL Server"
  type        = string
}

variable "db_admin_password" {
  description = "Senha do administrador do SQL Server"
  type        = string
  sensitive   = true
}

variable "my_ip_address" {
  description = "Seu endereço IP público"
  type        = string
}

variable "db_server" {
  description = "Nome do servidor de banco de dados"
  type        = string
}

variable "db_name" {
  description = "Nome do banco de dados"
  type        = string
}

variable "db_port" {
  description = "Porta do banco de dados"
  type        = string
  default     = "1433"
}

