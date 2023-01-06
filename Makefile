wg-go-framework: wg-go-iphoneos wg-go-iphonesimulator
	rm -rf Sources/WireGuardKitGo/out/WireGuardKitGo.xcframework

	mkdir -p Sources/WireGuardKitGo/.tmp/Headers
	cp Sources/WireGuardKitGo/*.h Sources/WireGuardKitGo/.tmp/Headers/

	mkdir -p Sources/WireGuardKitGo/.tmp/Modules
	cp Sources/WireGuardKitGo/*.modulemap Sources/WireGuardKitGo/.tmp/Modules/

	for id in ios-arm64 ios-arm64_x86_64-simulator ; \
	do \
		mkdir -p Sources/WireGuardKitGo/out/$$id/WireGuardKitGo.framework ; \
		cp Sources/WireGuardKitGo/out/$$id/libwg-go.a Sources/WireGuardKitGo/out/$$id/WireGuardKitGo.framework/WireGuardKitGo ; \
		cp -R Sources/WireGuardKitGo/.tmp/Headers Sources/WireGuardKitGo/out/$$id/WireGuardKitGo.framework ; \
		cp -R Sources/WireGuardKitGo/.tmp/Modules Sources/WireGuardKitGo/out/$$id/WireGuardKitGo.framework ; \
	done

	xcodebuild -create-xcframework \
		-framework Sources/WireGuardKitGo/out/ios-arm64/WireGuardKitGo.framework \
		-framework Sources/WireGuardKitGo/out/ios-arm64_x86_64-simulator/WireGuardKitGo.framework \
		-output Sources/WireGuardKitGo/out/WireGuardKitGo.xcframework

wg-go-iphoneos:
	$(MAKE) -C Sources/WireGuardKitGo clean
	$(MAKE) -C Sources/WireGuardKitGo DEPLOYMENT_TARGET_CLANG_FLAG_NAME=mios-version-min DEPLOYMENT_TARGET_CLANG_ENV_NAME=IPHONEOS_DEPLOYMENT_TARGET IPHONEOS_DEPLOYMENT_TARGET=12.0 ARCHS=arm64 PLATFORM_NAME=iphoneos "CONFIGURATION_BUILD_DIR=$(CURDIR)/Sources/WireGuardKitGo/out/ios-arm64"

wg-go-iphonesimulator:
	$(MAKE) -C Sources/WireGuardKitGo clean
	$(MAKE) -C Sources/WireGuardKitGo DEPLOYMENT_TARGET_CLANG_FLAG_NAME=mios-version-min DEPLOYMENT_TARGET_CLANG_ENV_NAME=IPHONEOS_DEPLOYMENT_TARGET IPHONEOS_DEPLOYMENT_TARGET=12.0 "ARCHS=arm64 x86_64" PLATFORM_NAME=iphonesimulator "CONFIGURATION_BUILD_DIR=$(CURDIR)/Sources/WireGuardKitGo/out/ios-arm64_x86_64-simulator"
