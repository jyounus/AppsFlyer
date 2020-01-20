/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2019 by Axway, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 *
 * Warning: This file is GENERATED, and should not be modified
 */
package co.uk.devpulse.appsflyer;

import org.appcelerator.kroll.common.KrollSourceCodeProvider;
import org.appcelerator.kroll.util.KrollAssetHelper;

public class CommonJsSourceProvider implements KrollSourceCodeProvider
{
	public String getSourceCode()
	{
		return getSourceCode("co.uk.devpulse.appsflyer");
	}

	public String getSourceCode(String module)
	{
		if (module.equals("${moduleid}/co.uk.devpulse.appsflyer")) {
			module = "co.uk.devpulse.appsflyer";
		}

		return KrollAssetHelper.readAsset("Resources/" + module + ".js");
	}
}
