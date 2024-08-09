provider "coder" {
  # Configure o provider do Coder com suas credenciais
  token = "n3tQqgkx7T-Pr5YSa9GoyCiY3wsJBO16y"
}

resource "coder_workspace" "python_dev_container" {
  name        = "python-dev-container"
  description = "Workspace para desenvolvimento em Python"

  # URL do repositório que contém o devcontainer.json
  repository_url = "https://github.com/mbr3d4/coder.git"

  # Configurações do dev container
  dev_container {
    image = "mcr.microsoft.com/devcontainers/python:3.9"

    customizations {
      vscode {
        extensions = [
          "ms-python.python",
          "ms-toolsai.jupyter"
        ]
      }
    }

    post_create_command = "pip install -r requirements.txt"
  }
}