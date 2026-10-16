# Detect OS type
UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),Linux)
    SED = sed -i
else ifeq ($(UNAME_S),Darwin)
    SED = sed -i ""
else ifneq (,$(findstring MINGW,$(UNAME_S)))
    SED = sed -i
else ifneq (,$(findstring MSYS,$(UNAME_S)))
    SED = sed -i
else ifneq (,$(findstring CYGWIN,$(UNAME_S)))
    SED = sed -i
else
    $(error Unsupported OS: $(UNAME_S))
endif

init-linux:   project-env linux-env git-filemode apps-envs apps-install build up
init-mac:     project-env mac-env git-filemode apps-envs apps-install build up
init-windows: project-env windows-env git-filemode apps-envs apps-install build up

build:
	docker compose -f docker-compose.base.yml -f docker-compose.apps.yml -p demo build

up:
	docker compose -f docker-compose.base.yml -f docker-compose.apps.yml -p demo up -d --remove-orphans

stop:
	docker compose -p demo stop

reload: stop up

down:
	docker compose -p demo down

# ===============
# ==== setup ====
# ===============

project-env:
	cp .env.example .env

linux-env:
	$(SED) 's|DOCKER_PLATFORM=.*|DOCKER_PLATFORM=linux/amd64|'  .env

mac-env:
	$(SED) 's|DOCKER_PLATFORM=.*|DOCKER_PLATFORM=linux/arm64|'  .env

windows-env:
	$(SED) 's|DOCKER_PLATFORM=.*|DOCKER_PLATFORM=linux/amd64|'  .env

apps-envs:
	cd ../apps/nest    && cp .env.example .env
	cd ../apps/next    && cp .env.example .env
	cd ../apps/react   && cp .env.example .env

apps-install:
	cd ../apps/nest   && make npm-install
	cd ../apps/next   && make npm-install
	cd ../apps/react  && make npm-install

# ===============
# ==== tools ====
# ===============

git-filemode:
	find ../.git -type f -path "*/config"      -exec $(SED) 's/filemode = true/filemode = false/' {} \;
	find ../apps -type f -path "*/.git/config" -exec $(SED) 's/filemode = true/filemode = false/' {} \;

