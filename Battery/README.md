# Battery
This is a simple tool for checking laptop battery percent and charging status on unix systems. Meant specifically for use with DWM status bar.

## Installation
Compile the binary, mark it as executable and move it to a directory in PATH.

```bash
go build battery.go

chmod +x battery

mv battery /usr/local/bin/
```

## Requirements
* Go
* A nerd font installed for the icons.

## Usage
.xinitrc (DWM):
```bash
while true; do
    xsetroot -name "$(battery)"
    sleep 1m
done&
```
