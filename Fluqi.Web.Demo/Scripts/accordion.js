﻿
function createEvent(event, ui) {
	addToLog(
		"CREATE EVENT"
		+ "<br/>- ui.header ..."
		+ "<br/>- ui.content ..."
	);
}

function changeEvent(event, ui) {
	addToLog(
		"CHANGE EVENT"
		+ "<br/>- " + buildKeyValue("event.type", event.type, 28)
		+ "<br/>- " + (ui.oldHeader.length > 0 ? buildKeyValue("ui.oldHeader",  ui.oldHeader[0].innerText, 28) : "ui.oldHeader: n/a")
		+ "<br/>- " + (ui.newHeader.length > 0 ? buildKeyValue("ui.newHeader",  ui.newHeader[0].innerText, 28) : "ui.newHeader: n/a")
		+ "<br/>- ui.oldContent: ..."
		+ "<br/>- ui.newContent: ..."
	);
}

function beforeActivateEvent(event, ui) {
	addToLog(
		"BEFORE_ACTIVATE EVENT"
		+ "<br/>- " + buildKeyValue("event.type", event.type, 28)
		+ "<br/>- " + (ui.oldHeader.length > 0 ? buildKeyValue("ui.oldHeader", ui.oldHeader[0].innerText, 28) : "ui.oldHeader: n/a")
		+ "<br/>- " +  (ui.newHeader.length > 0 ? buildKeyValue("ui.newHeader",  ui.newHeader[0].innerText, 28) : "ui.newHeader: n/a")
		+ "<br/>- ui.oldPanel: ..."
		+ "<br/>- ui.newPanel: ..."
	);

}

