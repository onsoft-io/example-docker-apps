DIR=$(CURDIR)

npm-install:
	docker run -it \
		--mount type=bind,source="$(realpath $(pwd).)",target=/app \
		--workdir=/app \
		--name next-app \
		--rm node:22-alpine \
		ash -c "rm -rf node_modules && npm i"

npm-start:
	docker run -it \
		--mount type=bind,source="$(realpath $(pwd).)",target=/app \
		--workdir=/app \
		-p 3001:3000 \
		--name next-app \
		--rm node:22-alpine \
		ash -c "npm run dev"