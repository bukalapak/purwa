REPOSITORY:=registry.bukalapak.io/bukalapak/<%= @project_name %>
TAG:=v0.0.1
TMP_DIR:=_build

setup:
	mix deps.get

run: setup
	mix run --no-halt

testing:
	MIX_ENV=test mix test

lint:
	mix credo --strict

coverage:
	MIX_ENV=test mix coveralls.html

docker-prepare:
	wget -O ./envconsul.tgz https://releases.hashicorp.com/envconsul/0.6.2/envconsul_0.6.2_linux_amd64.tgz
	tar xf ./envconsul.tgz -C ./
	rm ./envconsul.tgz

docker-build: docker-prepare
	docker build -t $(REPOSITORY):$(TAG) -t $(REPOSITORY) ./
	rm ./envconsul
	docker rmi $$(docker images -f "dangling=true" -q)
