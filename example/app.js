// Function that will be exported and called by the app's relevant events
function sendEvent(tag, value) {
	if (!tag) Ti.API.info("Missing mandatory TAG parameter on appsFlyer sendEvent");

	// Building object with only the Tag property. Value will be added only if it's sent
	var objToSend = { name: tag };
	if (value) objToSend.data = {
		value : value
	};

	Ti.API.info( "Sending Event to AppsFlyer: " + JSON.stringify(objToSend) );

	// Send the built event to AppsFlyer servers
	appsflyer.trackEvent(objToSend);
}

// Code for iOS initialization
if (OS_IOS) {
	var appsflyer = require('co.uk.devpulse.appsflyer');
	var config = {
		'appsFlyerDevKey': 'MY_APPSFLYER_DEVKEY',
		'appleAppID' : 'MY_APP_ID',
		'isDebug' : true
	}
	appsflyer.initialise(config);
} else if (OS_ANDROID) {
	// Code for Android initialization here
}
