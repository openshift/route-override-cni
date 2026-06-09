module github.com/redhat-nfvpe/cni-route-override

go 1.20

require (
	github.com/containernetworking/cni v1.1.2
	github.com/containernetworking/plugins v0.8.3
	github.com/onsi/ginkgo v1.16.4
	github.com/onsi/gomega v1.17.0
	github.com/vishvananda/netlink v1.0.0
)

require (
	github.com/fsnotify/fsnotify v1.4.9 // indirect
	github.com/nxadm/tail v1.4.8 // indirect
	github.com/vishvananda/netns v0.0.0-20180720170159-13995c7128cc // indirect
	golang.org/x/net v0.0.0-20210428140749-89ef3d95e781 // indirect
	golang.org/x/sys v0.0.0-20210423082822-04245dca01da // indirect
	golang.org/x/text v0.3.6 // indirect
	gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7 // indirect
	gopkg.in/yaml.v2 v2.4.0 // indirect
)

replace gopkg.in/yaml.v2 => gopkg.in/yaml.v2 v2.2.8
