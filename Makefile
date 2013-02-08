develop:
	# mozroots --import --sync
	mkdir -p packages
	cd packages && mono --runtime=v4.0 ../.nuget/NuGet.exe install ../SharpRaven/packages.config
	cd packages && mono --runtime=v4.0 ../.nuget/NuGet.exe install ../SharpRaven.CaptureTest/packages.config

build:
	xbuild SharpRaven.sln

test: build
	mono --runtime=v4.0 packages/xunit.runners.1.9.1/tools/xunit.console.exe SharpRaven.CaptureTest/bin/Debug/SharpRaven.dll
