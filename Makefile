wg-go-all: wg-go-iphoneos wg-go-iphonesimulator wg-go.xcconfig

wg-go-iphoneos:
	$(MAKE) -C Sources/WireGuardKitGo clean
	$(MAKE) -C Sources/WireGuardKitGo DEPLOYMENT_TARGET_CLANG_FLAG_NAME=mios-version-min DEPLOYMENT_TARGET_CLANG_ENV_NAME=IPHONEOS_DEPLOYMENT_TARGET IPHONEOS_DEPLOYMENT_TARGET=12.0 ARCHS=arm64 PLATFORM_NAME=iphoneos "CONFIGURATION_BUILD_DIR=$(CURDIR)/Sources/WireGuardKitGo/out/ios-arm64"

wg-go-iphonesimulator:
	$(MAKE) -C Sources/WireGuardKitGo clean
	$(MAKE) -C Sources/WireGuardKitGo DEPLOYMENT_TARGET_CLANG_FLAG_NAME=mios-version-min DEPLOYMENT_TARGET_CLANG_ENV_NAME=IPHONEOS_DEPLOYMENT_TARGET IPHONEOS_DEPLOYMENT_TARGET=12.0 "ARCHS=arm64 x86_64" PLATFORM_NAME=iphonesimulator "CONFIGURATION_BUILD_DIR=$(CURDIR)/Sources/WireGuardKitGo/out/ios-arm64_x86_64-simulator"

wg-go.xcconfig:
	@echo "LIBRARY_SEARCH_PATHS[sdk=iphoneos*] = \$$(inherited) $(CURDIR)/Sources/WireGuardKitGo/out/ios-arm64" > wg-go.xcconfig
	@echo "LIBRARY_SEARCH_PATHS[sdk=iphonesimulator*] = \$$(inherited) $(CURDIR)/Sources/WireGuardKitGo/out/ios-arm64_x86_64-simulator" >> wg-go.xcconfig
