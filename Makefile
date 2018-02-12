#Programms:
tf=/usr/local/bin/terraform
touch = /bin/touch

#targets

plan=build/examples.plan


.PHONY: plan show apply destroy log X11


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

graph: examples.tf ex1bucket.tf
	$(tf) graph > graph.dot

X11: graph.dot
	dot -Tx11 graph.dot
