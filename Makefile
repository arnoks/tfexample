#Programms:
tf=/usr/local/bin/terraform

#targets

plan=build/examples.plan


.PHONY: init plan show apply destroy 


plan: build/examples.plan

$(plan): examples.tf
	$(tf) plan --out build/examples.plan

apply:
	$(tf) apply $(plan)

init: 
	$(tf) init

show: 
	$(tf) show

destroy: 
	$(tf) destroy 

