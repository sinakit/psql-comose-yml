######################################
#### - do not edit this section - ####

# save system vars
VARS_OLD := $(.VARIABLES)

# gitlab CI vars
CI_REGISTRY          ?= docker-registry.sabay.com
CI_PROJECT_NAMESPACE ?= usp/middlewares
CI_PROJECT_NAME      ?= app.srv.usp.mongodb
CI_COMMIT_REF_NAME   ?= master
CI_ENVIRONMENT_NAME  ?= master

# image and tag
TAG=$(CI_COMMIT_REF_NAME)
IMG=$(CI_REGISTRY)/$(CI_PROJECT_NAMESPACE)/$(CI_PROJECT_NAME)

COMPOSE_PROJECT_NAME ?=$(CI_PROJECT_NAME)
