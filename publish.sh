#format sourcecode first
go fmt ./src/*.go

#disable cgo
export CGO_ENABLED=0

#get executable file name from input
read -p "可执行文件名" ExecFileName

#build binary files for linux
export GOOS="linux"
#amd64
export GOARCH="amd64"
go build -o ${ExecFileName}_x64 ./src/*.go
#arm
export GOARCH="arm"
go build -o ${ExecFileName}_arm64 ./src/*.go

#build binary files for ms_windows
export GOOS="windows"
#arm
go build -o ${ExecFileName}_arm64.exe ./src/*.go
#i386
export GOARCH="386"
go build -o ${ExecFileName}_x86.exe ./src/*.go
#amd64
export GOARCH="amd64"
go build -o ${ExecFileName}_x64.exe ./src/*.go

:<<!
#build binary files for MacOS X
export GOOS="darwin"
#amd64
go build -o ${ExecFileName}_x64 ./src/*.go
#arm
export GOARCH="arm"
go build -o ${ExecFileName}_arm64 ./src/*.go
!
