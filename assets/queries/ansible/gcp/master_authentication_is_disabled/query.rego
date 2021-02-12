package Cx

import data.generic.ansible as ansLib

CxPolicy[result] {
	document := input.document[i]
	task := ansLib.getTasks(document)[t]
	cluster := task["google.cloud.gcp_container_cluster"]

	ansLib.checkState(cluster)
	object.get(cluster, "master_auth", "undefined") == "undefined"

	result := {
		"documentId": document.id,
		"searchKey": sprintf("name={{%s}}.{{google.cloud.gcp_container_cluster}}", [task.name]),
		"issueType": "MissingAttribute",
		"keyExpectedValue": "{{google.cloud.gcp_container_cluster}}.master_auth is defined",
		"keyActualValue": "{{google.cloud.gcp_container_cluster}}.master_auth is undefined",
	}
}

CxPolicy[result] {
	document := input.document[i]
	task := ansLib.getTasks(document)[t]
	cluster := task["google.cloud.gcp_container_cluster"]

	ansLib.checkState(cluster)
	object.get(cluster.master_auth, "username", "undefined") == "undefined"

	result := {
		"documentId": document.id,
		"searchKey": sprintf("name={{%s}}.{{google.cloud.gcp_container_cluster}}.master_auth", [task.name]),
		"issueType": "MissingAttribute",
		"keyExpectedValue": "{{google.cloud.gcp_container_cluster}}.master_auth.username is defined",
		"keyActualValue": "{{google.cloud.gcp_container_cluster}}.master_auth.username is undefined",
	}
}

CxPolicy[result] {
	document := input.document[i]
	task := ansLib.getTasks(document)[t]
	cluster := task["google.cloud.gcp_container_cluster"]

	ansLib.checkState(cluster)
	object.get(cluster.master_auth, "password", "undefined") == "undefined"

	result := {
		"documentId": document.id,
		"searchKey": sprintf("name={{%s}}.{{google.cloud.gcp_container_cluster}}.master_auth", [task.name]),
		"issueType": "MissingAttribute",
		"keyExpectedValue": "{{google.cloud.gcp_container_cluster}}.master_auth.password is defined",
		"keyActualValue": "{{google.cloud.gcp_container_cluster}}.master_auth.password is undefined",
	}
}

CxPolicy[result] {
	document := input.document[i]
	task := ansLib.getTasks(document)[t]
	cluster := task["google.cloud.gcp_container_cluster"]

	ansLib.checkState(cluster)
	ansLib.checkValue(cluster.master_auth.username)

	result := {
		"documentId": document.id,
		"searchKey": sprintf("name={{%s}}.{{google.cloud.gcp_container_cluster}}.master_auth.username", [task.name]),
		"issueType": "IncorrectValue",
		"keyExpectedValue": "{{google.cloud.gcp_container_cluster}}.master_auth.username is not empty",
		"keyActualValue": "{{google.cloud.gcp_container_cluster}}.master_auth.username is empty",
	}
}

CxPolicy[result] {
	document := input.document[i]
	task := ansLib.getTasks(document)[t]
	cluster := task["google.cloud.gcp_container_cluster"]

	ansLib.checkState(cluster)
	ansLib.checkValue(cluster.master_auth.password)

	result := {
		"documentId": document.id,
		"searchKey": sprintf("name={{%s}}.{{google.cloud.gcp_container_cluster}}.master_auth.password", [task.name]),
		"issueType": "IncorrectValue",
		"keyExpectedValue": "{{google.cloud.gcp_container_cluster}}.master_auth.password is not empty",
		"keyActualValue": "{{google.cloud.gcp_container_cluster}}.master_auth.password is empty",
	}
}
