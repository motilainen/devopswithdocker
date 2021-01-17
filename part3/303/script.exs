# Download repo
# Build Dockerfile
# Publish to Docker Hub
defmodule Devops do
  def start() do
    IO.puts("---DevOps with Docker---")

    repo = IO.gets("Git repo: ") |> String.trim()
    repo_name = download_repo(repo)
    {:ok, _repo} = docker_build(repo_name)
    credentials = get_credentials()
    {:ok, username} = docker_login(credentials)
    IO.puts("Logged in as #{username}")
    {:ok, tagged_image} = docker_tag_image(repo_name, username)
    IO.puts("Tagged image as: #{tagged_image}. Publishing...")
    {:ok, _repo} = docker_publish(repo_name, tagged_image)
    IO.puts("Success!")
  end

  def download_repo(repo) do
    System.cmd("git", ["clone", repo])
    get_repo_name(repo)
  end

  def get_repo_name(repo) do
    folder =
      repo
      |> String.split("/")
      |> Enum.at(-1)

    if String.ends_with?(folder, ".git") do
      String.slice(folder, 0..-5)
    else
      folder
    end
  end

  def docker_login({username, password}) do
    System.cmd("docker", ["login", "-u", username, "-p", password])
    {:ok, username}
  end

  def docker_publish(repo_name, tag) do
    System.cmd("docker", ["image", "push", tag])
    {:ok, repo_name}
  end

  def docker_build(repo_name) do
    folder = "./#{repo_name}"
    if File.exists?("#{folder}/Dockerfile") do
      System.cmd("docker", ["image", "build", "-t", repo_name, folder])
      {:ok, repo_name}
    else
      {:error, "Dockerfile missing."}
    end
  end

  def docker_tag_image(image, username) do
    tag = "#{username}/#{image}"
    System.cmd("docker", ["image", "tag", image, tag])
    {:ok, tag}
  end

  def get_credentials() do
    docker_user = IO.gets("Docker user: ") |> String.trim()
    docker_password = IO.gets("Docker password: ") |> String.trim()
    {docker_user, docker_password}
  end
end

Devops.start()
# Devops.download_repo("https://github.com/motilainen/spring-example-project.git")
