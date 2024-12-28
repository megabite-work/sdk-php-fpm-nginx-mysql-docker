include docker/.env

DC = docker compose -f ./docker/docker-compose.yml
APP = $(DC) exec -u www-data app
DB = $(DC) exec -it db
CI = composer install --prefer-dist --no-progress --no-scripts --no-interaction
CIP = composer install --no-progress --no-scripts --no-interaction --no-dev --optimize-autoloader

##################
# Docker compose
##################

dc_build:
	@$(DC) build

dc_start:
	@$(DC) start

dc_stop:
	@$(DC) stop

dc_up:
	@$(DC) up -d --remove-orphans

dc_ps:
	@$(DC) ps

dc_logs:
	@$(DC) logs -f

dc_down:
	@$(DC) down --rmi=local --remove-orphans



##################
# App
##################

app_bash:
	@$(APP) bash

db_bash:
	@$(DB) bash

ci:
	@$(APP) $(CI)

cip:
	@$(APP) $(CIP)

composer: ## Run composer, pass the parameter "c=" to run a given command, example: make composer c='req symfony/orm-pack'
	@$(eval c ?=)
	@$(APP) composer $(c)
