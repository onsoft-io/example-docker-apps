DIR=$(CURDIR)

npm-install:
	docker run -it \
		--mount type=bind,source="$(realpath $(pwd).)",target=//app \
		--workdir=//app \
		--name nest-app \
		--rm node:22-alpine \
		ash -c "rm -rf node_modules && npm i"

npm-start:
	docker run -it \
		--mount type=bind,source="$(realpath $(pwd).)",target=//app \
		--workdir=//app \
		-p 3000:3000 \
		--name nest-app \
		--rm node:22-alpine \
		ash -c "npm run start:dev"