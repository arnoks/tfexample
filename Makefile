#Programms:
tf=/usr/local/bin/terraform
touch = /bin/touch

#targets

plan=build/examples.plan


.PHONY: plan show apply destroy log


plan: build/examples.plan

$(plan): examples.tf
	$(tf) plan --out build/examples.plan

apply:
	$(tf) apply $(plan)

init: init
	$(tf) init
	$(touch) init

show:
	$(tf) show

log:
	$(tf) show >> examples.log


destroy:
	$(tf) destroy
