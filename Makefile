NAMESPACE:=justeh

.PHONY: source
source: deploy-source

.PHONY: publish
publish:
	docker push $(DOCKER_HUB_USERNAME)/hello-world

.PHONY: delete
delete:
	tanzu apps workload delete hello-world -n $(NAMESPACE) -y

.PHONY: get
get:
	tanzu apps workload get hello-world -n $(NAMESPACE)

.PHONY: deploy-source
deploy-source:
	tanzu apps workload apply -f config/workload.yaml -y -n $(NAMESPACE)
