XXX
# route-override: Meta CNI plugin for overriding IP route
![Travis CI](https://travis-ci.org/redhat-nfvpe/cni-route-override.svg?branch=master)

## Overview
 route-override IPAM works as meta CNI plugin to override IP route given by previous CNI plugins.
It is useful in a case with [network-attachment-definition](https://github.com/K8sNetworkPlumbingWG/multi-net-spec).

## Supported runtime
 Currently route-override verified its feature with `podman` and `crio`(with Kubernetes).

## Download
Binaries (for 386/amd64) are in [Releases](https://github.com/redhat-nfvpe/cni-route-override/releases).

## Install via daemonset

Installing using the provided daemonset will copy the `route-override` binary to the `/opt/cni/bin` on each machine in your Kubernetes cluster.

```
git clone https://github.com/redhat-nfvpe/cni-route-override.git && cd cni-route-override/
kubectl create -f deployments/daemonset-install.yaml
```

## Example Configuration

```
{
    "cniVersion": "0.3.0",
    "name" : "mymacvlan",
    "plugins": [
    {
        "type": "macvlan",
        "master": "eth1",
        "mode": "bridge",
        "ipam": {
            ...
        }
    },
    {
        "type" : "route-override",
        "flushroutes" : true,
        "delroutes": [
        {
            "dst": "192.168.0.0/24"
        }],
        "addroutes": [
        {
            "dst": "192.168.0.0/24",
            "gw": "10.1.254.254"
        }]
    }
    ]
}
```

## Configuration Reference

* `type`: (string, required): "routing-override"
* `flushroutes`: (bool, optional): true if you flush all routes.
* `flushgateway`: (bool, optional): true if you flush default route (gateway).
* `delroutes`: (object, optional): list of routes add to the container namespace. Each route is a dictionary with "dst" and optional "gw" fields. If "gw" is omitted, value of "gateway" will be used.
* `addroutes`: (object, optional): list of routes add to the container namespace. Each route is a dictionary with "dst" and optional "gw" fields. If "gw" is omitted, value of "gateway" will be used.
* `skipcheck`: (bool, optional): true if you want to skip CNI's check command. Please set true if you will change routes after its launch

## Process Sequence

`route-override` will manipulate the routes as following sequences:

1. flush routes if `flushroutes` is enabled.
1. flush gateway if `flushgateway` is enabled.
1. delete routes in `delroutes` if `delroutes` has route and the route is exists in routes.
1. add routes in `addroutes` if `addroutes` has route.

## Supported Arguments

The following [args conventions](https://github.com/containernetworking/cni/blob/master/CONVENTIONS.md#args-in-network-config) are supported:

* `flushroutes`: (bool, optional): true if you flush all routes (except interface routes and link-local).
* `flushgateway`: (bool, optional): true if you flush default route (gateway).
* `delroutes`: (object, optional): list of routes add to the container namespace. Each route is a dictionary with "dst" and optional "gw" fields. If "gw" is omitted, value of "gateway" will be used.
* `addroutes`: (object, optional): list of routes add to the container namespace. Each route is a dictionary with "dst" and optional "gw" fields. If "gw" is omitted, value of "gateway" will be used.

