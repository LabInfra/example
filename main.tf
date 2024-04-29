terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  owner = "LabInfra"
  token = var.github_token
}

resource "github_membership" "membership_for_user_x" {
  username = "jomaldonadob"
  role     = "admin"
}


resource "github_repository" "example" {
  name        = "example"
  description = "My awesome codebase"
  visibility = "public"
}

#resource "github_branch" "main" {
  #repository = github_repository.example.id
  #branch     = "main"
#}

#resource "github_repository_file" "readme" {
  #repository = github_repository.example.name
  #file  = "README.md"
  #content    = "# Bienvenido a mi proyecto\n\nEste es un proyecto increíble creado con Terraform."
#}

#resource "github_repository_file" "readme_commit" {
  #repository = github_repository.example.name
  #file  = "README.md"
  #content    = github_repository_file.readme.content
  #branch     = "main"
  #commit_message = "Agregado archivo README.md"
  #overwrite_on_create = true
#}

resource "github_branch" "desarrollo" {
  repository = github_repository.example.id
  branch     = "desarrollo"
}

resource "github_branch" "produccion" {
  repository = github_repository.example.id
  branch     = "produccion"
}

resource "github_branch" "pruebas" {
  repository = github_repository.example.id
  branch     = "pruebas"
}

