module github.com/redhat-nfvpe/cni-route-override

go 1.22.0

toolchain go1.22.12

require (
	github.com/containernetworking/cni v1.3.0
	github.com/containernetworking/plugins v0.8.3
	github.com/onsi/ginkgo v1.16.4
	github.com/onsi/gomega v1.34.1
	github.com/vishvananda/netlink v1.0.0
)

require (
	github.com/fsnotify/fsnotify v1.4.9 // indirect
	github.com/google/go-cmp v0.6.0 // indirect
	github.com/nxadm/tail v1.4.8 // indirect
	github.com/vishvananda/netns v0.0.4 // indirect
	golang.org/x/exp v0.0.0-20240719175910-8a7402abbf56 // indirect
	golang.org/x/net v0.28.0 // indirect
	golang.org/x/sys v0.23.0 // indirect
	golang.org/x/text v0.17.0 // indirect
	gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)

replace gopkg.in/yaml.v2 => gopkg.in/yaml.v2 v2.2.8
