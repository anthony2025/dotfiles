function disable_itunes --description 'disables the media keys opening apple music on a mac'
    launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist
end
