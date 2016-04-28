//
//  AppBundleUtility.swift
//  Yoshi
//
//  Created by Michael Campbell on 1/4/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

/// Utility for retrieving items from the App Bundle
internal class AppBundleUtility: NSObject {

    /**
     The application version + build number text.

     - returns: The application version.
     */
    class func appVersionText() -> String {
        return "Version \(AppBundleUtility.appVersionNumber())"
            + " (\(AppBundleUtility.appBuildNumber()))"
    }

    /**
     The bundle icon.

     - returns: The bundle icon, if any.
     */
    class func icon() -> UIImage? {
        let appBundleIconsKey = "CFBundleIcons"
        let appBundlePrimaryIconKey = "CFBundlePrimaryIcon"
        let iconFilesKey = "CFBundleIconFiles"

        guard let icons = NSBundle.mainBundle().infoDictionary?[appBundleIconsKey] as? [String: AnyObject],
            let primaryIcons = icons[appBundlePrimaryIconKey] as? [String: AnyObject],
            let iconFiles = primaryIcons[iconFilesKey] as? [String],
            let iconImageName = iconFiles.last else {
            return nil
        }

        return UIImage(named: iconImageName)
    }

    /**
     The application display name.

     - returns: The appplication display name.
     */
    class func appDisplayName() -> String {
        let appDisplayNameDictionaryKey = "CFBundleName"
        return NSBundle.mainBundle().objectForInfoDictionaryKey(appDisplayNameDictionaryKey) as? String ?? ""
    }

    /**
     The application version number.

     - returns: The application version number.
     */
    private class func appVersionNumber() -> String {
        let appVersionNumberDictionaryKey = "CFBundleShortVersionString"
        return NSBundle.mainBundle().objectForInfoDictionaryKey(appVersionNumberDictionaryKey) as? String ?? ""
    }

    /**
     The application build number.

     - returns: The application build number.
     */
    private class func appBuildNumber() -> String {
        let appBuildNumberDictionaryKey = "CFBundleVersion"
        return NSBundle.mainBundle().objectForInfoDictionaryKey(appBuildNumberDictionaryKey) as? String ?? ""
    }

}