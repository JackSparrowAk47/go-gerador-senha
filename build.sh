#!/bin/sh

platforms="windows/amd64 linux/amd64 darwin/amd64 darwin/arm64"

for platform in $platforms; do
    GOOS=$(echo $platform | cut -d'/' -f1)
    GOARCH=$(echo $platform | cut -d'/' -f2)
    output="bin-$GOOS-$GOARCH"

    if [ "$GOOS" = "windows" ]; then
        output="$output.exe"
    fi

    echo "Building for $GOOS/$GOARCH..."
    env GOOS="$GOOS" GOARCH="$GOARCH" go build -o cmd/bin/"$output" cmd/app/main.go
done

echo "Build finalizado!"
