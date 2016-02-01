did(){
	local name="$1"
	docker ps | grep $name | awk '{print $1}'
}

dlogs() {
	local name="$1"
	local id=$(did $name)
	docker logs -f $id
}

